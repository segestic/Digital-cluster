import QtQuick 2.12

Item {
    id: odometerController
    width: 72
    height: 46

    property int distance: 123456

    Odometer {
        id: odometer
        odometerValueText: numberWithSpaces(odometerController.distance)
        function numberWithSpaces(x) {
            return Number(x).toLocaleString(Qt.locale("pl_PL"), "f", 0)
        }

    }
}



/*##^##
Designer {
    D{i:0;height:46;width:112}
}
##^##*/
