import QtQuick 2.0
import QtGraphicalEffects 1.0



Item {
    id: motoramaConicalCircle
    property double angleDegree: 0.0
    property var colorList: []
    property string effectColor: ""
    property double canvasRadius: 14.3
    property double canvasLineWidth: 9.0


    Behavior on angleDegree {
        PropertyAnimation { duration: 400 }
    }

    Canvas {
        id: speedEffect
        width: parent.width
        height: parent.height
        visible: false
        onPaint: {
                var context = getContext("2d")
                let a = width / 2
                // object arc(real x, real y, real radius 15.3, real startAngle, real endAngle, bool anticlockwise)
                context.arc( width / 2 , height / 2, a - 12.3  , 0.755*Math.PI, 2.249*Math.PI, false);
                var grd = context.createConicalGradient( width/2, width/2, -0.700*Math.PI )

                    //for (let i = 0; i < colorList.length; i++){ grd.addColorStop(i/12, colorList[i]) }
                    for (var i = 0, len = colorList.length; i < len; i++ ){
                        grd.addColorStop(i/12, colorList[i])
                    }


                context.strokeStyle = grd
                context.lineCap = "round";
                context.lineWidth = canvasLineWidth;
                context.stroke();
        }
    }

    Glow {
        id:glow
        anchors.fill: speedEffect
        radius: 8
        samples: 17
        spread: 0.4
        color: effectColor
        source: speedEffect
        visible: false
    }

    ConicalGradient {
        id: progress
        anchors.fill: speedEffect
        angle: angleDegree - 0.2*360
        opacity: 1
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.2; color: "white" } // Just a part of the canvas
            GradientStop { position: 0.201; color: "transparent" }
        }
        visible: false // Not visible (it will be painted by the mask)
    }

    ConicalGradient {
        id: progress2
        anchors.fill: glow
        angle: angleDegree - 0.2*360
        opacity: 1
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.2; color: "white" } // Just a part of the canvas
            GradientStop { position: 0.201; color: "transparent" }
        }
         visible: false // Not visible (it will be painted by the mask)
    }

    OpacityMask {
        anchors.fill: progress
        source: speedEffect
        maskSource: progress
        invert: false
    }

    OpacityMask {
        anchors.fill: progress2
        source: glow
        maskSource: progress2
        invert: false
    }
}
