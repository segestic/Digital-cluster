#ifndef AUDIOHANDLER_H
#define AUDIOHANDLER_H

#include <QObject>

class QMediaPlayer;
class QMediaPlaylist;

class  AudioHandler: public QObject
{
    Q_OBJECT

    public:
        AudioHandler();
        ~AudioHandler();
        bool initialize();

    public slots:
        Q_INVOKABLE void handleSpeedChanged(int speed);
        Q_INVOKABLE void updateSoundProfile();
        void handlePositionChanged(qint64 pos);

    private:
        bool loadSoundFile(const QString &fileName);
        QString readSoundSettings();

        QString m_strSoundPath = "";
        int m_nPrevSpeed = 0;
        QMediaPlayer* m_pPlayer = nullptr;
        QMediaPlaylist* m_pPlaylist = nullptr;
};

#endif // AUDIOHANDLER_H
