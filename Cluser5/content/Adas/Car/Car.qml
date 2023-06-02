import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode

    Model {
        id: car
        y: 189.294
        z: 50.815
        eulerRotation.x: -88.2698
        source: "meshes/car.mesh"

        DefaultMaterial {
            id: material__77_material
            fresnelPower: 204
            specularTint: "#ffffff"
            diffuseMap: carTexture
            diffuseColor: "#ffffff"
        }

        DefaultMaterial {
            id: material__78_material
            indexOfRefraction: 3
            diffuseColor: "#ff0d0d0d"
        }

        Texture {
            id: carTexture
            source: "Car.png"
        }
        materials: [
            material__77_material,
            material__78_material
        ]
    }

    Model {
        id: car_Shadow
        x: 0
        y: 120.723
        eulerRotation.x: -90
        source: "meshes/car_Shadow.mesh"
        scale.z: 1
        scale.y: 1.53833
        scale.x: 1.55126
        z: -71.67239

        DefaultMaterial {
            id: defaultMaterial_material
            diffuseMap: shadowTexture
            diffuseColor: "#ffcccccc"

            Texture {
                id: shadowTexture
                source: "Car_Shadow.png"
                scaleU: 1
                scaleV: 1
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }
}
