QT += widgets quick multimedia serialbus
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += main.cpp 

HEADERS += 
RESOURCES += app.qrc     $$PWD/../HMI/hmi.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/../HMI/qml
DISTFILES += $$PWD/../HMI/qml/*.qml             $$PWD/../HMI/fonts/*.otf

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../HMI/release/ -lHMI
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../HMI/debug/ -lHMI
else:unix: LIBS += -L$$OUT_PWD/../HMI/ -lHMI

INCLUDEPATH += $$PWD/../HMI
DEPENDPATH += $$PWD/../HMI


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


CONFIG += qtquickcompiler