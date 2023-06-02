pragma Singleton
import QtQuick 2.12


Item {
    id: clockController
    property var currentDate: new Date()
    property string currentTime: currentDate.getHours() + ":" + currentDate.getMinutes()

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: true
        onTriggered: clockController.currentDate = new Date()
    }
}


