import QtQuick 2.8
import QtQuick.Studio.Effects 1.0
import DigitalCluster 1.0

Item {
    id: driveMode
    width: 88
    height: 46
    property int currentDriveMode: 0

    Item {
        id: driveModeItem
        height: 23
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        clip: true
        layer.enabled: true
        layer.effect: OpacityMaskEffect {
            id: opacityMask
            invert: true
            maskSource: mask
        }
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Text {
            id: driveModeName
            x: 0
            y: 0

            width: 65
            height: 44
            color: Themes.labelColor
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: Constants.font.family

            text: "SPORT CITY"
        }
        Rectangle {
            id: mask
            y: 0

            height: 23
            visible: false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 0.8995
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 0.10021
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 1
                    color: "#ffffff"
                }
            }
            clip: true
        }
    }

    states: [
        State {
            name: "sportMode"
            when: driveMode.currentDriveMode === 0
        },
        State {
            name: "cityMode"
            when: driveMode.currentDriveMode === 1

            PropertyChanges {
                target: driveModeName
                x: 0
                y: -22
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: driveModeName
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: driveModeName
                        property: "y"
                        duration: 150
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#000000";formeditorZoom:1.66;height:46;width:88}D{i:13;transitionDuration:2000}
D{i:3}D{i:4}D{i:1}
}
##^##*/

