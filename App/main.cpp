#include <QApplication>
#include <QProcess>
#include <QTime>
#include <QDebug>
#include <QObject>
#include "hmisubsystem.h"
#include <csignal>

using namespace std;

struct CleanExit
{
    CleanExit()
    {
        signal(SIGINT, &CleanExit::shutdownApp);
        signal(SIGTERM, &CleanExit::shutdownApp);
        signal(SIGABRT, &CleanExit::shutdownApp);
    }

    static void shutdownApp(int)
    {
        QApplication::exit(0);
    }
};


int main(int argc, char *argv[])
{
    CleanExit m_cleanExit;

    qDebug()<<"Kernel Loaded : " << QDateTime::currentDateTime();
    QTime m_time;
    m_time.start();

    qDebug()<<"Cluster Application started : " << m_time.elapsed();

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY"))
       {
           qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("800"));
           qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("800"));
           QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
       }

    QApplication app(argc, argv);

    QApplication::setOrganizationName("Cluster Motors");
    QApplication::setOrganizationDomain("https://mywebsite.com");
    QApplication::setApplicationName("Ola Cluster");

    //Load Components
    qDebug()<<"Loading HMI : " << m_time.elapsed();
    HMISubsystem m_hmisubsystem;
    qDebug()<<"App loaded : " << m_time.elapsed();

    //Ignition Sound
    QProcess::startDetached("aplay -c 1 -t wav -r 44100 -f S16_LE /etc/cust_folder/ignition.wav");


    return app.exec();
}
