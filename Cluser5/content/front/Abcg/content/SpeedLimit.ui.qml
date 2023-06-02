import QtQuick 2.8
//import QtQuick.Studio.Components 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import DigitalCluster 1.0

Item {
    id: speedLimit
    width: 64
    height: 64
    property string value: "120"

    Image {
        id: speedLimitSign
        x: -8
        y: -8
        source: "assets/4c8a3c86-0b1e-559f-8480-77ec885c2c60.png"
    }

    Text {
        id: speedLimitValue
        x: 0
        y: 0
        width: 64
        height: 64
        color: "#000000"
        text: speedLimit.value !== "0" ? speedLimit.value : speedLimitValue.text
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Bold
        font.family: Constants.font.family
    }
    states: [
        State {
            name: "noLimits"
            when: speedLimit.value === "0"

            PropertyChanges {
                target: speedLimitSign
                opacity: 0
            }

            PropertyChanges {
                target: speedLimitValue
                opacity: 0
            }
        },
        State {
            name: "limitSet"
            when: speedLimit.value !== "0"
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: speedLimitSign
                        property: "opacity"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: speedLimitValue
                        property: "opacity"
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
    D{i:0;height:64;width:64}D{i:7;transitionDuration:2000}
}
##^##*/

