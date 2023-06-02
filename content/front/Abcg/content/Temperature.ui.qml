import QtQuick 2.8
import QtQuick.Studio.Components 1.0
import DigitalCluster 1.0

Item {
    id: temperature
    width: 72
    height: 46
    property int currentTemp: 27
    Text {
        id: temperatureValue
        x: 0
        y: 0
        width: 72
        height: 29
        color: Themes.textColor
        text: temperature.currentTemp + "°C"
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: Constants.font.family
    }

    Text {
        id: temperatureLabel
        x: 0
        y: 29
        width: 61
        height: 17
        color: Themes.labelColor
        text: "OUTSIDE"
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: Constants.font.family
    }
}

/*##^##
Designer {
    D{i:0;height:46;width:72}
}
##^##*/

