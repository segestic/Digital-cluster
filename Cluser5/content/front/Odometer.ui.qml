import QtQuick 2.8

Item {
    id: odometer
    width: 112
    height: 46
    property alias odometerValueText: odometerValue.text

    Text {
        id: odometerValue
        x: 0
        y: 0
        width: 112
        height: 29
        color: "white"
        text: "123"
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: Constants.font.family
    }

    Text {
        id: odometerLabel
        x: 0
        y: 29
        width: 80
        height: 17
        color: "#d3d3d3"
        text: "KM"
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: Constants.font.family
    }
}

