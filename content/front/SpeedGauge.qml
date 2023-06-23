import QtQuick 2.15
import QtGraphicalEffects 1.0
import "../../imports"
//import QtQuick.Effects 1.15

Item {
    id: speedGauge
    width: Math.round(mainwind.width * 0.375)//720
    height: Math.round(mainwind.width * 0.375)//720
    property real speed: 0

    function increaseSpeed(value1) {
        if (newSpeedNeedle.value <= 199) {
            speedGauge.speed += value1
            //speedGauge.speed += 1;
            newSpeedNeedle.value = speedGauge.speed
        }
    }

    function decreaseSpeed() {
        if (newSpeedNeedle.value > 0) {
            speedGauge.speed -= 1
            newSpeedNeedle.value = speedGauge.speed
        }
    }

    //debug
//    QtObject{
//        id:mainwind
//        property real width: 1350
//        property real height: 506

//    }

    Image {
        id: speedBlobShadow1
        x: 92
        y: 604
        width: Math.round(mainwind.width * 0.185)//356
        height: Math.round(mainwind.width * 0.017)//32
        visible: true
        source: "qrc:/content/assets/blob-shadow.png"
    }

    Image {
        id: newSpeed
//        x: 92
//        y: 91
        anchors.centerIn: parent
        source: "qrc:/content/assets/SpeedGaugeAssetEmpty.png"
        width: Math.round(mainwind.width * 0.286)//549
        height: Math.round(mainwind.width * 0.283)//545


        CircularNeedle {
            id: newSpeedNeedle
            source: "qrc:/content/assets/needleCoolMode.png"
            visible: true
            anchors.horizontalCenter: newSpeed.horizontalCenter
            anchors.top: newSpeed.top//parent.top
            anchors.topMargin: -70//-1 * Math.round(mainwind.width * 0.417)//-80
            value: speedGauge.speed
            tranformOriginX: newSpeedNeedle.width / 2  + 4
            tranformOriginY: newSpeedNeedle.height + 57
            minAngleDegree: -133
            maxAngleDegree: 136
            minValue: 0
            maxValue: 200
            width: Math.round(mainwind.width * 0.0672) //129
            height: Math.round(mainwind.width * 0.15) //295

        }
    }



    SpeedBlob {
        id: speedBlob
//        x: 30
//        y: 19
        width: Math.round(mainwind.width * 0.351) //674
        height: Math.round(mainwind.width * 0.375) //720
        opacity: 1
        visible: false
        speed: 10
    }

    Item {
        id: speed
        width: Math.round(mainwind.width * 0.1083) //208
        height: Math.round(mainwind.width * 0.064) //122
        anchors.horizontalCenter: newSpeed.horizontalCenter
        anchors.top: newSpeed.verticalCenter
        anchors.topMargin:  -Math.round(width * 0.1)

        Text {
            id: speedValue
            //x: 0
            //y: 0
            width: Math.round(mainwind.width * 0.098) //188
            height: Math.round(mainwind.width * 0.06) //115
            color: "#75bbf0" //"white"
            text: Math.round(speedGauge.speed)
            font.pixelSize: Math.round(mainwind.width * 0.04) //96
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.styleName: "Regular"
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.horizontalCenterOffset: 16
            font.weight: Font.Medium
            font.family: Constants.font.family
        }

        Text {
            id: speedLabel
            //x: 60
            //y: 98
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.horizontalCenterOffset: 21
            anchors.top: speedValue.bottom
            anchors.topMargin: -20
            width: Math.round(mainwind.width * 0.031) //48
            height: Math.round(mainwind.width * 0.0125)//24
            //color: Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            color: "white"
            text: "km/h"
            font.pixelSize: Math.round(mainwind.width * 0.010)//20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap

            font.styleName: "Regular"
            font.family: Constants.font.family
        }
    }

    Image {
        id: speedoRing
        x: 222
        y: 221
        opacity: 0
        visible: true
        source: "qrc:/content/assets/speedoRing.png"
        layer.enabled: true
        layer.effect: ColorOverlayEffect {
            id: colorOverlay
            color: "white"//Themes.speedoRingColor
        }
        fillMode: Image.PreserveAspectFit

        Image {
            id: speedoPointer
            x: 0
            y: 0
            source: "qrc:/content/assets/speedoPointer.png"
            rotation: speedGauge.speed * 1.2 - 30
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    states: [
        State {
            name: "speedZero"

            //when: Car3dControl.viewState == "adas"
            PropertyChanges {
                target: speedBlobShadow1
                x: 228
                width: 340
            }

            PropertyChanges {
                target: speedBlob
                opacity: 1
            }
        },
        State {
            name: "speedNormal"

            //when: Car3dControl.viewState == "adas"
            PropertyChanges {
                target: speedBlobShadow1
                x: 220 - 45 + speedGauge.speed / 2
            }

            PropertyChanges {
                target: speedBlob
                opacity: 1
            }
        },
        State {
            name: "speedSimple"

            //when: Car3dControl.viewState !== "adas"
            PropertyChanges {
                target: speedoRing
                opacity: 1
                visible: true
            }

            PropertyChanges {
                target: speedBlob
                opacity: 0
            }

            PropertyChanges {
                target: speedBlobShadow1
                opacity: 0
                visible: true
            }

            PropertyChanges {
                target: speedValue
                color: Themes.textColor
            }

            PropertyChanges {
                target: speedLabel
                color: Themes.textColor
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                PropertyAnimation {
                    target: speedBlob
                    property: "opacity"
                    duration: 150
                }
                PropertyAnimation {
                    target: speedBlobShadow1
                    property: "width"
                    duration: 150
                }

                PropertyAnimation {
                    target: speedBlobShadow1
                    property: "x"
                    duration: 150
                }

                PropertyAnimation {
                    target: speedoRing
                    property: "opacity"
                    duration: 150
                }
            }

            to: "*"
            from: "*"
        }
    ]
}
