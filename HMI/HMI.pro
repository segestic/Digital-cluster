QT  += qml quick serialbus quick3d

TARGET = HMI
TEMPLATE = lib
CONFIG += staticlib c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
QML_IMPORT_PATH = /qml
# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += $$PWD/../Communication
DEPENDPATH += $$PWD/../Communication

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Communication/release/ -lCommunication
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Communication/debug/ -lCommunication
else:unix: LIBS += -L$$OUT_PWD/../Communication/ -lCommunication

INCLUDEPATH += $$PWD/../Audio
DEPENDPATH += $$PWD/../Audio


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Audio/release/ -lAudio
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Audio/debug/ -lAudio
else:unix: LIBS += -L$$OUT_PWD/../Audio/ -lAudio

#SOURCES += *.cpp
SOURCES += hmisubsystem.cpp


#HEADERS += *.h
HEADERS += hmisubsystem.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

DISTFILES += /qml/*.qml             /fonts/*.otf

RESOURCES +=     hmi.qrc

#Enable automatic caching of compiled QML files for faster boot
CONFIG += qtquickcompiler
