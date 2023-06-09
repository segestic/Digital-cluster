import QtQuick 2.15

Rectangle {
    id: ttbar
    width: 1920 //Math.round(mainwind.width)
    height: 64 //Math.round(mainwind.width * 0.033 )
    color: "#000000"

    function toggleVisibilityLeft() {
        turnLeft.visible = !turnLeft.visible;
    }

    function toggleVisibilityRight() {
        turnRight.visible = !turnRight.visible;
    }
    Image {
        id: turnLeft
        x: 8
        y: 11
        source: "qrc:/content/assets/TurnLeft.png"
        fillMode: Image.PreserveAspectFit
    }

    Row {
        id: row
        anchors.left: turnLeft.right//parent.left
        anchors.leftMargin: 10 //Math.round(mainwind.width * 0.005)
        anchors.top: parent.top
        //anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        //anchors.rightMargin: 1681

        spacing: 5

        Item {
            id: beam
            width: 64
            height: 64
            Image {
                id: lowbeam
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
        //x: 201
        //y: 0
        anchors.left: row.right
        anchors.leftMargin: 5
        width: 64
        source: "qrc:/content/assets/LaneCenteringAssist.png"
        fillMode: Image.PreserveAspectFit
    }



    //right indicators
    Image {
        id: speedLimiter
        width: 64
        height: 64
        source: "qrc:/content/assets/SpeedLimiter.png"
        anchors.right: seatBelt.left
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: seatBelt
        anchors.right: laneKeepingAssistance.left
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/SeatBelt.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: laneKeepingAssistance
        anchors.right: turnRight.left
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/LaneKeepingAssistance.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: turnRight
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/TurnRight.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: text1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        color: "#f3f3f3"
        text: qsTr("Digital Instrument Cluster")
        font.pixelSize: 30
    }
}
