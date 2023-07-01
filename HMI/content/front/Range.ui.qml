import QtQuick 2.15

Item {
    id: range
    width: 241
    height: 60

    property int currentRange: 346
    Text {
        id: rangeValue
        width: Math.round(mainwind.width * 0.126) //241
        height: Math.round(mainwind.width * 0.02) //38
        anchors.right: parent.right
        color: "white"
        text: range.currentRange + " km"
        font.pixelSize: Math.round(mainwind.width * 0.017)//32
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: Constants.font.family
    }

    Text {
        id: rangeLabel
        anchors.top: rangeValue.bottom
        anchors.topMargin: 5
        anchors.right: parent.right
        width: Math.round(mainwind.width * 0.126)//241
        height: Math.round(mainwind.width * 0.012)//22
        color: "#d3d3d3"
        text: "RANGE"
        font.pixelSize: Math.round(mainwind.width * 0.0099) //18
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: Constants.font.family
    }
}
