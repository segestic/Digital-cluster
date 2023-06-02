import QtQuick 2.15

Item {
    id: range
    width: 241
    height: 60
    property int currentRange: 346
    Text {
        id: rangeValue
        x: 0
        y: 0
        width: 241
        height: 38
        color: "white"
        text: range.currentRange + " km"
        font.pixelSize: 32
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: Constants.font.family
    }

    Text {
        id: rangeLabel
        x: 0
        y: 38
        width: 241
        height: 22
        color: "#d3d3d3"
        text: "RANGE"
        font.pixelSize: 18
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: Constants.font.family
    }
}
