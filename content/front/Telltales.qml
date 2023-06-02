import QtQuick 2.15

Rectangle {
    id: ttbar
    width: 1920
    height: 64
    color: "#000000"

    function toggleVisibilityLeft() {
        turnLeft.visible = !turnLeft.visible;
    }

    function toggleVisibilityRight() {
        turnRight.visible = !turnRight.visible;
    }

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
                source: "qrc:/content/assets/controlpanel/icon-low-beam.svg"
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
                source: "qrc:/content/assets/controlpanel/icon-high-beam.svg"
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
        source: "qrc:/content/assets/LaneCenteringAssist.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: turnLeft
        x: 8
        y: 11
        source: "qrc:/content/assets/TurnLeft.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: laneKeepingAssistance
        x: 1779
        y: 14
        source: "qrc:/content/assets/LaneKeepingAssistance.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: seatBelt
        x: 1732
        y: 12
        source: "qrc:/content/assets/SeatBelt.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: speedLimiter
        x: 1662
        y: -3
        width: 64
        height: 64
        source: "qrc:/content/assets/SpeedLimiter.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: turnRight
        x: 1854
        y: 11
        source: "qrc:/content/assets/TurnRight.png"
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
