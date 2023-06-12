import QtQuick 2.15

Rectangle {
    id: ttbar
    width: Math.round(mainwind.width)
    height: Math.round(mainwind.width * 0.033)//64 //Math.round(mainwind.width * 0.033 )
    color: "#000000"

    function toggleVisibilityLeft() {
        turnLeft.visible = !turnLeft.visible;
    }

    function toggleVisibilityRight() {
        turnRight.visible = !turnRight.visible;
    }
    Image {
        id: turnLeft
//        x: 8
//        y: 11
        anchors.left: parent.left
        anchors.leftMargin: Math.round(mainwind.width * 0.004)
        source: "qrc:/content/assets/TurnLeft.png"
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
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

        spacing: Math.round(mainwind.width * 0.002)

        Item {
            id: beam
            width: Math.round(mainwind.width * 0.033)//64
            height: Math.round(mainwind.width * 0.033)//64
            Image {
                id: lowbeam
                opacity: Car3dControl.frontLightsOn ? 1.0 : 0.2
                source: "qrc:/content/assets/controlpanel/icon-low-beam.svg"
                layer.enabled: true
                layer.effect: ColorOverlayEffect {
                    id: colorOverlay
                    color: "#1fff5d"
                }
                sourceSize.height: Math.round(mainwind.width * 0.033)//64
                sourceSize.width: Math.round(mainwind.width * 0.033)//64
            }
        }

        Item {
            id: beam2
            width: Math.round(mainwind.width * 0.033)//64
            height: Math.round(mainwind.width * 0.033)//64
            Image {
                id: highbeam
                opacity: Car3dControl.highBeamOn ? 1.0 : 0.2
                source: "qrc:/content/assets/controlpanel/icon-high-beam.svg"
                layer.enabled: true
                layer.effect: ColorOverlayEffect {
                    id: colorOverlay2
                    color: "#1fff5d"
                }
                sourceSize.height: Math.round(mainwind.width * 0.033)//64
                sourceSize.width: Math.round(mainwind.width * 0.033)//64
            }
        }
    }


    Image {
        id: laneCenteringAssist
        //x: 201
        //y: 0
        anchors.left: row.right
        anchors.leftMargin: 5
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
        source: "qrc:/content/assets/LaneCenteringAssist.png"
        fillMode: Image.PreserveAspectFit
    }



    //right indicators
    Image {
        id: speedLimiter
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
        source: "qrc:/content/assets/SpeedLimiter.png"
        anchors.right: seatBelt.left
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: seatBelt
        anchors.right: laneKeepingAssistance.left
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/SeatBelt.png"
        fillMode: Image.PreserveAspectFit
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
    }
    Image {
        id: laneKeepingAssistance
        anchors.right: turnRight.left
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/LaneKeepingAssistance.png"
        fillMode: Image.PreserveAspectFit
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
    }

    Image {
        id: turnRight
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/content/assets/TurnRight.png"
        fillMode: Image.PreserveAspectFit
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
    }

    Text {
        id: text1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        horizontalAlignment: Text.AlignHCenter
        width: Math.round(mainwind.width * 0.033)//64
        height: Math.round(mainwind.width * 0.033)//64
        color: "#f3f3f3"
        text: qsTr("Digital Instrument Cluster")
        font.pixelSize: Math.round(mainwind.width * 0.019)//30
    }
}
