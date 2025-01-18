#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include "lightbulb.h"
#include "controller.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);


    qmlRegisterType<LightBulb>("com.company.lightbulb", 1, 0, "LightBulb");
    qmlRegisterType<Controller>("com.company.controller", 1, 0, "Controller");

    QQmlApplicationEngine engine;

    LightBulb bulb;
    engine.rootContext()->setContextProperty("bulb", &bulb);

    Controller controller(bulb);
    engine.rootContext()->setContextProperty("controller", &controller);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("desk-lamp", "Main");


    return app.exec();
}
