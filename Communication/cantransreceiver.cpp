#include "cantransreceiver.h"
#include <QCanBus>
#include <QVariant>
#include <QDebug>

CANTransreceiver::CANTransreceiver(QObject *parent) : QObject(parent)
{
    //qDebug()<<"Invoking connectCanDevice()";
    connectCANdevice();
}


CANTransreceiver:: ~CANTransreceiver()
{
    disconnectCANdevice();
}


bool CANTransreceiver::connectCANdevice()
{

    QString errorString= "";
    bool isConnected = false;

    if (QCanBus::instance()->plugins().contains(QStringLiteral("socketcan"))) //socketcan
    {

        //qDebug()<<"CAN socket plugin Available.";
        m_pCANBUSDevice = QCanBus::instance()->createDevice(QStringLiteral("socketcan"), //socketcan
                                                            QStringLiteral("can1"),
                                                            &errorString);
        if (!m_pCANBUSDevice)
        {
            //qDebug() << "connectCANdevice() FAILED. Error Message : " << errorString<< "";
            return isConnected;
        }

        //qDebug() << "connectCANdevice() SUCCESS";

        connect(m_pCANBUSDevice, &QCanBusDevice::framesReceived,this, &CANTransreceiver::receiveCANdata);

        connect(m_pCANBUSDevice, &QCanBusDevice::errorOccurred, this, &CANTransreceiver::receiveError);

    }
    //TODO: Uncomment below line to set at 500kbps. Below configuration doesn't work with peakcan.
    //m_pCANBUSDevice->setConfigurationParameter(QCanBusDevice::BitRateKey, QVariant(500000));
    m_pCANBUSDevice->connectDevice();
    //qDebug() << "Done connectCANdevice() ";

    return true;
}

void CANTransreceiver::receiveCANdata()
{
    int data_len;
    QByteArray sData_p;

    if (!m_pCANBUSDevice)
        return;

    ////qDebug()<<"Frame received : Entering receiveCANdata() ";
    m_Mutex.lock();
    m_moreFrames = m_pCANBUSDevice->framesAvailable();
    m_Mutex.unlock();

    while (m_moreFrames)
    {
        m_CANBUSFrame = m_pCANBUSDevice->readFrame();

        switch (m_CANBUSFrame.frameType())
        {
        case QCanBusFrame::DataFrame:
        {
            //qDebug()<<"Data Frame Type";
            quint32 frame_id = m_CANBUSFrame.frameId();
            data_len = m_CANBUSFrame.payload().size();
            sData_p = m_CANBUSFrame.payload();
            //qDebug()<<"Data: Payload: "<<sData_p;

            processInwardData(sData_p,frame_id,data_len);

            break;
        }
        case QCanBusFrame::UnknownFrame:
        {
            //qDebug()<<"Unknown Frame";
            break;
        }
        case QCanBusFrame::ErrorFrame:
        {
            QString errMsg = m_pCANBUSDevice->interpretErrorFrame(m_CANBUSFrame);
            //qDebug() << errMsg;
            break;
        }
        case QCanBusFrame::InvalidFrame:
        {
            //qDebug()<<"Invalid Frame";
            break;
        }
        case QCanBusFrame::RemoteRequestFrame:
        {
            //qDebug()<<"Remote Request Frame";
            break;
        }
        }

        m_Mutex.lock();
        m_moreFrames = m_pCANBUSDevice->framesAvailable();
        m_Mutex.unlock();
    }
}
void CANTransreceiver::processInwardData(QByteArray byteData, quint32 frameID, int nDataLength)
{
    //qDebug()<<"Entering processInwardData() : ";
    //qDebug()<<"Frame ID : "<<frameID<<"";
    //qDebug()<<"Data Length : "<<nDataLength<<"";

    Q_UNUSED(nDataLength);

    switch(frameID)
    {
		//DONT FORGET TO ADD/REMOVE FRAMES IN cantransreceiver.h
		case kFRAMEID_SPEED:
		{
            processSpeedInfo(byteData);
		    break;
		}
		case kFRAMEID_BATTERY_TEMP:
		{
		//Dont forget to add respective signals into their respective cases/individual frames as below. One signal per case
		//Dont forget to add respective signals into their respective cases/individual frames as below. One signal per case
            //processSpeedInfo(byteData);
            processVehiclerpmInfo(byteData);
            processMotortorqueInfo(byteData);
            processLedstatusInfo(byteData);
            processTemperaturewarningInfo(byteData);
            processBatterystateInfo(byteData);
            processBatterytripdistanceInfo(byteData);
            processOdometerInfo(byteData);
            processMotortempInfo(byteData);
            processControllertempInfo(byteData);
            processLeftindicatorInfo(byteData);
            processRightindicatorInfo(byteData);
            processPowerInfo(byteData);
            processBatteryadapInfo(byteData);
            //processBatteryTempInfo(byteData);
		    break;
		}
		case kFRAMEID_LED_STATUS:
		{
		    //processLEDInfo(byteData);
		    break;
		}
		case kFRAMEID_ODOMETER:
		{
		    //processOdometerInfo(byteData);
		    break;
		}
		case kFRAMEID_POWER:
		{
		    //processPowerInfo(byteData);
		    break;
		}
		case kBATTERY_INFO:
		{
		    //Uncomment below and add respective processInfo or even more cases.
		    //processBatteryInfo(byteData);
		    break;
		}
		default:
		{
		    //qDebug()<<"Data not handled : "<<byteData<<"";
		    break;
		}
    }
	//qDebug()<<"Leaving processInwardData()";
}


