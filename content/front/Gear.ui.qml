import QtQuick 2.15
import QtGraphicalEffects 1.0


Item {
    id: gear
    width: 88
    height: 60
    property alias currentDriveMode: driveMode.currentDriveMode
    property int currentGear: 3

    Rectangle {
        id: rectangle
//        x: 0
//        y: 0
        width: 48
        height: 40
        color: "#00000000"
        clip: false
        layer.enabled: true
        layer.effect: OpacityMask {
            id: opacityMask
            width: 48
            height: 40
            invert: true
            maskSource: mask
        }

        Text {
            id: gearValue
            x: 0
            y: 0
            width: 28
            height: 157
            color: "white"//Themes.textColor
            text: "PRND"
            font.pixelSize: 32
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap

            font.weight: Font.Normal
            font.family: Constants.font.family
        }

        Rectangle {
            id: mask
            x: 0
            y: 0
            width: 48
            height: 40
            visible: false
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 0.80132
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 0.20021
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 1
                    color: "#ffffff"
                }
            }
            clip: true
        }
    }

    DriveMode {
        id: driveMode
        x: 0
        y: 39
    }

    states: [
        State {
            name: "gearP"
            when: gear.currentGear === 0
        },
        State {
            name: "gearR"
            when: gear.currentGear === 1
            PropertyChanges {
                target: gearValue
                x: 0
                y: -39
            }
        },
        State {
            name: "gearN"
            when: gear.currentGear === 2
            PropertyChanges {
                target: gearValue
                x: 0
                y: -78
            }
        },
        State {
            name: "gearD"
            when: gear.currentGear === 3
            PropertyChanges {
                target: gearValue
                x: 0
                y: -117
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
                        target: gearValue
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: gearValue
                        property: "y"
                        duration: 150
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

