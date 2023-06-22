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
    Keys.onRightPressed: {speedguageLeft.increaseSpeed(1); (speedguageLeft.speed <= 200) ? bottomBar.odometerDistance += 4 : bottomBar.odometerDistance += 0}
    Keys.onReleased: {
        if (event.key == Qt.Key_Right) {
            idleSpeed.start();
            event.accepted = true;
        }
    }
    Keys.onLeftPressed: {speedguageLeft.decreaseSpeed(); (speedguageLeft.speed === 0) ? bottomBar.odometerDistance += 0 : bottomBar.odometerDistance += 1 }
    Keys.onDownPressed: { battguage.decreaseCharge() } //onDigit0Pressed
    Keys.onUpPressed: { battguage.increaseCharge() }
    //Keys.onDigit0Pressed: {if (gear.currentDriveMode === 0) {gear.currentDriveMode = 1} else {gear.currentDriveMode = 0}  }
    Keys.onDigit0Pressed: {gear.currentDriveMode = (gear.currentDriveMode === 0) ? 1 : 0;}
    Keys.onPressed: { if (event.key === Qt.Key_N) {
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
                        else if (event.key === Qt.Key_R) {
                            tellTales.toggleVisibilityRight()
                        }

                    }

    Keys.onTabPressed: {middleInfo.visible = (middleInfo.visible === false) ? true : false}
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
                top: tellTales.top
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

        MiddleInfo{
            id: middleInfo
            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
            visible: false
            z:5
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
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: Math.round(mainwind.width * 0.0167)//32
            currentGear: 1
        }
        Range {
            id: range
            anchors.top: tellTales.bottom
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            //anchors.verticalCenterOffset: -202
            anchors.rightMargin: Math.round(mainwind.width * 0.02)
            currentRange: (300 * (battguage.batteryLevel/100 ) )
        }

        BottomBar {
            id: bottomBar
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

        Timer {
            id: idleSpeed
            interval: 1000 // 1 second
            running: true
            repeat: true
            onTriggered: {
                if (speedguageLeft.speed >= 1) {
                    speedguageLeft.decreaseSpeed();
                    bottomBar.odometerDistance += 1;
                    //console.log("Value is decerasing!")
                }
            }
        }
   }
}

