
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/


/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import Abcg 1.0

//import Guages
Item {
    id: container
    width: Constants.width
    height: Constants.height
    Keys.onRightPressed: speedguageLeft.increaseSpeed

    Image {
        id: backgrounddark
        //        x: 533
        //        y: 289
        source: "assets/background-dark.png"
        //source: "assets/blob-shadow.png"
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        anchors {
            fill: parent
            centerIn: parent
            //horizontalCenter: parent.horizontalCenter
            top: parent.top
            //bottom: parent.bottom
        }
        Image {
            id: road
            source: "assets/road.png"
            fillMode: Image.PreserveAspectFit
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
        }
        SpeedGauge {
            anchors {
                id: speedguageLeft
            }
        }
        BatteryGauge {
            anchors {
                id: batterygu
                right: parent.right
            }
        }
    }
} //Rectangle {//    id: rectangle//    width: Constants.width//    height: Constants.height//    color: Constants.backgroundColor//    Button {//        id: button//        text: qsTr("Press me")//        anchors.verticalCenter: parent.verticalCenter//        checkable: true//        anchors.horizontalCenter: parent.horizontalCenter
//        Connections {
//            target: button
//            onClicked: animation.start()
//        }
//    }

//    Text {
//        id: label
//        text: qsTr("Hello Abcg")
//        anchors.top: button.bottom
//        font.family: Constants.font.family
//        anchors.topMargin: 45
//        anchors.horizontalCenter: parent.horizontalCenter

//        SequentialAnimation {
//            id: animation

//            ColorAnimation {
//                id: colorAnimation1
//                target: rectangle
//                property: "color"
//                to: "#2294c6"
//                from: Constants.backgroundColor
//            }

//            ColorAnimation {
//                id: colorAnimation2
//                target: rectangle
//                property: "color"
//                to: Constants.backgroundColor
//                from: "#2294c6"
//            }
//        }
//    }
//    states: [
//        State {
//            name: "clicked"
//            when: button.checked

//            PropertyChanges {
//                target: label
//                text: qsTr("Button Checked")
//            }
//        }
//    ]
//}

