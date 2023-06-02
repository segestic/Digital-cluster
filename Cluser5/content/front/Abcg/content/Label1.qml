import QtQuick 2.12
import QtQuick3D 1.15
import Quick3DAssets.Coupe 1.0
import QtQuick 2.15
import QtQuick3D.Effects 1.15
import QtQuick.Timeline 1.0


Rectangle {
    id: label1
    width: 200
    height: 200
    color: "#bb6000"
    radius: 100
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#bb6000"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    property string textVal: "1"

    Text {
        id: labelText
        x: 42
        y: 63
        color: "#d8bcbc"
        text: textVal
        font.pixelSize: 62
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
