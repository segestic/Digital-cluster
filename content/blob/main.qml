import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    width: 800
    height: 480
    title: qsTr("Hex")

    Image {
        source: "img/background.png"
        anchors.fill: parent
        fillMode: Image.Tile
    }

    Image {
        id: img
        anchors.fill: parent
        source: "img/img.jpg"
        fillMode: Image.PreserveAspectCrop
        mipmap: true
        visible: true
    }



    ShaderEffectSource {
        id: shaderEffectSource
        width: 300
        height: 300
        sourceItem: img
        hideSource: true



    }

    Blob {
        anchors.fill: parent
        texture: shaderEffectSource
//        blobFactor: 80.
//        ringCount: 3
//        ringMinDist: 0.
//        ringMaxDist: 100.
//        ringWidth: 1.5
//        easing: 1.

        fade: slider3.value * 20
        thickness: slider2.value * 10

        density: slider1.value * 200
        animOffset: slider0.value // direction
    }

    Slider {
        id: slider3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: slider2.top
        height: 20
        opacity: 0.5
    }

    Slider {
        id: slider2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: slider1.top
        height: 20
        opacity: 0.5
    }


    Slider {
        id: slider1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: slider0.top
        height: 20
        opacity: 0.5
    }

    Slider {
        id: slider0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 20
        opacity: 0.5
    }

    Text {
        id: text1
        text: slider0.value
        font.pixelSize: 12
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}
}
##^##*/
