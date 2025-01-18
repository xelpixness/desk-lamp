cmake_minimum_required(VERSION 3.16)

project(desk-lamp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appdesk-lamp
    main.cpp
)

qt_add_qml_module(appdesk-lamp
    URI desk-lamp
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES LampButton.qml
    RESOURCES
        images/up.png
        images/down.png
        images/mode.png
        images/power.png
        SOURCES lightbulb.h lightbulb.cpp
        SOURCES controller.h controller.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appdesk-lamp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appdesk-lamp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appdesk-lamp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appdesk-lamp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
