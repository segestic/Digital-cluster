import QtQuick 2.8
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtQuick3D 1.15
import QtQuick 2.15
import Quick3DAssets.Road 1.0
import Quick3DAssets.Car 1.0
import Quick3DAssets.Car_NPC 1.0

import QtQuick3D.Materials 1.15
import QtQuick3D.Effects 1.15
import Quick3DAssets.Coupe 1.0
import DigitalCluster 1.0
import QtQuick.Controls 2.15
import Quick3DAssets.CarShadowPlane 1.0
import Quick3DAssets.TirePressureIndicator 1.0
import QtQuick.Studio.Effects 1.0
import Quick3DAssets.Battery 1.0
import Quick3DAssets.Drivetrain 1.0

Item {
    id: adas
    width: 1388
    height: 720

    property bool viewTopBot: true

    property int transitionDuration: 700
    property int roadTransitionDuration: 300

    Rectangle {
        id: rectangleMaskAdas
        rotation: 0
        width: view3D.width
        height: view3D.height
        anchors.centerIn: view3D
        visible: false
        gradient: Gradient {
            GradientStop {
                id: gradientStop1
                position: 0
                color: "#d400a5"
            }

            GradientStop {
                id: gradientStop3
                position: 0.21014
                color: "#d400a5"
            }

            GradientStop {
                id: gradientStop2
                position: 0.81884
                color: "#d400a5"
            }

            GradientStop {
                id: gradientStop
                position: 1
                color: "#d400a5"
            }
        }
    }

    View3D {
        id: view3D
        y: 312
        width: 856
        height: 408
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        layer.effect: OpacityMaskEffect {
            id: opacityMask
            maskSource: rectangleMaskAdas
        }
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        layer.enabled: true
        environment: sceneEnvironment

        HDRBloomTonemap {
            id: hDRBloomTonemap
            blurFalloff: 2
            channelThreshold: 0.6
            bloomThreshold: 0.4
            gamma: 1
        }

        SceneEnvironment {
            id: sceneEnvironment
            probeBrightness: 120
            depthPrePassEnabled: false
            effects: [hDRBloomTonemap]
            antialiasingMode: SceneEnvironment.SSAA
            antialiasingQuality: SceneEnvironment.VeryHigh
            backgroundMode: SceneEnvironment.Transparent
            lightProbe: Texture {
                source: "assets/hdr/Studio_05e.hdr"
            }
        }

        Node {
            id: scene
            x: -0
            y: 0
            opacity: 0.01
            z: 0

            Car_NPC {
                id: car_NPC
                x: -153.099
                y: 156.985
                opacity: 0.58
                scale.z: 0.8
                scale.y: 0.8
                scale.x: 0.8
                z: -3502.88
            }

            Car_NPC {
                id: car_NPC1
                x: 139.095
                y: 156.985
                opacity: 1
                scale.z: 0.8
                z: 162.81
                scale.y: 0.8
                scale.x: 0.8
            }

            Car_NPC {
                id: car_NPC2
                x: -11.447
                y: 146.99
                opacity: 1
                scale.z: 0.8
                scale.y: 0.8
                scale.x: 0.8
                z: -605.95251
            }

            Car_NPC {
                id: car_NPC3
                x: 161
                y: 141
                opacity: 1
                scale.z: 0.8
                scale.y: 0.8
                scale.x: 0.8
                z: -4749.95251
            }

            Road {
                id: road2
                x: 0
                y: 0
                z: 540.48822
                scale.z: 2
                scale.y: 0
                scale.x: 1.4
                opacity: 1
                leftRightState: false
                principledMaterialEmissiveColor: "#b20000"
            }
        }

        Node {
            id: scene1
            x: 0
            y: 0
            opacity: 1
            z: 0

            Coupe {
                id: coupe
                x: 0
                y: 0
                z: 0
                frontLights: Car3dControl.frontLightsOn
                highBeamOn: Car3dControl.highBeamOn
                passengerdoor: Car3dControl.passengerDoorOpen
                trunk: Car3dControl.trunkOpen
                driverdoor: Car3dControl.driverDoorOpen

                metalness: 0.5
                specularTint: 0

                carPaintColor: "#a1a8b3"
                carPaintRoughness: 0.2

                opacity: 1
                interiorLightColor: Car3dControl.interiorHueColor
                interiorLightPower: Car3dControl.interiorBrightness
                interiorLightsVisible: true
                specular: 0

                windowOpacity: 0.0
                windowColor: "#ffffff"
                windowRoughness: 0
                windowMetalness: 0
                carBodyOpacity: 1
                scale.z: 0.6
                scale.y: 0.6
                scale.x: 0.6
                eulerRotation.z: 0
                eulerRotation.y: 180
                eulerRotation.x: 0

                TirePressureIndicator {
                    id: tirePressureIndicator
                    opacity: 0.01
                    scale.z: 0.01
                    scale.y: 0.01
                    scale.x: 0.01
                    labelAngle: -coupe.eulerRotation.y
                }

                Battery {
                    id: battery
                    x: 0
                    y: 14.963
                    opacity: 0.01
                    visible: true
                    z: -0
                }
                AreaLight {
                    id: interiorArealight

                    x: -61.394
                    z: -10.38797

                    y: 83.29
                    width: 7
                    height: 66
                    color: Car3dControl.interiorHueColor
                    brightness: 98 * Car3dControl.interiorBrightness
                    eulerRotation.z: -94.27788
                    eulerRotation.y: 93.69339
                    eulerRotation.x: -59.65046
                }
                AreaLight {
                    id: interiorArealight1
                    x: 59.714
                    y: 86.446
                    z: -13.2774

                    width: 7
                    height: 66
                    color: Car3dControl.interiorHueColor
                    brightness: 118 * Car3dControl.interiorBrightness
                    eulerRotation.z: 89.99998
                    eulerRotation.x: -59.52864
                    eulerRotation.y: -89.99999
                }
                AreaLight {
                    id: interiorArealight2
                    color: Car3dControl.interiorHueColor
                    brightness: 35 * Car3dControl.interiorBrightness
                    eulerRotation.z: -179.99998
                    eulerRotation.y: 179.99998
                    x: -2.698
                    y: 67.368
                    width: 85
                    height: 8
                    scope: coupe
                    eulerRotation.x: -50
                    z: 29.74187
                }
                Drivetrain {
                    id: drivetrain
                    visible: true
                }

                AreaLight {
                    id: batteryLight
                    x: 9.111
                    y: 50.452
                    width: 157
                    height: 193
                    color: "#94c58f"
                    scope: battery
                    brightness: 0
                    eulerRotation.z: 179.99988
                    eulerRotation.y: -179.99988
                    eulerRotation.x: -88.17738
                    z: 1.75921
                }
            }


            AreaLight {
                id: lightArea
                x: -75.623
                y: 38.107
                width: 221
                height: 26
                color: "#cc0000"
                brightness: 0
                eulerRotation.z: 0
                eulerRotation.y: -90
                eulerRotation.x: 0
                z: 2.08423
            }
        }

        PerspectiveCamera {
            id: camera
            x: 0
            y: 414.59
            z: 527.86456
            clipFar: 7000
            fieldOfView: 42
            eulerRotation.x: -24

            AreaLight {
                id: additionalLight
                x: -259.213
                y: -44.611
                eulerRotation.z: 4.06186
                eulerRotation.y: -42.61913
                eulerRotation.x: -10.04321
                width: 585
                height: 144
                color: "#fde8b4"
                scale.z: 1
                scale.y: 3.99541
                scale.x: 1
                brightness: 35
                z: -326.18591
            }
        }
    }

    Timeline {
            id: adasTimeline
            animations: [
                TimelineAnimation {
                    id: timelineAnimation
                    running: true
                    duration: 24000
                    loops: -1
                    to: 4000
                    from: 0
                }
            ]
            startFrame: 0
            enabled: true
            endFrame: 100

            KeyframeGroup {
                target: car_NPC
                property: "z"
                Keyframe {
                    value: 442.97
                    frame: 0
                }

                Keyframe {
                    value: -3502.88
                    frame: 1000
                }

                Keyframe {
                    frame: 1001
                    value: 519.20935
                }

                Keyframe {
                    frame: 1998
                    value: -3502.88
                }

                Keyframe {
                    frame: 1998
                    value: -3502.88
                }

                Keyframe {
                    frame: 1238
                    value: -436.8941
                }

                Keyframe {
                    frame: 1270
                    value: -565.98828
                }

                Keyframe {
                    value: -3502.88
                    frame: 3033
                }

                Keyframe {
                    value: 519.20935
                    frame: 3034
                }

                Keyframe {
                    value: -436.8941
                    frame: 3271
                }

                Keyframe {
                    value: -565.98828
                    frame: 3303
                }

                Keyframe {
                    value: -3502.88
                    frame: 4000
                }
            }

            KeyframeGroup {
                target: car_NPC
                property: "opacity"

                Keyframe {
                    value: 1
                    frame: 98
                }

                Keyframe {
                    value: 0
                    frame: 1
                }

                Keyframe {
                    value: 1
                    frame: 404
                }

                Keyframe {
                    value: 0
                    frame: 502
                }

                Keyframe {
                    frame: 1122
                    value: 1
                }

                Keyframe {
                    frame: 992
                    value: 0
                }

                Keyframe {
                    frame: 1001
                    value: 0
                }

                Keyframe {
                    frame: 0
                    value: 0
                }

                Keyframe {
                    frame: 1567
                    value: 0
                }

                Keyframe {
                    frame: 1446
                    value: 1
                }

                Keyframe {
                    value: 0
                    frame: 2169
                }

                Keyframe {
                    value: 0
                    frame: 3025
                }

                Keyframe {
                    value: 0
                    frame: 3034
                }

                Keyframe {
                    value: 1
                    frame: 3208
                }

                Keyframe {
                    value: 1
                    frame: 3479
                }

                Keyframe {
                    value: 0
                    frame: 3600
                }

                Keyframe {
                    value: 0
                    frame: 2027
                }
            }

            KeyframeGroup {
                target: car_NPC1
                property: "z"
                Keyframe {
                    value: 442.97
                    frame: 804
                }

                Keyframe {
                    frame: 0
                    value: -3502.88
                }

                Keyframe {
                    frame: 837
                    value: 427.858
                }

                Keyframe {
                    frame: 838
                    value: -3743.04004
                }

                Keyframe {
                    frame: 1815
                    value: -3502.88
                }

                Keyframe {
                    value: 442.97
                    frame: 2619
                }

                Keyframe {
                    value: 427.858
                    frame: 2652
                }

                Keyframe {
                    value: -3743.04004
                    frame: 2653
                }

                Keyframe {
                    value: 657.39221
                    frame: 3630
                }
            }

            KeyframeGroup {
                target: car_NPC1
                property: "y"
                Keyframe {
                    value: 156.98595
                    frame: 804
                }

                Keyframe {
                    frame: 0
                    value: 156.99
                }

                Keyframe {
                    frame: 838
                    value: 156.98656
                }

                Keyframe {
                    frame: 1815
                    value: 156.99
                }

                Keyframe {
                    value: 156.98595
                    frame: 2619
                }

                Keyframe {
                    value: 156.98656
                    frame: 2653
                }

                Keyframe {
                    value: 156.98683
                    frame: 3630
                }
            }

            KeyframeGroup {
                target: car_NPC1
                property: "x"
                Keyframe {
                    value: 139.09547
                    frame: 804
                }

                Keyframe {
                    frame: 0
                    value: 139.1
                }

                Keyframe {
                    frame: 838
                    value: 139.09631
                }

                Keyframe {
                    frame: 1815
                    value: 139.1
                }

                Keyframe {
                    value: 139.09547
                    frame: 2619
                }

                Keyframe {
                    value: 139.09631
                    frame: 2653
                }

                Keyframe {
                    value: 139.09579
                    frame: 3630
                }
            }

            KeyframeGroup {
                target: car_NPC2
                property: "z"
                Keyframe {
                    frame: 0
                    value: -5158.91
                }

                Keyframe {
                    frame: 1000
                    value: 454.69397
                }

                Keyframe {
                    frame: 1158
                    value: 454.69391
                }

                Keyframe {
                    frame: 2000
                    value: -2833.3689
                }

                Keyframe {
                    value: -5158.91
                    frame: 2001
                }

                Keyframe {
                    value: 454.69397
                    frame: 3003
                }

                Keyframe {
                    value: 454.69391
                    frame: 3159
                }
            }

            KeyframeGroup {
                target: car_NPC2
                property: "x"

                Keyframe {
                    frame: 1000
                    value: 144.99997
                }

                Keyframe {
                    frame: 986
                    value: 145
                }

                Keyframe {
                    frame: 0
                    value: 162.61066
                }

                Keyframe {
                    frame: 1158
                    value: -161.67902
                }

                Keyframe {
                    frame: 2000
                    value: -161.67908
                }

                Keyframe {
                    value: 0
                    frame: 2001
                }

                Keyframe {
                    value: 140.09676
                    frame: 2002
                }

                Keyframe {
                    value: -161.67908
                    frame: 4000
                }

                Keyframe {
                    frame: 3914
                    value: 140.09676
                }
            }

            KeyframeGroup {
                target: car_NPC2
                property: "y"
                Keyframe {
                    frame: 0
                    value: 155
                }

                Keyframe {
                    frame: 1000
                    value: 155
                }

                Keyframe {
                    frame: 1158
                    value: 155
                }

                Keyframe {
                    frame: 2000
                    value: 155
                }

                Keyframe {
                    frame: 39
                    value: 139.29
                }

                Keyframe {
                    frame: 73
                    value: 141.3
                }

                Keyframe {
                    value: 155
                    frame: 2001
                }

                Keyframe {
                    value: 139.29
                    frame: 2040
                }

                Keyframe {
                    value: 141.3
                    frame: 2074
                }

                Keyframe {
                    value: 155
                    frame: 3001
                }

                Keyframe {
                    value: 155
                    frame: 3159
                }

                Keyframe {
                    value: 155
                    frame: 4000
                }

                Keyframe {
                    value: 141.30421
                    frame: 2035
                }

                Keyframe {
                    value: 143.23608
                    frame: 2205
                }
            }

            KeyframeGroup {
                target: car_NPC
                property: "x"
                Keyframe {
                    frame: 1001
                    value: -153.09947
                }

                Keyframe {
                    frame: 1998
                    value: 0
                }

                Keyframe {
                    frame: 1155
                    value: -150.08766
                }

                Keyframe {
                    frame: 1365
                    value: 0
                }

                Keyframe {
                    frame: 1623
                    value: 0
                }

                Keyframe {
                    frame: 1508
                    value: 0
                }

                Keyframe {
                    value: -153.09947
                    frame: 3034
                }

                Keyframe {
                    value: -150.08766
                    frame: 3188
                }

                Keyframe {
                    value: 0
                    frame: 3303
                }

                Keyframe {
                    value: 0
                    frame: 3541
                }

                Keyframe {
                    value: 0
                    frame: 3656
                }

                Keyframe {
                    value: 0
                    frame: 4000
                }

                Keyframe {
                    frame: 1238
                    value: -150.08766
                }
            }

            KeyframeGroup {
                target: car_NPC
                property: "y"
                Keyframe {
                    frame: 1001
                    value: 156.98524
                }

                Keyframe {
                    frame: 1998
                    value: 156.98436
                }

                Keyframe {
                    frame: 1155
                    value: 156.98436
                }

                Keyframe {
                    frame: 1270
                    value: 156.98436
                }

                Keyframe {
                    value: 156.98524
                    frame: 3034
                }

                Keyframe {
                    value: 156.98436
                    frame: 3188
                }

                Keyframe {
                    value: 156.98436
                    frame: 3303
                }

                Keyframe {
                    value: 156.98436
                    frame: 4000
                }
            }

            KeyframeGroup {
                target: car_NPC2
                property: "opacity"

                Keyframe {
                    frame: 575
                    value: 1
                }

                Keyframe {
                    frame: 1000
                    value: 0
                }

                Keyframe {
                    frame: 929
                    value: 1
                }

                Keyframe {
                    frame: 1269
                    value: 1
                }

                Keyframe {
                    frame: 1173
                    value: 0
                }

                Keyframe {
                    frame: 1712
                    value: 1
                }

                Keyframe {
                    frame: 1804
                    value: 0
                }

                Keyframe {
                    frame: 0
                    value: 1
                }

                Keyframe {
                    value: 1
                    frame: 2001
                }

                Keyframe {
                    value: 1
                    frame: 2576
                }

                Keyframe {
                    value: 1
                    frame: 2930
                }

                Keyframe {
                    value: 0
                    frame: 3001
                }

                Keyframe {
                    value: 0
                    frame: 3174
                }

                Keyframe {
                    value: 1
                    frame: 3270
                }

                Keyframe {
                    value: 1
                    frame: 3713
                }

                Keyframe {
                    value: 0
                    frame: 3805
                }
            }

            KeyframeGroup {
                target: car_NPC1
                property: "opacity"
                Keyframe {
                    frame: 0
                    value: 0
                }

                Keyframe {
                    frame: 303
                    value: 1
                }

                Keyframe {
                    frame: 798
                    value: 0
                }

                Keyframe {
                    frame: 720
                    value: 1
                }

                Keyframe {
                    value: 0
                    frame: 1815
                }

                Keyframe {
                    value: 1
                    frame: 2118
                }

                Keyframe {
                    value: 1
                    frame: 2535
                }

                Keyframe {
                    value: 0
                    frame: 2613
                }
            }

            KeyframeGroup {
                target: road2
                property: "principledMaterialEmissiveColor"

                Keyframe {
                    frame: 58
                    value: "#ff0000"
                }

                Keyframe {
                    frame: 235
                    value: "#000000"
                }

                Keyframe {
                    frame: 993
                    value: "#000000"
                }

                Keyframe {
                    frame: 1080
                    value: "#ff0000"
                }

                Keyframe {
                    frame: 1395
                    value: "#000000"
                }

                Keyframe {
                    frame: 1338
                    value: "#ff0000"
                }

                Keyframe {
                    frame: 594
                    value: "#ff0000"
                }

                Keyframe {
                    frame: 969
                    value: "#000000"
                }

                Keyframe {
                    frame: 521
                    value: "#000000"
                }

                Keyframe {
                    frame: 943
                    value: "#ff0000"
                }

                Keyframe {
                    value: "#000000"
                    frame: 2209
                }

                Keyframe {
                    value: "#000000"
                    frame: 2399
                }

                Keyframe {
                    value: "#ff0000"
                    frame: 2504
                }

                Keyframe {
                    value: "#ff0000"
                    frame: 2903
                }

                Keyframe {
                    value: "#000000"
                    frame: 2968
                }

                Keyframe {
                    value: "#000000"
                    frame: 3005
                }

                Keyframe {
                    value: "#ff0000"
                    frame: 3080
                }

                Keyframe {
                    value: "#ff0000"
                    frame: 3170
                }

                Keyframe {
                    value: "#000000"
                    frame: 3227
                }
            }

            KeyframeGroup {
                target: road2
                property: "leftRightState"
                Keyframe {
                    frame: 0
                    value: false
                }

                Keyframe {
                    frame: 228
                    value: true
                }

                Keyframe {
                    frame: 990
                    value: false
                }

                Keyframe {
                    value: false
                    frame: 2000
                }

                Keyframe {
                    value: true
                    frame: 2228
                }

                Keyframe {
                    value: false
                    frame: 2990
                }
            }

            KeyframeGroup {
                target: coupe
                property: "x"
                Keyframe {
                    frame: 0
                    value: 0
                }

                Keyframe {
                    frame: 2000
                    value: 0
                }

                Keyframe {
                    frame: 584
                    value: -12
                }

                Keyframe {
                    frame: 1038
                    value: 0
                }

                Keyframe {
                    frame: 36
                    value: 0
                }

                Keyframe {
                    frame: 1474
                    value: 5.33455
                }

                Keyframe {
                    frame: 1995
                    value: 0
                }

                Keyframe {
                    frame: 2001
                    value: 0
                }

                Keyframe {
                    frame: 2037
                    value: 0
                }

                Keyframe {
                    frame: 2585
                    value: -21.96618
                }

                Keyframe {
                    frame: 3039
                    value: 0
                }

                Keyframe {
                    frame: 3475
                    value: 16.26037
                }

                Keyframe {
                    frame: 3996
                    value: 0
                }

                Keyframe {
                    frame: 4000
                    value: 0
                }
            }

            KeyframeGroup {
                target: lightArea
                property: "brightness"
                Keyframe {
                    frame: 0
                    value: 0
                }

                Keyframe {
                    frame: 252
                    value: 0
                }

                Keyframe {
                    frame: 1053
                    value: 0
                }

                Keyframe {
                    frame: 1090
                    value: 823
                }

                Keyframe {
                    frame: 1397
                    value: 0
                }

                Keyframe {
                    frame: 1300
                    value: 823
                }

                Keyframe {
                    frame: 508
                    value: 0
                }

                Keyframe {
                    frame: 605
                    value: 823
                }

                Keyframe {
                    frame: 789
                    value: 823
                }

                Keyframe {
                    frame: 963
                    value: 0
                }

                Keyframe {
                    frame: 2387
                    value: 0
                }

                Keyframe {
                    frame: 2538
                    value: 823
                }

                Keyframe {
                    frame: 2785
                    value: 823
                }

                Keyframe {
                    frame: 2974
                    value: 0
                }

                Keyframe {
                    frame: 3104
                    value: 823
                }

                Keyframe {
                    frame: 3161
                    value: 823
                }

                Keyframe {
                    frame: 3226
                    value: 0
                }

                Keyframe {
                    frame: 68
                    value: 823
                }

                Keyframe {
                    frame: 4000
                    value: 0
                }

                Keyframe {
                    value: 0
                    frame: 5
                }
            }

            KeyframeGroup {
                target: lightArea
                property: "x"

                Keyframe {
                    frame: 0
                    value: -75.11
                }

                Keyframe {
                    frame: 252
                    value: -75.11
                }

                Keyframe {
                    frame: 260
                    value: 75.85524
                }

                Keyframe {
                    frame: 1016
                    value: -75.11
                }

                Keyframe {
                    frame: 1001
                    value: 75.85524
                }

                Keyframe {
                    frame: 2364
                    value: 75.85524
                }

                Keyframe {
                    frame: 2348
                    value: -75.11
                }

                Keyframe {
                    frame: 2974
                    value: -75.11
                }

                Keyframe {
                    frame: 2968
                    value: 75.85524
                }
            }

            KeyframeGroup {
                target: lightArea
                property: "eulerRotation.y"
                Keyframe {
                    frame: 260
                    value: 90
                }

                Keyframe {
                    frame: 252
                    value: -90
                }

                Keyframe {
                    frame: 1016
                    value: -90
                }

                Keyframe {
                    frame: 1001
                    value: 90
                }

                Keyframe {
                    frame: 2364
                    value: 90
                }

                Keyframe {
                    frame: 2348
                    value: -90
                }

                Keyframe {
                    frame: 2974
                    value: -90
                }

                Keyframe {
                    frame: 2968
                    value: 90
                }

                Keyframe {
                    frame: 0
                    value: -90
                }
            }

        }

    Timeline {
        id: tirePressureTimeline
        animations: [
            TimelineAnimation {
                id: tirePressureAnimation
                running: false
                duration: 50000
                loops: -1
                to: 100
                from: 0
            }
        ]
        endFrame: 100
        startFrame: 0
        enabled: false

        KeyframeGroup {
            target: coupe
            property: "eulerRotation.y"
            Keyframe {
                value: 360
                frame: 100
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }
    }

    Timeline {
        id: batteryTimeline
        animations: [
            TimelineAnimation {
                id: batteryAnimation
                loops: -1
                running: true
                duration: 3600
                to: 100
                from: 0
            }
        ]
        enabled: false
        endFrame: 100
        startFrame: 0

        KeyframeGroup {
            target: battery
            property: "battery_materialEmissiveColor"
            Keyframe {
                frame: 0
                value: "#32862c"
            }

            Keyframe {
                frame: 100
                value: "#32862c"
            }

            Keyframe {
                frame: 50
                value: "#3e9f34"
            }
        }

        KeyframeGroup {
            target: drivetrain
            property: "opacity"
            Keyframe {
                frame: 0
                value: 1
            }
        }

        KeyframeGroup {
            target: drivetrain
            property: "powerCable_materialEmissiveFactor"
            Keyframe {
                frame: 50
                value: 0.5
            }

            Keyframe {
                frame: 100
                value: 0
            }
        }

        KeyframeGroup {
            target: batteryLight
            property: "brightness"
            Keyframe {
                frame: 100
                value: -20
            }

            Keyframe {
                frame: 0
                value: -20
            }

            Keyframe {
                frame: 50
                value: 14
            }

            Keyframe {
                frame: 99
                value: -20
            }

            Keyframe {
                frame: 81
                value: -20
            }
        }
    }

    states: [
        State {
            name: "adas"
            when: Car3dControl.viewState === "adas"

            PropertyChanges {
                target: scene
                opacity: 1
            }

            PropertyChanges {
                target: scene1
                opacity: 1
            }

            PropertyChanges {
                target: camera
                clipFar: 7600
            }

            PropertyChanges {
                target: road2
                x: 0
                y: 0
                z: 540.48822
                scale.z: 2
                scale.y: 0
                scale.x: 1.4
            }

            PropertyChanges {
                target: coupe
                eulerRotation.y: 180
                z: -120
            }

            PropertyChanges {
                target: lightArea
                x: -75.623
                y: 51.589
                z: -116.38979
            }

            PropertyChanges {
                target: gradientStop
                position: 0.75
            }

            PropertyChanges {
                target: gradientStop1
                color: "#00d400a5"
            }

            PropertyChanges {
                target: gradientStop2
                position: 1
            }

            PropertyChanges {
                target: gradientStop3
                position: 0.22464
            }
        },
        State {
            name: "front"
            when: Car3dControl.viewState === "front"

            PropertyChanges {
                target: view3D
                y: 0
                width: 1388
                height: 720
            }

            PropertyChanges {
                target: coupe
                y: 0
                eulerRotation.x: 0
                scale.z: 1
                scale.y: 1
                scale.x: 1
                eulerRotation.y: 13
            }

            PropertyChanges {
                target: camera
                x: 0
                y: 185.62
                eulerRotation.x: -11
                fieldOfView: 25
                z: 657.10999
            }

            PropertyChanges {
                target: scene1
                y: 0
                opacity: 1
                z: 0
            }

            PropertyChanges {
                target: scene
                opacity: 0
            }

            PropertyChanges {
                target: lightArea
                y: -224.747
                brightness: 0
            }

            PropertyChanges {
                target: additionalLight
                brightness: 35
            }
        },
        State {
            name: "tirePressure"
            when: Car3dControl.viewState === "tirePressure"

            PropertyChanges {
                target: view3D
                y: 0
                width: 1388
                height: 720
            }

            PropertyChanges {
                target: coupe
                x: 0
                y: 0

                eulerRotation.z: 0
                eulerRotation.x: 0
                scale.z: 1
                scale.x: 1
                z: 0
                scale.y: 1
                eulerRotation.y: 0
            }

            PropertyChanges {
                target: camera
                x: 0
                y: 259.66
                fieldOfView: 40
                eulerRotation.x: -23
                z: 544
            }

            PropertyChanges {
                target: scene1
                y: 0
                opacity: 1
                z: 0
            }

            PropertyChanges {
                target: scene
                opacity: 0
            }

            PropertyChanges {
                target: lightArea
                brightness: 0
            }

            PropertyChanges {
                target: tirePressureIndicator
                opacity: 1
                scale.z: 1
                scale.y: 1
                scale.x: 1
            }
        },
        State {
            name: "left"
            when: Car3dControl.viewState === "left"

            PropertyChanges {
                target: view3D
                width: 1388
                height: 720
            }

            PropertyChanges {
                target: coupe
                x: 0
                y: 0

                scale.z: 1
                scale.x: 1
                z: 0
                scale.y: 1
                eulerRotation.x: 0

                eulerRotation.y: 222
                eulerRotation.z: 0
            }

            PropertyChanges {
                target: camera
                x: 14.154
                y: 136.332
                z: 454.43323
                fieldOfView: 40
                eulerRotation.x: -10
            }

            PropertyChanges {
                target: scene1
                y: 0
                opacity: 1
                z: 0
            }

            PropertyChanges {
                target: scene
                opacity: 0
            }

            PropertyChanges {
                target: lightArea
                brightness: 0
            }
        },
        State {
            name: "right"
            when: Car3dControl.viewState === "right"

            PropertyChanges {
                target: view3D
                y: 0
                width: 1388
                height: 720
            }

            PropertyChanges {
                target: coupe
                x: 0
                y: 0
                scale.z: 1
                scale.x: 1
                z: 0
                scale.y: 1
                eulerRotation.x: 0
                eulerRotation.y: 138.93
                eulerRotation.z: 0
            }

            PropertyChanges {
                target: camera
                x: 0.492
                y: 131.69
                eulerRotation.y: 5
                z: 448.12378
                fieldOfView: 40
                eulerRotation.x: -10
            }

            PropertyChanges {
                target: scene1
                y: 0
                opacity: 1
                z: 0
            }

            PropertyChanges {
                target: scene
                opacity: 0
            }

            PropertyChanges {
                target: lightArea
                brightness: 0
            }
        },
        State {
            name: "battery"
            when: Car3dControl.viewState === "battery"

            PropertyChanges {
                target: view3D
                y: 0
                width: 1388
                height: 720
            }
            PropertyChanges {
                target: coupe
                x: 0
                y: 39.578
                interiorLightsVisible: false
                carShadowAmount: 0.5
                interiorOpacity: 0
                carBodyOpacity: 0.15
                scale.z: 1
                scale.x: 1
                z: -32.21783
                scale.y: 1
                eulerRotation.x: 0
                eulerRotation.y: 270
                eulerRotation.z: -17.60425
            }

            PropertyChanges {
                target: camera
                y: 116
                z: 544
                fieldOfView: 40
                eulerRotation.x: 0
            }

            PropertyChanges {
                target: scene
                opacity: 0
            }

            PropertyChanges {
                target: lightArea
                brightness: 0
            }

            PropertyChanges {
                target: scene1
                opacity: 1
            }

            PropertyChanges {
                target: battery
                opacity: 1
                pickable: false
                receivesShadows: false
                castsShadows: false
                battery_materialRoughness: 1
                battery_materialMetalness: 0.8
                battery_materialEmissiveColor: "#000000"
            }

            PropertyChanges {
                target: batteryTimeline
                enabled: true
            }

            PropertyChanges {
                target: batteryAnimation
                running: true
            }

            PropertyChanges {
                target: drivetrain
                powerCable_materialEmissiveFactor: 0
            }

            PropertyChanges {
                target: interiorArealight
                brightness: 0
            }

            PropertyChanges {
                target: interiorArealight1
                brightness: 0
            }

            PropertyChanges {
                target: interiorArealight2
                  brightness: 0
            }

            PropertyChanges {
                target: additionalLight
                brightness: 0
            }

            PropertyChanges {
                target: batteryLight
                x: 9.111
                y: 33.044
                z: 2.31316
            }
        },
        State {
            name: "interior"
            when: Car3dControl.viewState === "interior"
            PropertyChanges {
                target: view3D
                width: 1388
                height: 720
            }
            PropertyChanges {
                target: coupe
                x: 0.981
                y: 71.169
                interiorLightsVisible: true
                carShadowAmount: 0
                interiorOpacity: 1
                carBodyOpacity: 0
                z: 241.03568
                scale.x: 0.85
                eulerRotation.z: 0
                scale.y: 0.85
                eulerRotation.x: 0
                eulerRotation.y: 180
                scale.z: 0.85
            }

            PropertyChanges {
                target: camera
                x: 0
                y: 291.654
                z: 387.99686
                fieldOfView: 40
                eulerRotation.x: -45
            }
            PropertyChanges {
                target: scene1
                y: 0
                opacity: 1
                z: 0
            }
            PropertyChanges {
                target: scene
                opacity: 0
            }
            PropertyChanges {
                target: lightArea
                brightness: 0
            }

            PropertyChanges {
                target: additionalLight
                x: 38.528
                y: -16.638
                color: "#d0d0d0"
                z: -58.94791
                brightness: 20
            }

            PropertyChanges {
                target: rectangleMaskAdas
                width: view3D.height
                height: view3D.width
                rotation: 90
            }

            PropertyChanges {
                target: gradientStop1
                position: 0.10636
                color: "#00d400a5"
            }

            PropertyChanges {
                target: gradientStop
                position: 0.95727
                color: "#00d400a5"
            }

            PropertyChanges {
                target: gradientStop3
                position: 0.204
            }

            PropertyChanges {
                target: gradientStop2
                position: 0.756
            }
        }
    ]

    transitions: [
        Transition {
            id: transitionFromAdas

            from: "adas"
            to: "*"

            ParallelAnimation {
                SequentialAnimation {
                    PropertyAnimation {
                        duration: roadTransitionDuration
                        target: scene
                        properties: "opacity"
                    }

                    PropertyAction {
                        target: timelineAnimation
                        property: "running"
                        value: false
                    }

                    PropertyAction {
                        target: adasTimeline
                        property: "currentFrame"
                        value: 0
                    }


                    PropertyAction {
                        target: lightArea
                        property: "brightness"
                        value: 0
                    }

                    PropertyAnimation {
                        targets: [camera, coupe, view3D]
                        properties: "x, y, z, eulerRotation.x, eulerRotation.y, eulerRotation.z, width, height, scale.x, scale.y, scale.z, fieldOfView, carBodyOpacity"
                        duration: adas.transitionDuration
                        easing.type: Easing.InOutQuad
                    }
                    ScriptAction {
                        script: {
                            if (adas.state === "tirePressure") {
                                tirePressureTimeline.enabled = true;
                                tirePressureTimeline.currentFrame = 0;
                                tirePressureAnimation.running = true;
                            }
                        }
                    }
                }
            }
        },

        Transition {
            id: transitionToAdas

            from: "*"
            to: "adas"

            SequentialAnimation {

                PropertyAnimation {
                    targets: [camera, coupe, view3D]
                    properties: "x, y, z, eulerRotation.x, eulerRotation.y, eulerRotation.z, width, height, scale.x, scale.y, scale.z, fieldOfView, carBodyOpacity"
                    duration: adas.transitionDuration
                    easing.type: Easing.InOutQuad
                }
                ScriptAction {
                    script: {
                        tirePressureAnimation.running = false;
                        adasTimeline.currentFrame = 0;
                        timelineAnimation.running = true;
                    }
                }
                ParallelAnimation {
                    PropertyAnimation {
                        duration: roadTransitionDuration
                        target: scene
                        properties: "opacity"
                    }
                    PropertyAnimation {
                        duration: transitionDuration
                        target: scene1
                        properties: "opacity"
                    }
                }
                PropertyAction {
                    target: adasTimeline
                    property: "currentFrame"
                    value: 0
                }
            }
        },

        Transition {
            id: transitionBetween
            SequentialAnimation {
                PropertyAnimation {
                    targets: [camera, coupe, view3D]
                    properties: "x, y, z, eulerRotation.x, eulerRotation.y, eulerRotation.z, width, height, scale.x, scale.y, scale.z, fieldOfView, carBodyOpacity"
                    duration: adas.transitionDuration / 2
                    easing.type: Easing.InOutQuad
                }
                ScriptAction {
                    script: {

                        if (adas.state === "tirePressure") {

                            tirePressureTimeline.enabled = true;
                            tirePressureAnimation.restart();
                        }
                        else if (adas.state !== "tirePressure") {

                            tirePressureAnimation.running = false;
                        }

                    }
                }
            }

            from: "*"
            to: "*"
        }
    ]

}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:714;width:1388}D{i:1}D{i:9}D{i:10}D{i:13}D{i:14}D{i:15}
D{i:16}D{i:17}D{i:12}D{i:20}D{i:21}D{i:22}D{i:23}D{i:24}D{i:25}D{i:26}D{i:19}D{i:27}
D{i:18}D{i:29}D{i:28}D{i:7}D{i:214;property:"brightness";target:"lightArea"}D{i:30}
D{i:254}D{i:259}
}
##^##*/
