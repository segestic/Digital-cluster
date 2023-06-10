import QtQuick 2.15
import "../../imports"

Item {
    id: time
    width: 62
    height: 46
    property string currentTime: timer.currentTime//ClockController.currentTime

    Text {
        id: timeValue
        width: 62
        height: 29
        color: "white"
        text: time.currentTime
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        //font.family: Constants.font.family
    }

    Text {
        id: timeLabel
        anchors.top: timeValue.bottom

//        x: 0
//        y: 29
        width: 34
        height: 17
        color: "#d3d3d3"
        text: "TIME"
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        //font.family: Constants.font.family
    }

    //debug....ClockController
    Timer {
        id: timer
        property var currentDate: new Date()
        property string currentTime: currentDate.getHours() + ":" + currentDate.getMinutes()
        interval: 1000
        repeat: true
        running: true
        onTriggered: timer.currentDate = new Date()
    }
}

/*##^##
Designer {
    D{i:0;height:46;width:62}
}
##^##*/
