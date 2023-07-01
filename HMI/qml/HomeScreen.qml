
import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: root

    property int speed: m_communicationHandler.speed
    property int vehicleRPM: m_communicationHandler.vehicleRPM
    property int motorTorque: m_communicationHandler.motorTorque
    property bool ledStatus: m_communicationHandler.ledStatus
    property bool temperatureWarning: m_communicationHandler.temperatureWarning
    property int batteryState: m_communicationHandler.batteryState
    property int batteryTripDistance: m_communicationHandler.batteryTripDistance
    property real odometer: m_communicationHandler.odometer
    property int motorTemp: m_communicationHandler.motorTemp
    property int controllerTemp: m_communicationHandler.controllerTemp
    property bool leftIndicator: m_communicationHandler.leftIndicator
    property bool rightIndicator: m_communicationHandler.rightIndicator
    property int power: m_communicationHandler.power
    property int batteryADAP: m_communicationHandler.batteryADAP
    property bool isTemperatureError: m_communicationHandler.temperatureWarning
    
    onPowerChanged: {
        if (power > 0) {
            console.log('Power is -', (212 / power))
        } else {
            console.log('Power is -', (359 / power))
        }
    }

    onSpeedChanged: {
        m_audioHandler.handleSpeedChanged(Math.ceil(speed))
    }

    function convertDistance(distance) {
        distance = Math.round(distance * 10) / 10
        return distance
    }

    Text {
        id: id_speed
        text: root.speed ? root.speed : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: parent.top
    }

    Text {
        id: id_vehicleRPM
        text: root.vehicleRPM ? root.vehicleRPM : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_speed.bottom
    }

    Text {
        id: id_motorTorque
        text: root.motorTorque ? root.motorTorque : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_vehicleRPM.bottom
    }

    Text {
        id: id_ledStatus
        text: root.ledStatus ? root.ledStatus : "ledStatus is Off"
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_motorTorque.bottom        
    }

    Text {
        id: id_temperatureWarning
        text: root.temperatureWarning ? root.temperatureWarning : "temperatureWarning is Off"
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_ledStatus.bottom        
    }

    Text {
        id: id_batteryState
        text: root.batteryState ? root.batteryState : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_temperatureWarning.bottom
    }

    Text {
        id: id_batteryTripDistance
        text: root.batteryTripDistance ? root.batteryTripDistance : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_batteryState.bottom
    }

    Text {
        id: id_odometer
        text: root.odometer ? root.odometer : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_batteryTripDistance.bottom
    }

    Text {
        id: id_motorTemp
        text: root.motorTemp ? root.motorTemp : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_odometer.bottom
    }

    Text {
        id: id_controllerTemp
        text: root.controllerTemp ? root.controllerTemp : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_motorTemp.bottom
    }

    Text {
        id: id_leftIndicator
        text: root.leftIndicator ? root.leftIndicator : "leftIndicator is Off"
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_controllerTemp.bottom        
    }

    Text {
        id: id_rightIndicator
        text: root.rightIndicator ? root.rightIndicator : "rightIndicator is Off"
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_leftIndicator.bottom        
    }

    Text {
        id: id_power
        text: root.power ? root.power : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_rightIndicator.bottom
    }

    Text {
        id: id_batteryADAP
        text: root.batteryADAP ? root.batteryADAP : 0
        font.pixelSize: Math.round(root.width * 0.05)
        anchors.top: id_power.bottom
    }
}