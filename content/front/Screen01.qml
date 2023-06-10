import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../imports"
import "../Adas"

Item {
    id: container

    function incrementNumber(num) {
      num++;
      if (num > 3) {
        num = 0;
      }
      return num;
    }

    width: mainwind.width
    height: mainwind.height// mainLoader.height
    Keys.onRightPressed: speedguageLeft.increaseSpeed()
    Keys.onLeftPressed: speedguageLeft.decreaseSpeed()
    Keys.onDownPressed: { battguage.decreaseCharge() } //onDigit0Pressed
    Keys.onUpPressed: { battguage.increaseCharge() }
    //Keys.onDigit0Pressed: {if (gear.currentDriveMode === 0) {gear.currentDriveMode = 1} else {gear.currentDriveMode = 0}  }
    Keys.onDigit0Pressed: {gear.currentDriveMode = (gear.currentDriveMode === 0) ? 1 : 0;}
    Keys.onPressed: { if (event.key === Qt.Key_R) {
                            range.currentRange +=1 ;
                        }
                        else if (event.key === Qt.Key_M) {
                             gear.currentGear = incrementNumber(gear.currentGear) ;
                        }
                        else if (event.key === Qt.Key_D) {
                            bottomBar.odometerDistance += 1;
                        }
                        else if (event.key === Qt.Key_T) {
                            bottomBar.currentTemp += 1
                            //console.log("Key M pressed");
                        }
                        else if (event.key === Qt.Key_L) {
                            tellTales.toggleVisibilityLeft()
                        }
                        else if (event.key === Qt.Key_P) {
                            tellTales.toggleVisibilityRight()
                        }

                    }


    Component.onCompleted: {
        forceActiveFocus()
    }

    Image {
        id: backgrounddark
        source: "qrc:/content/assets/background-dark.png"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors {
            fill: parent
            centerIn: parent
            //horizontalCenter: parent.horizontalCenter
            top: parent.top
            //bottom: parent.bottom
        }
//        Image {
//            id: road
//            source: "qrc:/content/assets/road.png"
//            fillMode: Image.PreserveAspectFit
//            anchors {
//                horizontalCenter: parent.horizontalCenter
//                bottom: parent.bottom
//            }
//        }
        SpeedGauge {
            id:speedguageLeft
            anchors {

            }
        }

        Adas{
            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
            width: parent.width * 0.5
            height: parent.height * 0.85
            z:4
        }

        BatteryGauge {
            id: battguage
            anchors {
                id: batterygu
                right: parent.right
            }
        }
        Gear {
            id: gear
            //y: 330
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: Math.round(mainwind.width * 0.0167)//32
            currentGear: 1
        }
        Range {
            id: range
            x: 1647
            y: 100
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.verticalCenterOffset: -202
            anchors.rightMargin: 32
            currentRange: 351
        }

        BottomBar {
            id: bottomBar
            //y: 624
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: speedguageLeft.bottom
            anchors.topMargin: -Math.round(mainwind.width * 0.052) //100
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            currentTemp: 15
        }

        Telltales {
            id: tellTales
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
        }
    }
}