void CANTransreceiver::sendCANdata(int nData, quint32 frameID, int nFrameType)
{

    QCanBusFrame frame;

    if (!m_pCANBUSDevice)
        return;

    // Check for DATA Frame
    QByteArray byteData;
    byteData[0] = char(nData);

    frame.setPayload(byteData);
    frame.setFrameId(frameID);

    switch(nFrameType)
    {
    case QCanBusFrame::RemoteRequestFrame:
    {
        frame.setFrameType(QCanBusFrame::RemoteRequestFrame);
        break;
    }
    case QCanBusFrame::ErrorFrame:
    {
        frame.setFrameType(QCanBusFrame::ErrorFrame);
        break;
    }
    case QCanBusFrame::DataFrame:
    {
        frame.setFrameType(QCanBusFrame::DataFrame);
        break;
    }
    }

    //qDebug()<<"sendCANdata: Sending CAN Frame";
    m_pCANBUSDevice->writeFrame(frame);
}


void CANTransreceiver::receiveError(QCanBusDevice::CanBusError error) const
{
    switch (error)
    {
    case QCanBusDevice::ReadError:
    {
        //qDebug() << "ReadError : " + m_pCANBUSDevice->errorString();
        break;
    }
    case QCanBusDevice::WriteError:
    {
        //qDebug() << "WriteError : " + m_pCANBUSDevice->errorString();
        break;
    }
    case QCanBusDevice::ConnectionError:
    {
        //qDebug() << "ConnectionError : " + m_pCANBUSDevice->errorString();
        break;
    }
    case QCanBusDevice::ConfigurationError:
    {
        //qDebug() << "ConfigurationError : " + m_pCANBUSDevice->errorString();
        break;
    }
    case QCanBusDevice::UnknownError:
    {
        //qDebug() << "UnknownError : " + m_pCANBUSDevice->errorString();
        break;
    }
    case QCanBusDevice::NoError:
        break;
    }
}


void CANTransreceiver::setParams(int key, int value)
{
    Q_UNUSED(key)
    Q_UNUSED(value)

    QString sData= "";
    int nframe = 0;

    sendCANdata(nframe,m_frameID,1);

}



void CANTransreceiver::disconnectCANdevice()
{
    if (!m_pCANBUSDevice)
        return;

    m_pCANBUSDevice->disconnectDevice();
    delete m_pCANBUSDevice;
    m_pCANBUSDevice = nullptr;
}


//INDIVIDUAL CAN_SIGNAL PROCESSING STARTS....
//INDIVIDUAL CAN_SIGNAL PROCESSING STARTS....

/*
BATTERY_HIGH_TEMP is above BATTERY_HIGH_TEMP_HI_THRESH, OR
BATTERY_HIGH_TEMP is below BATTERY_HIGH_TEMP_LO_THRESH, OR
BATTERY_AVG_TEMP is above BATTERY_AVG_TEMP_HI_THRESH, OR
BATTERY_AVG_TEMP is below BATTERY_AVG_TEMP_LO_THRESH, OR
BATTERY_LOW_TEMP is above BATTERY_LOW_TEMP_HI_THRESH, OR
BATTERY_LOW_TEMP is below BATTERY_LOW_TEMP_LO_THRESH, OR
MOTOR_TEMP is above MOTOR_TEMP_HI_THRESH, OR
MOTOR_TEMP is below MOTOR_TEMP_LO_THRESH, OR
CONTROLLER_SINK_TEMP is above CONTROLLER_SINK_TEMP_HI_THRESH, OR
CONTROLLER_SINK_TEMP is below CONTROLLER_SINK_TEMPP_LO_THRESH*/

