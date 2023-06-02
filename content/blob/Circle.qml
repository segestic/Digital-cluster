import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    id: circ0
    property real r: 100
    width: r * 2.
    height: r * 2.
    radius: r

    property point offset;
    property point finalCenter: Qt.point(x+anim_x + width * .5 , y + anim_y + height * .5)
    property real anim_x: 0
    property real anim_y: 0

    property vector4d param4d: Qt.vector4d((x+anim_x+width * .5) / 720, (y + anim_y + width * .5) / 720, width/720/2, 0.07)
}

/*##^##
Designer {
    D{i:0;height:22.6;width:22.6}
}
##^##*/
