import QtQuick 2.8
import QtQuick.Timeline 1.0
import DigitalCluster 1.0

Item {
    id: sportModeBatterySmallMediaPlayer
    width: 1920
    height: 720

    Item {
        id: background
        anchors.fill: parent
        Image {
            id: background1
            anchors.fill: parent
            source: Themes.backgroundImage
        }
    }

    Adas {
        id: adas
        x: 532
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        Image {
            id: cruiseControl
            x: 327
            y: 261
            source: "../images/CruiseControl.png"
            fillMode: Image.PreserveAspectFit
            visible: Car3dControl.viewState == 'adas'
        }

        Image {
            id: forwardCollision
            x: 460
            y: 262
            source: "../images/ForwardCollision.png"
            fillMode: Image.PreserveAspectFit
            visible: Car3dControl.viewState == 'adas'
        }
    }

    SpeedGauge {
        id: speedGauge
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0
        speed: 0
    }

    BatteryGauge {
        id: batteryGauge
        x: 1200
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        batteryState: 1
        batteryLevel: 11
    }

    Gear {
        id: gear
        y: 330
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 32
        currentGear: 1
    }

    Range {
        id: range
        x: 1647
        y: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.verticalCenterOffset: -202
        anchors.rightMargin: 32
        currentRange: 351
    }

    BottomBar {
        id: bottomBar
        y: 624
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        currentTemp: 30
    }

    Telltales {
        id: tellTales
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                pingPong: true
                running: true
                loops: -1
                duration: 15000
                to: 100
                from: 0
            }
        ]
        enabled: true
        endFrame: 300
        startFrame: 0

        KeyframeGroup {
            target: batteryGauge
            property: "batteryLevel"

            Keyframe {
                frame: 0
                value: 100
            }

            Keyframe {
                frame: 122
                value: 9.03951
            }

            Keyframe {
                frame: 249
                value: 46.59764
            }

            Keyframe {
                frame: 302
                value: 100
            }
        }

        KeyframeGroup {
            target: batteryGauge
            property: "batteryState"
            Keyframe {
                value: 2
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 150
            }

            Keyframe {
                value: 1
                frame: 227
            }

            Keyframe {
                value: 1
                frame: 302
            }

            Keyframe {
                value: 2
                frame: 131
            }

            Keyframe {
                value: 0
                frame: 204
            }
        }

        KeyframeGroup {
            target: bottomBar
            property: "odometerDistance"
            Keyframe {
                value: 17113
                frame: 0
            }

            Keyframe {
                value: 17158
                frame: 100
            }
        }

        KeyframeGroup {
            target: gear
            property: "currentGear"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 16
            }

            Keyframe {
                value: 1
                frame: 17
            }

            Keyframe {
                value: 1
                frame: 31
            }

            Keyframe {
                value: 2
                frame: 32
            }

            Keyframe {
                value: 2
                frame: 46
            }

            Keyframe {
                value: 3
                frame: 47
            }
        }

        KeyframeGroup {
            target: gear
            property: "currentDriveMode"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 25
            }

            Keyframe {
                value: 1
                frame: 26
            }

            Keyframe {
                value: 1
                frame: 52
            }

            Keyframe {
                value: 0
                frame: 53
            }

            Keyframe {
                value: 0
                frame: 75
            }

            Keyframe {
                value: 1
                frame: 76
            }
        }

        KeyframeGroup {
            target: bottomBar
            property: "currentTemp"
            Keyframe {
                value: 27
                frame: 0
            }

            Keyframe {
                value: 30
                frame: 100
            }
        }

        KeyframeGroup {
            target: range
            property: "currentRange"
            Keyframe {
                value: 346
                frame: 0
            }

            Keyframe {
                value: 351
                frame: 100
            }
        }

        KeyframeGroup {
            target: speedGauge
            property: "speed"

            Keyframe {
                value: -0.35589
                frame: 0
            }

            Keyframe {
                value: 7.41018
                frame: 35
            }

            Keyframe {
                value: 94.77852
                frame: 98
            }
        }
    }

    Image {
        id: adasCycle
        x: 940
        y: 292
        width: 38
        height: 29
        source: "../images/adasCycle.png"
        sourceSize.height: 64
        sourceSize.width: 64
        fillMode: Image.PreserveAspectFit
        visible: Car3dControl.viewState == 'adas' && speedGauge.speed <= 5
        NumberAnimation {
            target: adasCycle
            property: "opacity"
            duration: 1000
            from: 0.1
            to: 0.9
            loops: 3
            easing.type: Easing.InOutQuad
            running: adasCycle.visible
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:720;width:1920}D{i:2}D{i:1}D{i:4}D{i:5}D{i:3}D{i:6}
D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}D{i:12}D{i:56}D{i:55}
}
##^##*/

