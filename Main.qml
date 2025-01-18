import QtQuick
import QtQuick.Controls 2.15

import com.company.lightbulb 1.0
import com.company.controller 1.0


Window {
  id: root
  width: 640
  height: 480
  visible: true
  color: "#252525"
  title: qsTr("Desk Lamp")

  property color colorBorderWarm: "#ff6f29"
  property color colorMidWarm: "#ffa350"
  property color colorBigWarm: "#ff7d26"

  property color colorBorderCold: "#577bc1"
  property color colorMidCold: "#2ea6ff"
  property color colorBigCold: "#2e67ff"

  property color colorBorderMixed: "#a1fff6"
  property color colorMidMixed: "#fefff0"
  property color colorBigMixed: "#f0feff"


  function updateUIColor() {
    var temp = ""
    if (bulb.colorTemp === LightBulb.Warm) {
      temp = "Warm"
      bulbBig.color = root.colorBigWarm
      bulbBig.border.color = root.colorBorderWarm
      bulbMid.color = root.colorMidWarm
      bulbMid.border.color = root.colorBorderWarm
    } else if (bulb.colorTemp === LightBulb.Cold) {
      temp = "Cold"
      bulbBig.color = root.colorBigCold
      bulbBig.border.color = root.colorBorderCold
      bulbMid.color = root.colorMidCold
      bulbMid.border.color = root.colorBorderCold
    } else {
      temp = "Mixed"
      bulbBig.color = root.colorBigMixed
      bulbBig.border.color = root.colorBorderMixed
      bulbMid.color = root.colorMidMixed
      bulbMid.border.color = root.colorBorderMixed
    }

    lblColor.text = "Color: " + temp
  }

  Rectangle {
    id: bulbBig
    x: 220
    y: 140
    width: 200
    height: 200
    color: root.colorBigWarm
    radius: width
    border.color: root.colorBorderWarm
    border.width: 5

    focus: true

    Keys.onPressed: (event)=> {
                      if (event.key === Qt.Key_1) {
                        controller.handleInput(Controller.TOGGLE)
                      } else if (event.key === Qt.Key_2) {
                        controller.handleInput(Controller.CHANGE)
                        updateUIColor()
                      } else if (event.key === Qt.Key_3) {
                        controller.handleInput(Controller.DOWN)
                      } else if (event.key === Qt.Key_4) {
                        controller.handleInput(Controller.UP)
                      }
                    }

    Rectangle {
      id: bulbMid
      width: 130
      height: 130
      color: root.colorMidWarm
      radius: width
      border.color: root.colorBorderWarm

      border.width: 6
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
      id: bulbSmall
      width: 40
      height: 40
      radius: width
      color: "#ffffff"
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter

    }

    Rectangle {
      id: bulbOverlay
      width: 202
      height: 202
      visible: true

      opacity: bulb.currentMode === LightBulb.Off ? 1 : 1 - (bulb.intensity / 100)
      radius: width
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      color: "#323131"
    }
  }

  Column {
    x: 528
    y: 110
    spacing: 20

    LampButton {
      id: lampButton
      width: 50
      height: 50
      source: "images/up.png"
      onClicked: {
        controller.handleInput(Controller.UP)
      }
    }

    LampButton {
      id: lampButton1
      width: 50
      height: 50
      source: "images/down.png"
      onClicked: {
        controller.handleInput(Controller.DOWN)
      }
    }

    LampButton {
      id: lampButton2
      width: 50
      height: 50
      source: "images/mode.png"
      onClicked: {
        controller.handleInput(Controller.CHANGE)
        updateUIColor()
      }
    }

    LampButton {
      id: lampButton3
      width: 50
      height: 50
      source: "images/power.png"
      onClicked: {
        controller.handleInput(Controller.TOGGLE)
      }
    }
  }

  Label {
    id: lblIntensity
    x: 160
    y: 47
    color: "#ffffff"
    text: "Intensity: " + bulb.intensity
  }

  Label {
    id: lblMode
    x: 160
    y: 16
    color: "#ffffff"
    text: "Mode: " + (bulb.currentMode === LightBulb.Off ? "Off" : "On");
  }

  Label {
    id: lblColor
    x: 160
    y: 77
    text: "Color: Warm"
  }
}



















