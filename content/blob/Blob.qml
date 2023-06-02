import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15
//import QtQuick.Timeline 1.0
//import QtQuick.Timeline 1.0
//import QtQuick.Window 2.14
import QtQuick.Timeline 1.0
import QtQuick.Studio.Components 1.0


Item {
    id: blobItem
    property alias texture: shader.shaderTexture
    property alias blobFactor: shader.factor
    property alias ringCount: shader.ringCount
    property alias ringMinDist: shader.ringMin
    property alias ringMaxDist: shader.ringMax
    property alias ringWidth: shader.ringWidth
    property alias easing: shader.easing
    property alias blobSizeOffset: shader.blobSize
    property alias pieAngle: shader.pieAngle
    property alias pieVisibility: shader.pieVisibility

    property alias animOffset: shader.anim
    property alias fade: shader.fade
    property alias density: shader.density
    property alias thickness: shader.thickness

    property alias size: shader.size

    property alias main_ring_dist: shader.main_ring_dist



    width: 500
    height: 500
    property real speed: -1

    Item {
        id: item1
        x: 0
        y: 0
        property real t: 0
    }



    Item {
        id: circles
        x: 0
        y: 0
        width: 720
        height: 720
        visible: false
        rotation: 0

        Circle {
            id: circ0;
            x: 271
            y: 201
            property real t: item1.t + 1
            anim_x: (2 + Math.cos(2 * t)) * Math.cos(3 * t)*1
            anim_y: Math.sin(4 * t) * 1

            visible: false
            r: 90
            offset: Qt.point(0., 0.)
        }

        Circle {
            id: circ1
            x: 220
            y: 220
            property real t: item1.t + 0.4
            anim_x: (2 + Math.cos(2 * t)) * Math.cos(3 * t)*1
            anim_y: Math.sin(4 * t) * 1

            // Math.sin(4* t)
            // (2 + Math.cos(2 * t)) * Math.sin(3 * t)*6 + 170
            visible: false
            r: 140


        }

        Circle {
            id: circ2
            x: 349
            y: 125
            visible: true
            r: 11.3
            property real shaker: 0
            property real t: item1.t
            anim_x: (2 + Math.cos(2 * t)) * Math.cos(3 * t) * shaker
            anim_y: Math.sin(4 * t) * shaker
        }

        Circle {
            id: circ3
            x: 301
            y: 191
            visible: true
            r: 60
            property real shaker: 0
            property real t: item1.t
            anim_x: (2 + Math.cos(2 * t)) * Math.cos(3 * t)*1
            anim_y: Math.sin(4 * t) * shaker
        }

    }

    //----------------

    ShaderEffect {

        property variant shaderTexture
        property real factor: 50
        property real ringCount: 10.
        property real ringMin: 10.
        property real ringMax: 110.
        property real ringWidth: 1.5
        property real easing: 1.
        property real blobSize: 0.
        property real pieAngle: 360.
        property real pieVisibility: 0.


        property real anim: 0.
        property real fade: 10.
        property real density: 100.
        property real thickness: 33.

        // ----------

        id: shader
        anchors.fill: parent
        rotation: 0


        property vector4d circle_1_param: circ0.param4d
        property vector4d circle_2_param: circ1.param4d
        property vector4d circle_3_param: circ2.param4d
        property vector4d circle_4_param: circ3.param4d

        property real main_ring_dist: 1
        property real main_ring_thickness: 0.005

        property vector4d rings_param: Qt.vector4d(shader.anim, shader.density, shader.thickness, shader.fade) // fit it correctly
        property vector2d main_ring_param: Qt.vector2d(shader.main_ring_dist,shader.main_ring_thickness)

        property real rings_angle: -1.0
        property real rings_alpha: 0.9
        property real size: 1.0 // blob size



        fragmentShader: "
#version 330

// precision mediump float;

in highp vec2 qt_TexCoord0;
out vec4 Color;
uniform sampler2D shaderTexture;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//
// Circle parameters:
// x,y (r,g) - coords
// z (b)     - radius
// w (a)     - smoothness
//
uniform vec4 circle_1_param;
uniform vec4 circle_2_param;
uniform vec4 circle_3_param;
uniform vec4 circle_4_param;

//////////////////////////////////////////////////////////////////////////////
//
// Rings parameters:
// x - direction - loop at 2xPI
// y - density
// z - thickness
// w - fade
//
uniform vec4 rings_param;

//////////////////////////////////////////////////////////////////////////////
//
// Main ring parameters:
// x - distance from edge
// y - thickness
//
uniform vec2 main_ring_param;

uniform float rings_angle;
uniform float rings_alpha;
uniform float size;

#define PI 3.1415926538

//////////////////////////////////////////////////////////////////////////////
//
// smooth minimum between values with selectable smoothness
//

float smoothMin(float a, float b, float smoothness) {

    float h = clamp(0.5 + 0.5 * (b - a) / smoothness, 0.0, 1.0);
    return mix(b, a, h) - smoothness * h * (1.0 - h);
}

//
//////////////////////////////////////////////////////////////////////////////
//
// pie chart angle based cut
//

float pieCut(vec2 uv, float angle) {

     return  1. - step( - PI * angle, atan(uv.y - 0.5, uv.x - 0.5));
}

//
//////////////////////////////////////////////////////////////////////////////
//
// distance between uv and circle center with radius offset
//

float circleSDF(vec2 uv, vec2 center, float radius) {

    return distance(uv, center) - radius;
}

//
//////////////////////////////////////////////////////////////////////////////
//
// composed distance between uv and scene elements
//

float sceneSDF(vec2 uv) {

    // circles
    float circle_1 = circleSDF(uv, circle_1_param.xy, circle_1_param.z);
    float circle_2 = circleSDF(uv, circle_2_param.xy, circle_2_param.z);
    float circle_3 = circleSDF(uv, circle_3_param.xy, circle_3_param.z);
    float circle_4 = circleSDF(uv, circle_4_param.xy, circle_4_param.z);

    // smoothing
    float scene = smoothMin(circle_1, circle_2, circle_2_param.w);
    scene = smoothMin(scene, circle_3, circle_3_param.w);
    scene = smoothMin(scene, circle_4, circle_4_param.w);

    return max(0.0, 1.0 - scene);
}

//
//////////////////////////////////////////////////////////////////////////////
//
// rings calculated from sceneSDF with sine
//

float ringsSDF(float scene, float direction, float density, float thickness, float exponent) {

    return pow(0.5 + 0.5 * sin(density * pow(scene, exponent) + direction), thickness);
}

float mainRingSDF(float scene) {

    return smoothstep(main_ring_param.x - main_ring_param.y, main_ring_param.x + main_ring_param.y, scene) * smoothstep(main_ring_param.x + main_ring_param.y, main_ring_param.x, scene);
}


//
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//

void main() {

    // draw circles scene
    float scene = sceneSDF(qt_TexCoord0);

    // mask pie chart
    float pie = pieCut(qt_TexCoord0, rings_angle);

    // main ring
    float main_ring = smoothstep(0.4, 0.6, mainRingSDF(scene));

    // draw rings from scene
    float rings = ringsSDF(scene, rings_param.x * 2 * PI, rings_param.y, rings_param.z, 2.0);

    // mask rings
    rings *= min(1.0, pow(scene, rings_param.w));
    rings *= smoothstep( 1.0, 0.99, scene);

    // shape edge hardness
    scene = smoothstep(0.995 , 1.0, scene * (0.8 + 0.2 * size) * 0.99);

    // background color
    vec4 sceneColor = texture(shaderTexture, qt_TexCoord0);

    // rings color
    vec4 ringsColor = vec4(1.0, 1.0, 1.0, 1.0);

    // final render
    // gl_FragColor = mix(pie * ringsColor * (rings_alpha * rings + main_ring), sceneColor * scene, scene);
    Color = mix(pie * ringsColor * (rings_alpha * rings + main_ring), sceneColor * scene, scene);
}
"
    }




    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation1
                loops: -1
                running: true
                duration: 5000
                to: 100
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 100
        enabled: true
        KeyframeGroup {
            target: item1
            property: "t"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 6.28
                frame: 100
            }
        }
    }

    states: [
        State {
            name: "speedNormal"
            when: blobItem.speed > 0.0
        },
        State {
            name: "speed0"
            when: blobItem.speed === 0

            PropertyChanges {
                target: circ2
                x: 252
                y: 212
                r: 130
            }

            PropertyChanges {
                target: circ1
                x: 213
                y: 212
                r: 130
            }

            PropertyChanges {
                target: circ3
                x: 252
                y: 254
                r: 130
            }

            PropertyChanges {
                target: circ0
                x: 213
                y: 256
                r: 130
            }
        },
        State {
            name: "battery"
            when: blobItem.speed < 0.0
            PropertyChanges {
                target: circ2
                x: 299
                y: 238
                r: 110
            }

            PropertyChanges {
                target: circ1
                x: 205
                y: 236
                r: 130
            }

            PropertyChanges {
                target: circ3
                x: 261
                y: 273
                r: 110
            }

            PropertyChanges {
                target: circ0
                x: 250
                y: 327
                r: 110
            }

            PropertyChanges {
                target: shader
                visible: true
            }

            PropertyChanges {
                target: blobItem
                width: 720
                height: 720
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ0
                        property: "y"
                        duration: 445
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ0
                        property: "x"
                        duration: 445
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ0
                        property: "r"
                        duration: 445
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ1
                        property: "y"
                        duration: 448
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ1
                        property: "x"
                        duration: 448
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ1
                        property: "r"
                        duration: 448
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 437
                    }

                    PropertyAnimation {
                        target: circ2
                        property: "y"
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                        duration: 200
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 437
                    }

                    PropertyAnimation {
                        target: circ2
                        property: "x"
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                        duration: 200
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 437
                    }

                    PropertyAnimation {
                        target: circ2
                        property: "r"
                        duration: 200
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ3
                        property: "y"
                        duration: 442
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ3
                        property: "x"
                        duration: 442
                        easing.bezierCurve: [0.645,0.045,0.355,1,1,1]
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: circ3
                        property: "r"
                        duration: 442
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:720;width:720}D{i:8}
}
##^##*/
