import QtQuick 2.15
import QtGraphicalEffects 1.0

Rectangle {
    id: lightTest
    width: 1920
    height: 1080
    color: "#575757"

    property color lightColor2: "#ffffff" // "#ec9f02"

    property real brightnessMultiplier: 1.0
    property real additionalGlassBloomLuminance: 1.0
    property real additionalGlassBlurRadius: 30.0





    LightTestView3D {
        id: renderedScene
        visible: true
        anchors.fill: parent
        renderedScene: true
    }
    LightTestView3D {
        id: renderedLights
        renderedScene: false
        anchors.fill: parent
    }

    ShaderEffectSource {
        id: renderedSceneBuffer
        width: 960
        height: 540
        visible: true
        hideSource: true
        sourceItem: renderedScene
    }

    ShaderEffectSource {
        id: renderedLightsBuffer
        x: 960
        y: 0
        width: 960
        height: 540
        visible: true // set visible to false, it will still work as an input for ShaderEffect
        hideSource: true
        sourceItem: renderedLights
    }

    ShaderEffect {
        id: colorizedLights

        width: 960
        height: 540

        x: 0
        y: 540

        property color lightCol: lightTest.lightColor2
        property variant renderedLightStencil: renderedLightsBuffer

        fragmentShader: "
            #version 410
            in highp vec2 qt_TexCoord0;
            out vec4 Color;
            uniform lowp float qt_Opacity;
            uniform highp vec4 lightCol;
            uniform sampler2D renderedLightStencil;

            void main() {
                lowp vec4 emission = texture(renderedLightStencil, qt_TexCoord0);
                emission.xyz *= lightCol.xyz;
                Color = vec4(emission.xyz, 1.0);
            }
        "
    }

    FastBlur {
        id: blurredGlass
        source: colorizedLights

        width: 960
        height: 540
        visible: true

        x: 0
        y: 1080

        radius: additionalGlassBlurRadius
    }

    ShaderEffectSource {
        id: blurredGlassEffectSource
        width: 960
        height: 540
        x:960
        y:540
        hideSource: false
        sourceItem: blurredGlass
    }


    ShaderEffect {
//            property variant em_src: emissionStencilSrc
//            property variant bb_src: bloomBlurBuffer
//            property variant ob_src: outerBloomBuffer
            property variant bl_src: blurredGlassEffectSource
            property variant org_src: renderedScene
//            property real bloom_intensity: bloomIntensity
//            property real emission_intensity: emissionIntensity
            property real brightness_mul: brightnessMultiplier

            property real additional_glass_bloom_luminance: additionalGlassBloomLuminance

            id: result
            width: 960
            height: 540
            x:960
            y:1080

            fragmentShader: "
                #version 410
                in highp vec2 qt_TexCoord0;
                out vec4 Color;
                uniform lowp float qt_Opacity;
//                uniform sampler2D bb_src;
                uniform sampler2D bl_src;
                uniform sampler2D org_src;
//                uniform sampler2D ob_src;
//                uniform sampler2D em_src;
//                uniform highp float bloom_intensity;
//                uniform highp float emission_intensity;
                uniform highp float brightness_mul;
                uniform highp float additional_glass_bloom_luminance;

                void main() {
                    const float gamma = 2.2;
                    const float exposure = 5.0;

                    vec3 hdrColor = texture(org_src, qt_TexCoord0).rgb;
//                    vec3 bloomColor = texture(bb_src, qt_TexCoord0).rgb;
//                    vec3 outerBloomColor = texture(ob_src, qt_TexCoord0).rgb;
//                    vec3 emissionColor = texture(em_src, qt_TexCoord0).rgb;
                    vec3 outerGlassColor = texture(bl_src, qt_TexCoord0).rgb;

//                    vec3 addRes = emissionColor * emission_intensity + bloomColor * bloom_intensity; // additive blending
//                    hdrColor += addRes;

                    //hdrColor += lightConesColor.rgb * light_cones_luminance;
                    // tone mapping
//                    vec3 blit = step(0.7, addRes);
//                    vec3 result = blit * (vec3(1.0) - exp(-hdrColor * exposure)) + (1.0 - blit) * hdrColor;
                    // also gamma correct while we're at it
                    result = blit * pow(result, vec3(1.0 / gamma)) + (1.0 - blit) * hdrColor;
                    result += outerBloomColor.xyz;
                    result += outerGlassColor.xyz * additional_glass_bloom_luminance;
                    Color = vec4(result, 1.0);
                }
            "
        }




}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
