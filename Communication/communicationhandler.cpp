
#include "communicationhandler.h"
//#include <QDebug>

CommunicationHandler::CommunicationHandler(QObject *parent): QObject(parent)
{
    m_pCANListener = new CANTransreceiver(this);
    if (m_pCANListener)
    {
        connect(m_pCANListener, SIGNAL(speedChanged(int)), this, SLOT(handleSpeedChanged(int)));
        connect(m_pCANListener, SIGNAL(vehicleRPMChanged(int)), this, SLOT(handleVehiclerpmChanged(int)));
        connect(m_pCANListener, SIGNAL(motorTorqueChanged(int)), this, SLOT(handleMotortorqueChanged(int)));
        connect(m_pCANListener, SIGNAL(ledStatusChanged(bool)), this, SLOT(handleLedstatusChanged(bool)));
        connect(m_pCANListener, SIGNAL(temperatureWarningChanged(bool)), this, SLOT(handleTemperaturewarningChanged(bool)));
        connect(m_pCANListener, SIGNAL(batteryStateChanged(int)), this, SLOT(handleBatterystateChanged(int)));
        connect(m_pCANListener, SIGNAL(batteryTripDistanceChanged(int)), this, SLOT(handleBatterytripdistanceChanged(int)));
        connect(m_pCANListener, SIGNAL(odometerChanged(float)), this, SLOT(handleOdometerChanged(float)));
        connect(m_pCANListener, SIGNAL(motorTempChanged(int)), this, SLOT(handleMotortempChanged(int)));
        connect(m_pCANListener, SIGNAL(controllerTempChanged(int)), this, SLOT(handleControllertempChanged(int)));
        connect(m_pCANListener, SIGNAL(leftIndicatorChanged(bool)), this, SLOT(handleLeftindicatorChanged(bool)));
        connect(m_pCANListener, SIGNAL(rightIndicatorChanged(bool)), this, SLOT(handleRightindicatorChanged(bool)));
        connect(m_pCANListener, SIGNAL(powerChanged(int)), this, SLOT(handlePowerChanged(int)));
        connect(m_pCANListener, SIGNAL(batteryADAPChanged(int)), this, SLOT(handleBatteryadapChanged(int)));
    }
    else
    {
        //qDebug()<<"CANTransreceiver failed to load";
    }
}

void CommunicationHandler::handleSpeedChanged(int speed)
{
    m_speed = speed;
    emit speedChanged(m_speed);
    //qDebug() << "speedChanged Changed: " << m_speed;
}

void CommunicationHandler::handleVehiclerpmChanged(int vehicleRPM)
{
    m_vehicleRPM = vehicleRPM;
    emit vehicleRPMChanged(m_vehicleRPM);
    //qDebug() << "vehicleRPMChanged Changed: " << m_vehicleRPM;
}

void CommunicationHandler::handleMotortorqueChanged(int motorTorque)
{
    m_motorTorque = motorTorque;
    emit motorTorqueChanged(m_motorTorque);
    //qDebug() << "motorTorqueChanged Changed: " << m_motorTorque;
}

void CommunicationHandler::handleLedstatusChanged(bool ledStatus)
{
    m_isledStatusOn = ledStatus;
    emit ledStatusChanged(m_isledStatusOn);
    //qDebug() << "ledStatusChanged Changed: " << m_ledStatus;
}

void CommunicationHandler::handleTemperaturewarningChanged(bool temperatureWarning)
{
    m_istemperatureWarningOn = temperatureWarning;
    emit temperatureWarningChanged(m_istemperatureWarningOn);
    //qDebug() << "temperatureWarningChanged Changed: " << m_temperatureWarning;
}

void CommunicationHandler::handleBatterystateChanged(int batteryState)
{
    m_batteryState = batteryState;
    emit batteryStateChanged(m_batteryState);
    //qDebug() << "batteryStateChanged Changed: " << m_batteryState;
}

void CommunicationHandler::handleBatterytripdistanceChanged(int batteryTripDistance)
{
    m_batteryTripDistance = batteryTripDistance;
    emit batteryTripDistanceChanged(m_batteryTripDistance);
    //qDebug() << "batteryTripDistanceChanged Changed: " << m_batteryTripDistance;
}

void CommunicationHandler::handleOdometerChanged(float odometer)
{
    m_odometer = odometer;
    emit odometerChanged(m_odometer);
    //qDebug() << "odometerChanged Changed: " << m_odometer;
}

void CommunicationHandler::handleMotortempChanged(int motorTemp)
{
    m_motorTemp = motorTemp;
    emit motorTempChanged(m_motorTemp);
    //qDebug() << "motorTempChanged Changed: " << m_motorTemp;
}

void CommunicationHandler::handleControllertempChanged(int controllerTemp)
{
    m_controllerTemp = controllerTemp;
    emit controllerTempChanged(m_controllerTemp);
    //qDebug() << "controllerTempChanged Changed: " << m_controllerTemp;
}

void CommunicationHandler::handleLeftindicatorChanged(bool leftIndicator)
{
    m_isleftIndicatorOn = leftIndicator;
    emit leftIndicatorChanged(m_isleftIndicatorOn);
    //qDebug() << "leftIndicatorChanged Changed: " << m_leftIndicator;
}

void CommunicationHandler::handleRightindicatorChanged(bool rightIndicator)
{
    m_isrightIndicatorOn = rightIndicator;
    emit rightIndicatorChanged(m_isrightIndicatorOn);
    //qDebug() << "rightIndicatorChanged Changed: " << m_rightIndicator;
}

void CommunicationHandler::handlePowerChanged(int power)
{
    m_power = power;
    emit powerChanged(m_power);
    //qDebug() << "powerChanged Changed: " << m_power;
}

void CommunicationHandler::handleBatteryadapChanged(int batteryADAP)
{
    m_batteryADAP = batteryADAP;
    emit batteryADAPChanged(m_batteryADAP);
    //qDebug() << "batteryADAPChanged Changed: " << m_batteryADAP;
}
