import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode

    Node {
        id: group003
        eulerRotation.x: -90

        Model {
            id: car
            source: "meshes/car.mesh"

            DefaultMaterial {
                id: material__77_material
                emissiveColor: "#00000000"
                lighting: DefaultMaterial.FragmentLighting
                diffuseMap: npcCarTexture
                diffuseColor: "#ffffff"

                Texture {
                    id: npcCarTexture
                    source: "Car_Complete_Map.png"
                }
            }
            materials: [
                material__77_material
            ]
        }

        Model {
            id: plane
            x: 0
            y: 126.478
            source: "#Rectangle"
            receivesShadows: true
            castsShadows: true
            scale.z: 1
            scale.y: 4.79048
            scale.x: 3.79883
            z: -41.73405
            materials: rectMaterial
            DefaultMaterial {
                id: rectMaterial
                lighting: DefaultMaterial.NoLighting
                diffuseMap: shadow
                diffuseColor: "#4aee45"

                Texture {
                    id: shadow
                    source: "Car_Shadow.png"
                    scaleU: 1
                }
            }
        }
    }
}