void CANTransreceiver::updateTemperatureIndicator(int nTemperature, ETemperature eType)
{
    switch(eType)
    {
        case kBATTERY_HIGH_TEMP:
        {
            if ((nTemperature>BATTERY_HIGH_TEMP_HI_THRESH) || (nTemperature<BATTERY_HIGH_TEMP_LO_THRESH))
            {
                emit temperatureWarningChanged(true);
            }
            break;
        }
        case kBATTERY_AVG_TEMP:
        {
            if ((nTemperature>BATTERY_AVG_TEMP_HI_THRESH) || (nTemperature<BATTERY_AVG_TEMP_LO_THRESH))
            {
                emit temperatureWarningChanged(true);
            }
            break;
        }
        case kBATTERY_LOW_TEMP:
        {
            if ((nTemperature>BATTERY_LOW_TEMP_HI_THRESH) || (nTemperature<BATTERY_LOW_TEMP_LO_THRESH))
            {
                emit temperatureWarningChanged(true);
            }
            break;
        }
        case kMOTOR_HI_TEMP:
        case  kMOTOR_LOW_TEMP:
        {
            if ((nTemperature>MOTOR_TEMP_HI_THRESH) || (nTemperature<MOTOR_TEMP_LO_THRESH))
            {
                emit temperatureWarningChanged(true);
            }
            break;
        }

        case kSINK_HI_TEMP:
        case kSINK_LOW_TEMP:
        {
            if ((nTemperature>CONTROLLER_SINK_TEMP_HI_THRESH) || (nTemperature<CONTROLLER_SINK_TEMPP_LO_THRESH))
            {
                emit temperatureWarningChanged(true);
            }
            break;
        }
        default:
            break;
    }
} 



void CANTransreceiver::processSpeedInfo(QByteArray byteData)
{
    //seg...
    uint64_t start_bit = 2;
    uint64_t signal_size = 11;
    uint64_t shift_amount = start_bit % 8;
    QString hexString = QString(byteData.toHex());
    // Convert hex string to decimal value
    quint64 decimal_value = hexString.toULongLong(0, 16);
    int masked_value = (decimal_value >> shift_amount) & ((1ULL << signal_size) - 1);
    qDebug()<<"The SPEED value is : "<< masked_value <<"\n";
    // Apply scaling and offset
    int scaled_value = qRound(masked_value * (1/26.5));
    qDebug()<<"The scaled value is : "<< scaled_value <<"\n";
    //endseg...
    emit speedChanged(scaled_value);
}


void CANTransreceiver::processVehiclerpmInfo(QByteArray byteData)
{
    // Implement the signal handler for Vehiclerpm here
    int vehicleRPM = byteData [0];
    emit vehicleRPMChanged(vehicleRPM);
}


void CANTransreceiver::processMotortorqueInfo(QByteArray byteData)
{
    // Implement the signal handler for Motortorque here
    int motorTorque = byteData [0];
    emit motorTorqueChanged(motorTorque);
}


void CANTransreceiver::processLedstatusInfo(QByteArray byteData)
{
    // Implement the signal handler for Ledstatus here
    bool ledStatus = byteData [0] & 0x01;
    emit ledStatusChanged(ledStatus);
}


void CANTransreceiver::processTemperaturewarningInfo(QByteArray byteData)
{
    // Implement the signal handler for Temperaturewarning here
    bool temperatureWarning = byteData [0] & 0x01;
    emit temperatureWarningChanged(temperatureWarning);
}


void CANTransreceiver::processBatterystateInfo(QByteArray byteData)
{
    // Implement the signal handler for Batterystate here
    int batteryState = byteData [0];
    emit batteryStateChanged(batteryState);
}


void CANTransreceiver::processBatterytripdistanceInfo(QByteArray byteData)
{
    // Implement the signal handler for Batterytripdistance here
    int batteryTripDistance = byteData [0];
    emit batteryTripDistanceChanged(batteryTripDistance);
}


void CANTransreceiver::processOdometerInfo(QByteArray byteData)
{
    // Implement the signal handler for Odometer here
    float odometer = byteData [0];
    emit odometerChanged(odometer);
}


void CANTransreceiver::processMotortempInfo(QByteArray byteData)
{
    // Implement the signal handler for Motortemp here
    int motorTemp = byteData [0];
    emit motorTempChanged(motorTemp);
}


void CANTransreceiver::processControllertempInfo(QByteArray byteData)
{
    // Implement the signal handler for Controllertemp here
    int controllerTemp = byteData [0];
    emit controllerTempChanged(controllerTemp);
}


void CANTransreceiver::processLeftindicatorInfo(QByteArray byteData)
{
    // Implement the signal handler for Leftindicator here
    bool leftIndicator = byteData [0] & 0x01;
    emit leftIndicatorChanged(leftIndicator);
}


void CANTransreceiver::processRightindicatorInfo(QByteArray byteData)
{
    // Implement the signal handler for Rightindicator here
    bool rightIndicator = byteData [0] & 0x01;
    emit rightIndicatorChanged(rightIndicator);
}


void CANTransreceiver::processPowerInfo(QByteArray byteData)
{
    // Implement the signal handler for Power here
    int power = byteData [0];
    emit powerChanged(power);
}


void CANTransreceiver::processBatteryadapInfo(QByteArray byteData)
{
    // Implement the signal handler for Batteryadap here
    int batteryADAP = byteData [0];
    emit batteryADAPChanged(batteryADAP);
}

