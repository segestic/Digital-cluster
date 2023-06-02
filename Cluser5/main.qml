import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: mainwind
    width: 1920
    height: 720
    visible: true
    title: qsTr("Hello World")


    Loader {
      id: mainLoader
      anchors.centerIn: parent
      width: parent.width
      height: parent.height
    }

    Component.onCompleted: {
            //slide trnsitions
            //mainLoader.setSource("qrc:/src/Adas.ui.qml");
            mainLoader.setSource("qrc:/content/front/Screen01.qml");

        }
}
