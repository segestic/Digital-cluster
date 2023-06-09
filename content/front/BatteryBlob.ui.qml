import QtQuick 2.8
//import QtQuick.Studio.Components 1.0
//import QtQuick.Studio.Effects 1.0
import QtGraphicalEffects 1.0
import QtQuick.Timeline 1.0
import "../../imports"

Item {
    id: batteryBlob
    width: Math.round(mainwind.height)//720
    height: Math.round(mainwind.height)//720
    property int batteryState: 1

    state: "balanced"
    property real batteryLevel: 100

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: Math.round(mainwind.height)//720
        height: Math.round(mainwind.height)//720
        visible: false
        color: "#595959"
    }

    Image {
        id: background
        visible: false
        source: "qrc:/content/assets/background-dark.png"
        anchors.fill: parent
        fillMode: Image.Tile
    }

    Item {
        id: itemGradient
        width: Math.round(mainwind.width * 0.26)//500
        height: Math.round(mainwind.width * 0.26)//500
        visible: false

        Rectangle {
            id: rectGradient
            visible: true
            border.color: "#11998e"
            border.width: 0
            anchors.fill: parent
            rotation: -blob.rotation
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: Themes.batteryBlobColorTop
                }
                GradientStop {
                    position: 1
                    color: Themes.batteryBlobColorBottom
                }
            }
        }
    }

    ShaderEffectSource {
        id: gradientBlob
        sourceItem: itemGradient
    }

    Item {
        x: 0
        y: 0
        width:Math.round(mainwind.height)
        height: Math.round(mainwind.height)//720
        layer.effect: InnerShadowEffect {
            id: innerShadow
            opacity: 0.036
            visible: true
            color: "#aae2a1"
            spread: 0.5
            horizontalOffset: 0
            fast: false
        }
        layer.enabled: true

        Blob {
            id: blob
            x: 100
            visible: true
            anchors.fill: parent
            animOffset: 0
            state: "battery"
            size: batteryBlob.batteryLevel * 0.005 + 0.5
            speed: -1
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            texture: gradientBlob
            ringCount: 4
            ringMinDist: 0.
            ringMaxDist: 100.
            ringWidth: 1.5
            easing: 1.
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: cons
                loops: -1
                running: false
                duration: 500
                to: 10
                from: 0
            },
            TimelineAnimation {
                id: recu
                loops: -1
                running: false
                duration: 500
                to: 0
                from: 10
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 10

        KeyframeGroup {
            target: blob
            property: "animOffset"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 10
                value: 1
            }
        }

        KeyframeGroup {
            target: blob
            property: "x"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 100
            }
        }
    }
    states: [
        State {
            name: "balanced"
            when: batteryBlob.batteryState === 0
        },
        State {
            name: "recuperation"
            when: batteryBlob.batteryState === 1

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: cons
            }

            PropertyChanges {
                target: blob
                animOffset: 0.25
            }

            PropertyChanges {
                target: recu
                running: true
            }
        },
        State {
            name: "consumption"
            when: batteryBlob.batteryState === 2

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: cons
                running: true
            }

            PropertyChanges {
                target: recu
            }
        }
    ]
}
