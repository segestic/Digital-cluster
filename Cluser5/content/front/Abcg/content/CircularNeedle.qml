import QtQuick 2.15
import QtQuick.Controls 2.15

Image {
    id: motoramaCircularNeedle
    property int minAngleDegree: 0
    property int maxAngleDegree: 360
    property int minValue: 0
    property int maxValue: 360
    property int value: 0
    property double tranformOriginX: 0 // If 0, left-most side will be the origin.
    property double tranformOriginY: 0 // If 0, top will be the origin.
    property alias angleDegree: circularNeedle.angle

    transform: Rotation {
        id: circularNeedle
        origin.x: tranformOriginX; origin.y: tranformOriginY
        angle: valueToAngleDegree(motoramaCircularNeedle.value)
        Behavior on angle {
            NumberAnimation { duration: 1000; easing.type: Easing.OutQuad }
        }
    }

    function valueToAngleDegree(tmpValue) {
        return (maxAngleDegree - minAngleDegree) * (tmpValue - minValue) /
                (maxValue - minValue) + minAngleDegree;
    }
}
