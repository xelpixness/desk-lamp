import QtQuick

Item {
  id: root
  property color colorBorder: "#09122c"
  property color colorNormal: "#e17564"
  property color colorPressed: "#872341"
  property color colorHover: "#be3144"

  property string source: ""

  signal clicked()

  Rectangle {
    id: body
    radius: width
    border.width: 2
    border.color: root.colorBorder
    anchors.fill: parent
    color: root.colorNormal

    MouseArea {
      id: area
      anchors.fill: parent
      hoverEnabled: true
      onPressed: {
        body.color = root.colorPressed
        root.clicked()
      }

      onReleased: {
        body.color = root.colorHover
      }

      onEntered: {
        body.color = root.colorHover
      }

      onExited: {
        body.color = root.colorNormal
      }
    }

    Image {
      id: image
      width: parent.width / 2
      height: parent.height / 2
      anchors.centerIn: parent
      fillMode: Image.PreserveAspectFit
      source: root.source
    }
  }
}
