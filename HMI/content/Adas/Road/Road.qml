import QtQuick 2.15
import QtQuick3D 1.15
//import QtQuick.Studio.Effects 1.0
import QtQuick3D.Materials 1.15
import QtQuick3D.Effects 1.15


Node {
    id: rootNode
    visible: true
    property bool leftRightState: false
    property alias principledMaterialEmissiveMap: principledMaterial.emissiveMap
    property alias principledMaterialEmissiveColor: principledMaterial.emissiveColor
    
    Model {
        id: road
        y: -254.692
        z: -254.692
        eulerRotation.x: -90
        source: "meshes/road.mesh"
        materials: principledMaterial
        pivot.x: 0
        
        
    }
    
    Node {
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
            
            Texture {
                id: mainTexture
                source: "roadBackground_Dark.png"
            }
            
            Texture {
                id: leftWarningTexture
                source: "roadWarningLeft_Black.png"
            }
            
            Texture {
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
                emissiveMap: leftWarningTexture
            }
        },
        State {
            name: "RightWarning"
            when: rootNode.leftRightState
            
            PropertyChanges {
                target: principledMaterial
                emissiveMap: rightWarningTexture
            }
        }
    ]
}




