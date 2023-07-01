#include <QtQml>

#include "hmisubsystem.h"

HMISubsystem::HMISubsystem()
{
    registerTypes(m_uri);
    m_engine.rootContext()->setContextProperty("m_communicationHandler", &m_communicationHandler);
    m_engine.rootContext()->setContextProperty("m_audioHandler", &m_audioHandler);
    m_engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));

}

void HMISubsystem::registerTypes(const char *uri)
{
    qmlRegisterType(QUrl("qrc:/qml/qml/HomeScreen.qml"), uri, 1, 0, "HomeScreen"); //qmlFileNames
    //qmlRegisterType(QUrl("qrc:/qml/qml/HomeScreen.qml"), uri, 1, 0, "Filename1");
    //qmlRegisterType(QUrl("qrc:/qml/qml/HomeScreen.qml"), uri, 1, 0, "Filename2");    
}
