import QtQuick 2.8
//import QtQuick.Studio.Components 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick.Studio.LogicHelper 1.0

Item {
    id: batteryGauge
    width: 720
    height: 720
    state: "blobState"
    property alias batteryState: batteryBlob.batteryState
    property alias batteryLevel: batteryBlob.batteryLevel

    Keys.onDigit0Pressed: { decreaseCharge() }
    Keys.onDigit1Pressed: { increaseCharge() }
    //property alias increase:  increaseSpeed()


    Component.onCompleted: {
        forceActiveFocus()
    }


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
        x: 291
        y: 318
        width: 241
        height: 122
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: -13
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 19
        Text {
            id: powerLabel
            x: 3
            y: 98
            height: 24
            color: "white" //Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            text: "% BATTERY"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Medium
            font.family: Constants.font.family
        }

        Text {
            id: powerValue
            x: -35
            y: 0
            width: 187
            height: 115
            color: "white" //Themes.currentTheme == 'darkMode' ? "white" : "#000000"
            text: batteryLevelStringMapper.text
            font.pixelSize: 96
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
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
        x: 164
        y: 604
        width: 356
        height: 32
        Image {
            id: batteryShadow1
            x: 0
            y: 0
            source: "assets/blob-shadow.png"
        }
    }

    Image {
        id: batteryGaugeNew
        x: 56
        y: 88
        source: "assets/SpeedGaugeAssetEmpty.png"
        fillMode: Image.PreserveAspectFit
    }

    ChargeGaugeEffect {
        id: batteryEffect
        x: 56
        y: 91
        width: 544
        height: 544

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
