#ifndef ICOMMUNICATION_H
#define ICOMMUNICATION_H

#include <QObject>

class ICommunication
{
    public:
        virtual ~ICommunication(){}

    signals:
        //for variable in variables:
        //boolean values does not add 'isOn' in signals except in variables
        virtual void speedChanged(int) = 0;
        virtual void vehicleRPMChanged(int) = 0;
        virtual void motorTorqueChanged(int) = 0;
        virtual void ledStatusChanged(bool) = 0;
        virtual void temperatureWarningChanged(bool) = 0;
        virtual void batteryStateChanged(int) = 0;
        virtual void batteryTripDistanceChanged(int) = 0;
        virtual void odometerChanged(float) = 0;
        virtual void motorTempChanged(int) = 0;
        virtual void controllerTempChanged(int) = 0;
        virtual void leftIndicatorChanged(bool) = 0;
        virtual void rightIndicatorChanged(bool) = 0;
        virtual void powerChanged(int) = 0;
        virtual void batteryADAPChanged(int) = 0;

    };

Q_DECLARE_INTERFACE(ICommunication, "ICommunication")
#endif // ICOMMUNICATION_H
