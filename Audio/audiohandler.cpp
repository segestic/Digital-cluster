#include "audiohandler.h"

#include <QFile>
#include <QDebug>
#include <QSettings>
#include <QMediaPlayer>
#include <QMediaPlaylist>

AudioHandler::AudioHandler()
{
    initialize();
}

AudioHandler::~AudioHandler()
{

}

bool AudioHandler::initialize()
{
    m_pPlaylist = new QMediaPlaylist;
    m_pPlayer = new QMediaPlayer;
    connect(m_pPlayer,SIGNAL(positionChanged(qint64)),this,SLOT (handlePositionChanged(qint64)));
    m_strSoundPath = readSoundSettings();
    bool isSuccessful = loadSoundFile(m_strSoundPath);
    return isSuccessful;
}

QString AudioHandler::readSoundSettings()
{
    //Read from settings and load corresponding file
    QString strSoundPath = "/etc/custom_path";
    QSettings settings;
    int soundprofile = settings.value("soundmode").toInt();

    switch(soundprofile)
    {
        case 0:
        strSoundPath = strSoundPath +"/sounds/loop_ambient.wav";
        break;

        case 1:
        strSoundPath = strSoundPath +"/sounds/loop_aggressive.wav";
        break;

        case 2:
        strSoundPath = strSoundPath +"/sounds/loop_rumble.wav";
        break;

    }
    return strSoundPath;
}

bool AudioHandler::loadSoundFile(const QString &fileName)
{

    QFile sourceFile;
    sourceFile.setFileName(fileName);
    if(!sourceFile.exists())
    {
        qDebug()<<" Error: Sound file doesn't exist."<<fileName;
        return false;
    }
    else
    {
        //qDebug()<<" Sound file found at "<<fileName;
        m_pPlaylist->addMedia(QUrl::fromLocalFile(m_strSoundPath));
        m_pPlaylist->setPlaybackMode(QMediaPlaylist::CurrentItemInLoop);
        m_pPlayer->setPlaylist(m_pPlaylist);
        m_pPlayer->setVolume(100);
        m_pPlayer->setPlaybackRate(0.2);//At Speed = 0
        m_pPlayer->play();
    }
    return true;
}


void AudioHandler::handleSpeedChanged(int nSpeed)
{
    int nSpeedDelta = qAbs(m_nPrevSpeed-nSpeed);

    //Change Audio , if speed diff is more than 5.
    if(nSpeedDelta<5)
    {
        return;
    }
    m_nPrevSpeed = nSpeed;
    if(nullptr != m_pPlayer)
    {
        auto playbackRate = 0.2 + nSpeed/ 50;
        m_pPlayer->setPlaybackRate(playbackRate);
        m_pPlayer->play();
    }
}

void AudioHandler::updateSoundProfile()
{
    if((nullptr == m_pPlayer) ||(nullptr == m_pPlaylist))
    {
        qDebug()<<"Media Player Error!";
        return;
    }
    m_pPlayer->stop();
    m_pPlaylist->clear();
    m_strSoundPath = readSoundSettings();
    loadSoundFile(m_strSoundPath);
}

void AudioHandler::handlePositionChanged(qint64 pos)
{
    if(pos>10000)
    {
        m_pPlayer->setPosition(100);
        m_pPlayer->play();
    }
}
