import QtQuick 2.8
import DigitalCluster 1.0
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: ttbar
    width: 1920
    height: 64
    color: "#000000"
    Row {
        id: row
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 1681
        anchors.leftMargin: 76
        spacing: 20

        Item {
            id: beam
            width: 64
            height: 64
            Image {
                id: lowbeam
                x: -6
                y: 0
                opacity: Car3dControl.frontLightsOn ? 1.0 : 0.2
                source: "../controlPanel/assets/icon-low-beam.svg"
                layer.enabled: true
                layer.effect: ColorOverlayEffect {
                    id: colorOverlay
                    color: "#1fff5d"
                }
                sourceSize.height: 64
                sourceSize.width: 64
            }
        }

        Item {
            id: beam2
            width: 64
            height: 64
            Image {
                id: highbeam
                x: -27
                y: 0
                opacity: Car3dControl.highBeamOn ? 1.0 : 0.2
                source: "../controlPanel/assets/icon-high-beam.svg"
                layer.enabled: true
                layer.effect: ColorOverlayEffect {
                    id: colorOverlay2
                    color: "#1fff5d"
                }
                sourceSize.height: 64
                sourceSize.width: 64
            }
        }
    }

    Image {
        id: laneCenteringAssist
        x: 201
        y: 0
        width: 64
        source: "../images/LaneCenteringAssist.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: turnLeft
        x: 8
        y: 11
        source: "../images/TurnLeft.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: laneKeepingAssistance
        x: 1779
        y: 14
        source: "../images/LaneKeepingAssistance.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: seatBelt
        x: 1732
        y: 12
        source: "../images/SeatBelt.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: speedLimiter
        x: 1662
        y: -3
        width: 64
        height: 64
        source: "../images/SpeedLimiter.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: turnRight
        x: 1854
        y: 11
        source: "../images/TurnRight.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        x: 784
        y: 12
        color: "#f3f3f3"
        text: qsTr("Digital Instrument Cluster")
        font.pixelSize: 30
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:64;width:1920}D{i:3}D{i:2}D{i:6}D{i:5}D{i:1}D{i:8}
D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}D{i:14}
}
##^##*/

