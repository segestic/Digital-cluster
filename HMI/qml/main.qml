import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: mainwind
    width: 1350//1920//
    height: Math.round(width*0.4)//720
    visible: true
    title: qsTr("Hello World")
    //onWidthChanged: {console.log('width is ', width)}
    //onHeightChanged: {console.log('height is ', height)}


    Loader {
      id: mainLoader
      anchors.centerIn: parent
      width: parent.width
      height: parent.height
    }

    Component.onCompleted: {
            //slide trnsitions
            mainLoader.setSource("qrc:/content/front/Screen01.qml");

        }
}
