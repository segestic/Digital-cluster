#ifndef CANTRANSRECEIVER_H
#define CANTRANSRECEIVER_H

#include "icommunication.h"
#include <QMutex>
#include <QCanBusFrame>
#include <QCanBusDevice>


enum ECANFrame
{
    //messageID(in Decimal not hexa) - as it is in dbc
    kFRAMEID_SPEED = 515,           //0x203
    kFRAMEID_LED_STATUS = 1232,     //0x4D0
    kFRAMEID_BATTERY_TEMP = 726,    //0x2D6
    kFRAMEID_ODOMETER = 983,        //0x000003D7
    kFRAMEID_POWER = 727,           //0x000002D7
    kBATTERY_INFO  =  982           //0x3D6
};

enum ETemperature
{
    kBATTERY_HIGH_TEMP,
    kBATTERY_AVG_TEMP,
    kBATTERY_LOW_TEMP,
    kMOTOR_HI_TEMP,
    kMOTOR_LOW_TEMP,
    kSINK_HI_TEMP,
    kSINK_LOW_TEMP

};

class CANTransreceiver : public QObject,public ICommunication
{
    Q_OBJECT
    Q_INTERFACES(ICommunication)

public:
    explicit CANTransreceiver(QObject *parent = nullptr);
    ~CANTransreceiver();

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
    void receiveCANdata();
    void sendCANdata(int, quint32, int);
    void receiveError(QCanBusDevice::CanBusError) const;

private:
    bool connectCANdevice();
    void setParams(int key, int value);
    void disconnectCANdevice();
    void processInwardData(QByteArray, quint32,int);
    void processOutwardData();
    

    void processSpeedInfo(QByteArray byteData);
    void processVehiclerpmInfo(QByteArray byteData);
    void processMotortorqueInfo(QByteArray byteData);
    void processLedstatusInfo(QByteArray byteData);
    void processTemperaturewarningInfo(QByteArray byteData);
    void processBatterystateInfo(QByteArray byteData);
    void processBatterytripdistanceInfo(QByteArray byteData);
    void processOdometerInfo(QByteArray byteData);
    void processMotortempInfo(QByteArray byteData);
    void processControllertempInfo(QByteArray byteData);
    void processLeftindicatorInfo(QByteArray byteData);
    void processRightindicatorInfo(QByteArray byteData);
    void processPowerInfo(QByteArray byteData);
    void processBatteryadapInfo(QByteArray byteData);

    void updateTemperatureIndicator(int tempData, ETemperature eType);
    QCanBusDevice *m_pCANBUSDevice = nullptr;
    QCanBusFrame m_CANBUSFrame;
    quint32 m_frameID = 0;
    qint64 m_moreFrames;
    QMutex m_Mutex;

    //Constants
    //TODO: Exact values for high / low thresholds still to be determined.
    int const BATTERY_HIGH_TEMP_HI_THRESH = 80;
    int const BATTERY_HIGH_TEMP_LO_THRESH = 60;
    int const BATTERY_AVG_TEMP_HI_THRESH = 50;
    int const BATTERY_AVG_TEMP_LO_THRESH = 40;
    int const BATTERY_LOW_TEMP_HI_THRESH = 30;
    int const BATTERY_LOW_TEMP_LO_THRESH = 10;
    int const MOTOR_TEMP_HI_THRESH = 50;
    int const MOTOR_TEMP_LO_THRESH = 40;
    int const CONTROLLER_SINK_TEMP_HI_THRESH = 50;
    int const CONTROLLER_SINK_TEMPP_LO_THRESH = 40;
};

#endif // CANTRANSRECEIVER_H
