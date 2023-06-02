import QtQuick 2.12
import QtQuick3D 1.15
import Quick3DAssets.Coupe 1.0
import QtQuick 2.15
import QtQuick3D.Effects 1.15
import QtQuick.Timeline 1.0


Item {
    id: item1
    width: 1920
    height: 1080
    
    
    Image {
        id: ebcbb209164a57edbf9fc93c26f89af0
        x: 0
        y: -320
        width: 2912
        height: 1720
        source: "assets/ebcbb209-164a-57ed-bf9f-c93c26f89af0.png"
        fillMode: Image.PreserveAspectFit
    }



    View3D {
        id: view3D
        anchors.fill: parent
        anchors.rightMargin: -29
        anchors.bottomMargin: -8
        anchors.leftMargin: 29
        anchors.topMargin: 8
        camera: camera
        environment: sceneEnvironment
        HDRBloomTonemap {
            id: hDRBloomTonemap
            bloomThreshold: 0.3
            channelThreshold: 0.5
            blurFalloff: 0
            exposure: 0
            gamma: 1.4
        }

        SceneEnvironment {
            id: sceneEnvironment
            depthPrePassEnabled: false
            effects: hDRBloomTonemap
            probeBrightness: 70 // Studio_05e.hdr 120
            clearColor: "#000000"
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
            // probeBrightness: 200
            backgroundMode: SceneEnvironment.Transparent
            lightProbe: Texture {
                //source: "assets/hdr/hdr3a.hdr"
                source: "assets/hdr/Studio_05e.hdr"
                //                source: "assets/hdr/nature01.hdr"
            }
        }

        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                visible: false
                brightness: 30
            }

            PerspectiveCamera {
                id: camera
                x: 0
                y: 116.525
                fieldOfView: 40
                eulerRotation.z: 0
                eulerRotation.y: 0
                eulerRotation.x: 0
                z: 544.13806
            }

            Coupe {
                id: coupe
                metalness: 1
                specularTint: 1
                specular: 1

                carPaintColor: "#868686"
                frontLights: true
                carPaintRoughness: 0.36
                trunk: false
                passengerdoor: false
                driverdoor: false
                opacity: 1
                highBeamOn: true
                windowOpacity: 0
                windowColor: "#ffffff"
                windowRoughness: 0
                windowMetalness: 1 // whole model opacity
                carBodyOpacity: 1 // car paint opacity
            }

            AreaLight {
                id: lightArea
                x: -0
                y: 201.531
                width: 103
                height: 445
                visible: false
                eulerRotation.x: -90
                brightness: 90
                eulerRotation.z: 0
                eulerRotation.y: 0
                z: 41.85438
            }

            AreaLight {
                id: lightArea1
                x: -0
                y: 40.026
                width: 416
                height: 64
                visible: false
                eulerRotation.y: -0.00003
                eulerRotation.x: 0
                z: 544.27252
                eulerRotation.z: 0
                brightness: 0 // 388
            }
            
            Model {
                id: cube
                x: 190.071
                y: 0
                source: "#Cube"
                z: 0
                materials: cubeMaterial
                PrincipledMaterial {
                    id: cubeMaterial
                    lighting: DefaultMaterial.FragmentLighting

                    baseColorMap: Texture {
                        sourceItem: Label1 {
                            textVal: Math.round(coupe.eulerRotation.y)
                        }
                    }

                }
            }
        }



    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.rightMargin: 1160

        Connections {
            target: mouseArea
            onClicked: coupe.passengerdoor = !coupe.passengerdoor
        }
    }

    Timeline {
        id: carSpinTimeLine
        animations: [
            TimelineAnimation {
                id: carSpinAnimation
                running: true
                duration: 8000
                loops: -1
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: true

        KeyframeGroup {
            target: coupe
            property: "eulerRotation.x"
            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: coupe
            property: "eulerRotation.y"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: -180
                frame: 500
            }

            Keyframe {
                value: -360
                frame: 1000
            }
        }

        KeyframeGroup {
            target: coupe
            property: "eulerRotation.z"
            Keyframe {
                value: 0
                frame: 0
            }
        }
    }


    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        anchors.bottomMargin: 0
        anchors.leftMargin: 1236
        anchors.topMargin: 0
        anchors.rightMargin: 14


        Connections {
            target: mouseArea1
            onClicked: coupe.driverdoor = !coupe.driverdoor
        }
    }

    MouseArea {
        id: mouseArea2
        x: 824
        y: 566
        width: 328
        height: 522

        Connections {
            target: mouseArea2
            onClicked: coupe.frontLights = !coupe.frontLights
        }
    }

    Text {
        id: text1
        x: 906
        y: 958
        color: "#ffffff"
        text: "lights: " + coupe.frontLights
        font.pixelSize: 42
    }

    MouseArea {
        id: mouseTrunk
        x: 784
        y: -6
        width: 420
        height: 468

        Connections {
            target: mouseTrunk
            onClicked: coupe.trunk = !coupe.trunk
        }

        Text {
            id: text2
            x: 118
            y: 190
            color: "#ffffff"
            text: "trunk: " + coupe.trunk
            font.pixelSize: 42
        }
    }
    










}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:18}
}
##^##*/
