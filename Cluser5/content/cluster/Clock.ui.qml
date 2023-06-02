import QtQuick 2.8
//import QtQuick.Studio.Components 1.0
import DigitalCluster 1.0

Item {
    id: time
    width: 62
    height: 46
    property string currentTime: ClockController.currentTime
    Text {
        id: timeValue
        x: 0
        y: 0
        width: 62
        height: 29
        color: Themes.textColor
        text: time.currentTime
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: Constants.font.family
    }

    Text {
        id: timeLabel
        x: 0
        y: 29
        width: 34
        height: 17
        color: Themes.labelColor
        text: "TIME"
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
    D{i:0;height:46;width:62}
}
##^##*/
