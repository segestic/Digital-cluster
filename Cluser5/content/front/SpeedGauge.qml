import QtQuick 2.15
import QtGraphicalEffects 1.0
import "../../imports"
//import QtQuick.Effects 1.15

Item {
    id: speedGauge
    width: 720
    height: 720
    property real speed: 0

//    Keys.onRightPressed: { increaseSpeed() }
//    Keys.onLeftPressed: { decreaseSpeed() }
    //property alias increase:  increaseSpeed()


//    Component.onCompleted: {
//        forceActiveFocus()
//        //increaseSpeed()
//        //timer.startTimer(increaseSpeed, 120)
//    }

    function increaseSpeed() {
        if (newSpeedNeedle.value <= 199) {
            speedGauge.speed += 1
            newSpeedNeedle.value = speedGauge.speed
        }
//        else {
//            newSpeedNeedle.value -= 10
//        }
    }

    function decreaseSpeed() {
        if (newSpeedNeedle.value > 0) {
            speedGauge.speed -= 1
            newSpeedNeedle.value = speedGauge.speed
        }
    }




//    ColorOverlay {
//        id: colorOverlay
//        color: "#80fff000"
//    }


    Image {
        id: speedBlobShadow1
        x: 92
        y: 604
        width: 356
        height: 32
        visible: true
        source: "qrc:/content/assets/blob-shadow.png"
    }

    Image {
        id: newSpeed
        x: 92
        y: 91
        source: "qrc:/content/assets/SpeedGaugeAssetEmpty.png"
        width: Math.round(mainwind.width * 0.286)//549
        height: Math.round(mainwind.width * 0.283)//545
    }

    CircularNeedle {
        id: newSpeedNeedle
        source: "qrc:/content/assets/needleCoolMode.png"
        visible: true
        x: 301
        y: 20
        value: speedGauge.speed
        tranformOriginX: newSpeedNeedle.width / 2 + 4
        tranformOriginY: newSpeedNeedle.height + 57
        minAngleDegree: -133
        maxAngleDegree: 136
        minValue: 0
        maxValue: 200
    }

    SpeedBlob {
        id: speedBlob
        x: 30
        y: 19
        width: 674
        height: 720
        opacity: 1
        visible: false
        speed: 10
    }

    Item {
        id: speed
        x: 263
        y: 318
        width: 208
        height: 122
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: speedLabel
            x: 60
            y: 98
            width: 48
            height: 24
            //color: Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            color: "white"
            text: "km/h"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.horizontalCenterOffset: 21
            font.styleName: "Regular"
            font.family: Constants.font.family
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: speedValue
            x: 0
            y: 0
            width: 188
            height: 115
            color: "#75bbf0" //"white"
            text: Math.round(speedGauge.speed)
            font.pixelSize: 96
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.horizontalCenterOffset: 15
            font.styleName: "Regular"
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Medium
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
