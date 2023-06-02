import QtQuick 2.8
import DigitalCluster 1.0

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
        color: Themes.textColor
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
        color: Themes.labelColor
        text: "RANGE"
        font.pixelSize: 18
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: Constants.font.family
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#000000";height:60;width:241}
}
##^##*/

