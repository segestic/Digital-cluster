#ifndef HMISUBSYSTEM_H
#define HMISUBSYSTEM_H

#include <QQmlApplicationEngine>
#include "communicationhandler.h"
#include "audiohandler.h"

class HMISubsystem: public QObject
{

    Q_OBJECT
    public:
        HMISubsystem();
        void registerTypes(const char *uri);

    public slots:
        //void handleThumbwheel(int key);

    private:
        const char *m_uri = "Seg.Elements";
        QQmlApplicationEngine m_engine;
        CommunicationHandler m_communicationHandler;
        AudioHandler m_audioHandler;

};

#endif // HMISUBSYSTEM_H
