import QtQuick 2.15
import "../../imports"

Item {
    id: bottomBar
    width: Math.round(mainwind.width)//1920
    height: Math.round(mainwind.height * 0.13)//96
    property alias odometerDistance: odometerController.distance
    property alias currentTime: clock.currentTime
    property alias currentTemp: temperature.currentTemp

    Item {
        id: media
        x: 1446
        y: 12
        width: Math.round(mainwind.width * 0.23)//450
        height: Math.round(mainwind.height * 0.1)//72
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 24
        Item {
            id: cover
            x: 382
            y: 4
            width: 64
            height: 64
            Image {
                id: cover1
                x: -10
                y: -2
                source: "qrc:/content/assets/media-cover-1.png"
            }
        }

        SvgPathItem {
            id: progressBackground
            x: 378
            y: 0
            width: 72
            height: 72
            strokeWidth: 2
            strokeColor: "#ffffff"
            path: "M 60.39606857299805 67.76038360595703 C 53.67689514160156 72.60968399047852 44.64339065551758 72.85560607910156 33.9702262878418 70.71571350097656 C 23.18033218383789 68.55242919921875 15.322839736938477 65.03169250488281 9.867791175842285 58.62093734741211 C 4.487765789031982 52.29834747314453 1.953743040561676 43.74332046508789 0.40614181756973267 32.743927001953125 C -0.42165035009384155 26.860488891601562 0.008101940155029297 21.84857749938965 1.7675156593322754 17.624656677246094 C 3.547547221183777 13.351236343383789 6.540717840194702 10.240045309066772 10.20304012298584 7.945682048797607 C 17.21717882156372 3.551481246948242 27.182905197143555 1.9140843451023102 36.94093322753906 0.38985076546669006 C 48.47727966308594 -1.4121623933315277 58.073829650878906 3.1662893295288086 64.25808715820312 11.366222381591797 C 70.33966445922852 19.430011749267578 73.01069641113281 30.78752899169922 71.65320587158203 42.78325271606445 C 70.3508529663086 54.29171371459961 67.12320709228516 62.90534210205078 60.39606857299805 67.76038360595703 Z"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: progress
            x: 415
            y: 0
            width: 35
            height: 68
            strokeWidth: 2
            strokeColor: "#ffffff"
            path: "M 23.455135345458984 67.76038360595703 C 30.182273864746094 62.90534210205078 33.40991973876953 54.29171371459961 34.71227264404297 42.78325271606445 C 36.06976318359375 30.78752899169922 33.39873123168945 19.430011749267578 27.317153930664062 11.366222381591797 C 21.132896423339844 3.1662893295288086 11.536346435546875 -1.4121623933315277 0 0.38985076546669006"
            fillColor: "transparent"
        }

        Item {
            id: song
            x: 0
            y: 13
            width: 355
            height: 46
            Text {
                id: songName
                x: 0
                y: 0
                width: 355
                height: 29
                color: "white"
                text: "Crossroad Of Yesterday"
                font.pixelSize: 24
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Normal
                font.family: Constants.font.family
            }

            Text {
                id: artistName
                x: 0
                y: 29
                width: 355
                height: 17
                color: "#d3d3d3"
                text: "QUICK TORCH"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                font.weight: Font.Medium
                font.family: Constants.font.family
            }
        }
    }

    Row {
        id: row
        y: 0
        width: 572
        height: 46
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 32
        spacing: 72

        OdometerController {
            id: odometerController
        }

        Temperature {
            id: temperature
        }

        Clock {
            id: clock
        }
    }
}
