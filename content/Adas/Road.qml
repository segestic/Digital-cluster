import QtQuick 2.15
import QtQuick3D 1.15
//import QtQuick.Studio.Effects 1.0
//import QtQuick3D.Materials 1.15
import QtQuick3D.Effects 1.15


import QtQuick3D.AssetUtils
import QtQuick3D.Helpers
import QtQuick3D.Particles3D




//import Qt3D.Core 2.0
//import Qt3D.Render 2.15
//import Qt3D.Extras 2.15

Entity {
    id: rootNode
    visible: true
    property bool leftRightState: false
    property alias principledMaterialEmissiveMap: principledMaterial.emissiveMap
    property alias principledMaterialEmissiveColor: principledMaterial.emissiveColor

    Entity {
        id: road
        components: [
            Transform {
                translation: Qt.vector3d(0, -254.692, -254.692)
                rotationX: -90
            },
            Model {
                source: "meshes/road.mesh"
                materials: [ principledMaterial ]
                NodeInstantiator {
                    id: pivotInstantiator
                    propertyName: "pivot"
                    component: Transform { x: 0 }
                }
            }
        ]
    }

    Entity {
        id: __materialLibrary__

        PrincipledMaterial {
            id: principledMaterial
            opacity: 1
            objectName: "principledMaterial"
            opacityMap: mainTexture
            opacityChannel: Material.R
            baseColorMap: mainTexture
            baseColor: "#ffffff"
            metalness: 1
            emissiveMap: leftWarningTexture
            emissiveColor: "#000000"

            Texture2D {
                id: mainTexture
                source: "roadBackground_Dark.png"
            }

            Texture2D {
                id: leftWarningTexture
                source: "roadWarningLeft_Black.png"
            }

            Texture2D {
                id: rightWarningTexture
                source: "roadWarningRight_Black.png"
            }
        }
    }

    states: [
        State {
            name: "LeftWarning"
            when: !rootNode.leftRightState

            PropertyChanges {
                target: principledMaterial
                property: "emissiveMap"
                value: leftWarningTexture
            }
        },
        State {
            name: "RightWarning"
            when: rootNode.leftRightState

            PropertyChanges {
                target: principledMaterial
                property: "emissiveMap"
                value: rightWarningTexture
            }
        }
    ]
}





//Entity {
//    id: rootNode
//    visible: true
//    property bool leftRightState: false
//    property alias principledMaterialEmissiveMap: principledMaterial.emissiveMap
//    property alias principledMaterialEmissiveColor: principledMaterial.emissiveColor

//    Model {
//        id: road
//        y: -254.692
//        z: -254.692
//        eulerRotation.x: -90
//        source: "meshes/road.mesh"
//        materials: principledMaterial
//        pivot.x: 0
//    }

//    Node {
//        id: __materialLibrary__

//        PrincipledMaterial {
//            id: principledMaterial
//            opacity: 1
//            objectName: "principledMaterial"
//            opacityMap: mainTexture
//            opacityChannel: Material.R
//            baseColorMap: mainTexture
//            baseColor: "#ffffff"
//            metalness: 1
//            emissiveMap: leftWarningTexture
//            emissiveColor: "#000000"

//            Texture {
//                id: mainTexture
//                source: "roadBackground_Dark.png"
//            }

//            Texture {
//                id: leftWarningTexture
//                source: "roadWarningLeft_Black.png"
//            }

//            Texture {
//                id: rightWarningTexture
//                source: "roadWarningRight_Black.png"
//            }
//        }
//    }

//    states: [
//        State {
//            name: "LeftWarning"
//            when: !rootNode.leftRightState

//            PropertyChanges {
//                target: principledMaterial
//                emissiveMap: leftWarningTexture
//            }
//        },
//        State {
//            name: "RightWarning"
//            when: rootNode.leftRightState

//            PropertyChanges {
//                target: principledMaterial
//                emissiveMap: rightWarningTexture
//            }
//        }
//    ]
//}








////import QtQuick 2.15
////import QtQuick3D
//////import QtQuick.Studio.Effects
//////import QtQuick3D.Materials 1.15
////import QtQuick3D.Effects


//Node {
//    id: rootNode
//    visible: true
//    property bool leftRightState: false
//    property alias principledMaterialEmissiveMap: principledMaterial.emissiveMap
//    //property alias principledMaterialEmissiveColor: principledMaterial.emissiveColor

//    Model {
//        id: road
//        y: -254.692
//        z: -254.692
//        eulerRotation.x: -90
//        source: "meshes/road.mesh"
//        materials: principledMaterial
//        pivot.x: 0



//        Material {
//            id: principledMaterial
//            opacity: 1
//            opacityMap: mainTexture
//            opacityChannel: Material.R
//            baseColorMap: mainTexture
//            baseColor: "#ffffff"
//            metalness: 1
//            emissiveMap: leftWarningTexture
//            //emissiveColor: "#000000"

//            Texture {
//                id: mainTexture
//                source: "roadBackground_Dark.png"
//            }

//            Texture {
//                id: leftWarningTexture
//                source: "roadWarningLeft_Black.png"
//            }

//            Texture {
//                id: rightWarningTexture
//                source: "roadWarningRight_Black.png"
//            }
//        }
//    }
//    states: [
//        State {
//            name: "LeftWarning"
//            when: !rootNode.leftRightState

//            PropertyChanges {
//                target: principledMaterial
//                emissiveMap: leftWarningTexture
//            }
//        },
//        State {
//            name: "RightWarning"
//            when: rootNode.leftRightState

//            PropertyChanges {
//                target: principledMaterial
//                emissiveMap: rightWarningTexture
//            }
//        }
//    ]
//}




