import QtQuick 2.8
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick3D 1.15
import QtQuick 2.15

import "Road"
import "Car"
import "Car_NPC"

import QtQuick3D.Materials 1.15
import QtQuick3D.Effects 1.15


Item {
    id: adas
    width: Math.round(mainwind.width * 0.446)//856
    height: Math.round(mainwind.width * 0.213) //408
    property alias adasTimelineCurrentFrame: adasTimeline.currentFrame
    property bool viewTopBot: true

    View3D {
        id: view3D
        anchors.fill: parent
        layer.enabled: true
        environment: sceneEnvironment
        SceneEnvironment {
            id: sceneEnvironment
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene

            DirectionalLight {
                id: directionalLight1
                eulerRotation.x: -25.47694
                eulerRotation.y: -51.69841
                eulerRotation.z: 28.71718
            }

            PerspectiveCamera {
                id: camera
                y: -29.69
                clipFar: 3000
                fieldOfView: 42
                eulerRotation.x: -24
                z: 224.64
            }

            Road {
                id: road2
                opacity: 1
                leftRightState: false
                principledMaterialEmissiveColor: "#b20000"
            }
        }

        Node {
            id: scene1
            x: -0
            y: -375.691
            z: -193.54796

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
                x: 6
                y: 264
                opacity: 1
                scale.z: 0.7
                scale.y: 0.7
                scale.x: 0.7
                z: -94
                visible: true
            }

//            Coupe {
//                id: coupe
//                x: -0
//                y: 120.94
//                driverdoor: false
//                scale.z: 0.5
//                scale.y: 0.5
//                scale.x: 0.5
//                z: 11.78766
//                eulerRotation.y: 180
//            }
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
        endFrame: 4000

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
                value: 1
                frame: 2131
            }

            Keyframe {
                value: 1
                frame: 2437
            }

            Keyframe {
                value: 0
                frame: 2535
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
                frame: 3155
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
                frame: 3001
            }

            Keyframe {
                value: 454.69391
                frame: 3159
            }

            Keyframe {
                value: -2833.3689
                frame: 4000
            }

            Keyframe {
                value: -2811.20117
                frame: 2035
            }

            Keyframe {
                value: -1597.5675
                frame: 2205
            }

            Keyframe {
                value: -308.4585
                frame: 2548
            }

            Keyframe {
                value: 6.19807
                frame: 2762
            }
        }

        KeyframeGroup {
            target: car_NPC2
            property: "x"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1000
                value: 144.99997
            }

            Keyframe {
                frame: 452
                value: 0
            }

            Keyframe {
                frame: 986
                value: 145
            }

            Keyframe {
                frame: 647
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
                frame: 3001
            }

            Keyframe {
                value: -161.67902
                frame: 3159
            }

            Keyframe {
                value: -161.67908
                frame: 4000
            }

            Keyframe {
                value: 4.99974
                frame: 2035
            }

            Keyframe {
                value: 0
                frame: 2205
            }

            Keyframe {
                value: 1.2464
                frame: 2548
            }

            Keyframe {
                value: 159.84119
                frame: 2637
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
                frame: 1270
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
                frame: 374
                value: 0
            }

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
                value: 0
                frame: 2375
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
                frame: 956
                value: "#000000"
            }

            Keyframe {
                frame: 521
                value: "#000000"
            }

            Keyframe {
                frame: 829
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
                frame: 2829
            }

            Keyframe {
                value: "#000000"
                frame: 2956
            }

            Keyframe {
                value: "#000000"
                frame: 2993
            }

            Keyframe {
                value: "#ff0000"
                frame: 3080
            }

            Keyframe {
                value: "#ff0000"
                frame: 3338
            }

            Keyframe {
                value: "#000000"
                frame: 3395
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
            target: car_NPC3
            property: "y"
            Keyframe {
                value: 213
                frame: 948
            }
        }
    }

    Item {
        id: __materialLibrary__
    }

    states: [
        State {
            name: "Normal"
            when: !adas.viewTopBot

            PropertyChanges {
                target: adasTimeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
            }
        },
        State {
            name: "Top"
            when: adas.viewTopBot

            PropertyChanges {
                target: camera
                x: 0
                y: 679.518
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -66.45138
                z: 27.98111
            }

            PropertyChanges {
                target: adasTimeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                running: true
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
                        target: camera
                        property: "z"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camera
                        property: "y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camera
                        property: "x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 51
                    }

                    PropertyAnimation {
                        target: camera
                        property: "eulerRotation.x"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camera
                        property: "eulerRotation.y"
                        duration: 150
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: camera
                        property: "eulerRotation.z"
                        duration: 150
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:408;width:856}D{i:205;transitionDuration:2000}D{i:16;property:"z";target:"car_NPC"}
D{i:17;property:"z";target:"car_NPC"}D{i:18;property:"z";target:"car_NPC"}D{i:19;property:"z";target:"car_NPC"}
D{i:20;property:"z";target:"car_NPC"}D{i:21;property:"z";target:"car_NPC"}D{i:22;property:"z";target:"car_NPC"}
D{i:29;property:"opacity";target:"car_NPC"}D{i:30;property:"opacity";target:"car_NPC"}
D{i:31;property:"opacity";target:"car_NPC"}D{i:32;property:"opacity";target:"car_NPC"}
D{i:33;property:"opacity";target:"car_NPC"}D{i:34;property:"opacity";target:"car_NPC"}
D{i:35;property:"opacity";target:"car_NPC"}D{i:36;property:"opacity";target:"car_NPC"}
D{i:37;property:"opacity";target:"car_NPC"}D{i:38;property:"opacity";target:"car_NPC"}
D{i:49;property:"z";target:"car_NPC1"}D{i:50;property:"z";target:"car_NPC1"}D{i:51;property:"z";target:"car_NPC1"}
D{i:52;property:"z";target:"car_NPC1"}D{i:53;property:"z";target:"car_NPC1"}D{i:59;property:"y";target:"car_NPC1"}
D{i:60;property:"y";target:"car_NPC1"}D{i:61;property:"y";target:"car_NPC1"}D{i:62;property:"y";target:"car_NPC1"}
D{i:67;property:"x";target:"car_NPC1"}D{i:68;property:"x";target:"car_NPC1"}D{i:69;property:"x";target:"car_NPC1"}
D{i:70;property:"x";target:"car_NPC1"}D{i:75;property:"principledMaterialEmissiveColor";target:"road2"}
D{i:76;property:"principledMaterialEmissiveColor";target:"road2"}D{i:77;property:"principledMaterialEmissiveColor";target:"road2"}
D{i:78;property:"principledMaterialEmissiveColor";target:"road2"}D{i:79;property:"principledMaterialEmissiveColor";target:"road2"}
D{i:80;property:"principledMaterialEmissiveColor";target:"road2"}D{i:81;property:"principledMaterialEmissiveColor";target:"road2"}
D{i:82;property:"principledMaterialEmissiveColor";target:"road2"}D{i:83;property:"principledMaterialEmissiveColor";target:"road2"}
D{i:84;property:"principledMaterialEmissiveColor";target:"road2"}D{i:88;property:"leftRightState";target:"road2"}
D{i:89;property:"leftRightState";target:"road2"}D{i:90;property:"leftRightState";target:"road2"}
D{i:104;property:"x";target:"camera"}D{i:105;property:"x";target:"camera"}D{i:119;property:"y";target:"camera"}
D{i:120;property:"y";target:"camera"}D{i:132;property:"z";target:"camera"}D{i:133;property:"z";target:"camera"}
D{i:141;property:"eulerRotation.x";target:"camera"}D{i:142;property:"eulerRotation.x";target:"camera"}
D{i:160;property:"eulerRotation.y";target:"camera"}D{i:161;property:"eulerRotation.y";target:"camera"}
D{i:169;property:"eulerRotation.z";target:"camera"}D{i:170;property:"eulerRotation.z";target:"camera"}
}
##^##*/

