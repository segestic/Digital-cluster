import QtQuick 2.15
import "../../imports"
import QtGraphicalEffects 1.0

Item {
    id: middleInfo

    //debug
    QtObject{
        id:mainwind
        property real width: 1350
        property real height: Math.round(width*0.4)
    }

    width: Math.round(mainwind.width * 0.25)
    height: Math.round(mainwind.height)


    Rectangle {
        id: innerbackg
        width: parent.width
        height: parent.height * 0.75
        color: "white"
        opacity: 0.3
        anchors.verticalCenter: parent.verticalCenter
        radius: Math.round(mainwind.width * 0.04)
        z: 0
        DropShadow {
            id: shadow
            //anchors.fill: innerbackg
            horizontalOffset: 5
            verticalOffset: 5
            radius: 3
            samples: 16
            color: "green"
        }
    }

    Text {
        id: keyInfo1
        color: "black"
        text: "TurnLeftIndicator - LeftKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: innerbackg.bottom
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }
    Text {
        id: keyInfo2
        color: "black"
        text: "TurnLeftIndicator - Right Key"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo1.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    Text {
        id: keyInfo3
        color: "black"
        text: "Increase Speed - UpKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo2.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    Text {
        id: keyInfo4
        color: "black"
        text: "Increase Speed - UpKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo3.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }
    Text {
        id: keyInfo5
        color: "black"
        text: "Increase Speed - UpKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo4.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    Text {
        id: keyInfo6
        color: "black"
        text: "Increase Speed - UpKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo5.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }
    Text {
        id: keyInfo7
        color: "black"
        text: "Increase Speed - UpKey"
        font.pixelSize: Math.round(mainwind.width * 0.01)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.bottom: keyInfo6.top
        anchors.bottomMargin: Math.round(mainwind.width * 0.008)
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }
}

/*##^##
Designer {
    D{i:0;height:46;width:62}
}
##^##*/
