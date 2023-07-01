#ifndef COMMUNICATIONHANDLER_H
#define COMMUNICATIONHANDLER_H

#include <QObject>
#include <QPointer>
#include "cantransreceiver.h"

class CommunicationHandler: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speed READ speed NOTIFY speedChanged)
    Q_PROPERTY(int vehicleRPM READ vehicleRPM NOTIFY vehicleRPMChanged)
    Q_PROPERTY(int motorTorque READ motorTorque NOTIFY motorTorqueChanged)
    Q_PROPERTY(bool ledStatus READ ledStatus NOTIFY ledStatusChanged)
    Q_PROPERTY(bool temperatureWarning READ temperatureWarning NOTIFY temperatureWarningChanged)
    Q_PROPERTY(int batteryState READ batteryState NOTIFY batteryStateChanged)
    Q_PROPERTY(int batteryTripDistance READ batteryTripDistance NOTIFY batteryTripDistanceChanged)
    Q_PROPERTY(float odometer READ odometer NOTIFY odometerChanged)
    Q_PROPERTY(int motorTemp READ motorTemp NOTIFY motorTempChanged)
    Q_PROPERTY(int controllerTemp READ controllerTemp NOTIFY controllerTempChanged)
    Q_PROPERTY(bool leftIndicator READ leftIndicator NOTIFY leftIndicatorChanged)
    Q_PROPERTY(bool rightIndicator READ rightIndicator NOTIFY rightIndicatorChanged)
    Q_PROPERTY(int power READ power NOTIFY powerChanged)
    Q_PROPERTY(int batteryADAP READ batteryADAP NOTIFY batteryADAPChanged)

public:
    CommunicationHandler(QObject* parent = nullptr);

    int speed() const { return m_speed; }
    int vehicleRPM() const { return m_vehicleRPM; }
    int motorTorque() const { return m_motorTorque; }
    bool ledStatus() const { return m_isledStatusOn; }
    bool temperatureWarning() const { return m_istemperatureWarningOn; }
    int batteryState() const { return m_batteryState; }
    int batteryTripDistance() const { return m_batteryTripDistance; }
    float odometer() const { return m_odometer; }
    int motorTemp() const { return m_motorTemp; }
    int controllerTemp() const { return m_controllerTemp; }
    bool leftIndicator() const { return m_isleftIndicatorOn; }
    bool rightIndicator() const { return m_isrightIndicatorOn; }
    int power() const { return m_power; }
    int batteryADAP() const { return m_batteryADAP; }

signals:
    void speedChanged(int);
    void vehicleRPMChanged(int);
    void motorTorqueChanged(int);
    void ledStatusChanged(bool);
    void temperatureWarningChanged(bool);
    void batteryStateChanged(int);
    void batteryTripDistanceChanged(int);
    void odometerChanged(float);
    void motorTempChanged(int);
    void controllerTempChanged(int);
    void leftIndicatorChanged(bool);
    void rightIndicatorChanged(bool);
    void powerChanged(int);
    void batteryADAPChanged(int);

private slots:
    void handleSpeedChanged(int);
    void handleVehiclerpmChanged(int);
    void handleMotortorqueChanged(int);
    void handleLedstatusChanged(bool);
    void handleTemperaturewarningChanged(bool);
    void handleBatterystateChanged(int);
    void handleBatterytripdistanceChanged(int);
    void handleOdometerChanged(float);
    void handleMotortempChanged(int);
    void handleControllertempChanged(int);
    void handleLeftindicatorChanged(bool);
    void handleRightindicatorChanged(bool);
    void handlePowerChanged(int);
    void handleBatteryadapChanged(int);

private:
    int m_speed = 0;
    int m_vehicleRPM = 0;
    int m_motorTorque = 0;
    int m_batteryState = 0;
    int m_batteryTripDistance = 0;
    float m_odometer = 0;
    int m_motorTemp = 0;
    int m_controllerTemp = 0;
    int m_power = 0;
    int m_batteryADAP = 0;
    bool m_isledStatusOn = false;
    bool m_istemperatureWarningOn = false;
    bool m_isleftIndicatorOn = false;
    bool m_isrightIndicatorOn = false;
    QPointer<CANTransreceiver> m_pCANListener = nullptr;
};

#endif // COMMUNICATIONHANDLER_H
