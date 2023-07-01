import QtQuick 2.8
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import "../../imports"


Item {
    id: batteryGauge
    width: parseInt(Math.round(mainwind.height)) //720 //Constants.height
    height: parseInt(Math.round(mainwind.height)) //720
    state: "blobState"
    property alias batteryState: batteryBlob.batteryState
    property alias batteryLevel: batteryBlob.batteryLevel

    //debug
//    QtObject{
//        id:mainwind
//        property real width: 1350
//        property real height: 506
//    }

    function decreaseCharge() {
        if (batteryBlob.batteryLevel >= 1) {
            batteryBlob.batteryLevel -= 1
            //newSpeedNeedle.value = speedGauge.speed
        }
    }

    function increaseCharge() {
        if (batteryBlob.batteryLevel < 100) {
            batteryBlob.batteryLevel += 1
            //newSpeedNeedle.value = speedGauge.speed
        }
    }


    BatteryBlob {
        id: batteryBlob
        visible: false
        anchors.fill: parent
    }

    Item {
        id: power
        width: parseInt(Math.round(mainwind.width * 0.126)) //241
        height: parseInt(Math.round(mainwind.height * 0.1694)) //122
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -13
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 19
        Text {
            id: powerLabel
            height: parseInt(Math.round(mainwind.width * 0.0125)) //24
            color: "yellow" //Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            text: "% BATTERY" //+ String(batteryGaugeNew.width) + "  " + String(batteryGaugeNew.height)
            font.pixelSize: Math.round(mainwind.width * 0.010)//20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Medium
            font.family: Constants.font.family
        }

        Text {
            id: powerValue
            width: parseInt(Math.round(mainwind.width * 0.0974)) //187
            height: parseInt(Math.round(mainwind.height * 0.16)) //115
            color: "yellow" //Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            text: batteryLevelStringMapper.text
            font.pixelSize:  Math.round(mainwind.width * 0.050)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.top: powerLabel.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            fontSizeMode: Text.FixedSize
            font.weight: Font.Normal
            font.family: Constants.font.family

            StringMapper {
                id: batteryLevelStringMapper
                input: batteryGauge.batteryLevel
                decimals: 0
            }
        }
    }

    Item {
        id: batteryShadow
        anchors.bottom: batteryGaugeNew.bottom
        anchors.bottomMargin: -Math.round(mainwind.height * 0.04)
        width: Math.round(mainwind.width * 0.1854) //356
        height: Math.round(mainwind.height * 0.044) //32
        Image {
            id: batteryShadow1
            source: "qrc:/content/assets/blob-shadow.png"
        }
    }

    Image {
        id: batteryGaugeNew
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        source: "qrc:/content/assets/SpeedGaugeAssetEmpty.png"
        fillMode: Image.PreserveAspectFit
        width: Math.round(mainwind.width * 0.286)//549
        height: Math.round(mainwind.width * 0.283)//545
    }

    ChargeGaugeEffect {
        id: batteryEffect
        anchors.centerIn: parent
        width: Math.round(mainwind.width * 0.283) //544
        height: Math.round(mainwind.width * 0.283) //544

        angleDegree: batteryGauge.batteryLevel.toFixed()
        opacity: 0.3 + (batteryGauge.batteryLevel.toFixed() + 133) / 270.0
        effectColor: "#00e600"
        colorList: ["#8AFF8A", "#5CFF5C", "#2EFF2E", "#00FF00", "#00D100", "#00AAFF", "#00A300", "#1aff1a", "#33ff33", "#00cc00", "#00b300", "#009900", "#008000"]
    }

    states: [
        State {
            name: "blobState"
            when: Car3dControl.viewState === "adas"

            PropertyChanges {
                target: powerValue
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }

            PropertyChanges {
                target: powerLabel
                horizontalAlignment: Text.AlignRight
            }
        },
        State {
            name: "marginState"
            when: Car3dControl.viewState !== "adas"

            PropertyChanges {
                target: batteryShadow
                opacity: 0
            }

            PropertyChanges {
                target: power
                x: 447
                anchors.horizontalCenterOffset: 208
                anchors.verticalCenterOffset: 104
            }

            PropertyChanges {
                target: powerValue
                width: 241
                height: 38
                color: Themes.textColor
                text: batteryLevelStringMapper.text + "%"
                font.pixelSize: 32
                horizontalAlignment: Text.AlignRight
            }

            PropertyChanges {
                target: powerLabel
                x: 0
                y: 38
                width: 241
                height: 22
                color: Themes.labelColor
                text: "BATTERY"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                anchors.horizontalCenterOffset: 0
            }

            PropertyChanges {
                target: batteryBlob
                opacity: 0
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
                        target: powerLabel
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerLabel
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerLabel
                        property: "anchors.horizontalCenterOffset"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerLabel
                        property: "width"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerLabel
                        property: "height"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerLabel
                        property: "color"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: power
                        property: "anchors.verticalCenterOffset"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: power
                        property: "anchors.horizontalCenterOffset"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerValue
                        property: "font.pixelSize"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerValue
                        property: "width"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerValue
                        property: "color"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: powerValue
                        property: "height"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: batteryShadow
                        property: "opacity"
                        duration: 150
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: batteryBlob
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
