varying highp vec2 qt_TexCoord0;
uniform lowp float qt_Opacity;

uniform sampler2D texture;
uniform highp vec2 resolution;
uniform highp float factor;
uniform highp float ringCount;
uniform highp float ringMin;
uniform highp float ringMax;
uniform highp float ringWidth;
uniform highp float easing;
uniform highp float anim;
uniform highp float blobSize;
uniform highp float pieAngle;
uniform highp float pieVisibility;

uniform highp vec2 c0;
uniform highp float r0;
uniform highp vec2 c1;
uniform highp float r1;
uniform highp vec2 c2;
uniform highp float r2;
uniform highp vec2 c3;
uniform highp float r3;


float soft_min(float a, float b, float r)
{
    float e = max(r - abs(a - b), 0.);
    return min(a, b) - e*e*0.25/r;
}

void main()
{
    highp vec2 point = qt_TexCoord0 * resolution;

    highp float d0 = distance(point, c0) - r0;
    highp float d1 = distance(point, c1) - r1;
    highp float d2 = distance(point, c2) - r2;
    highp float d3 = distance(point, c3) - r3;

    highp float blobDist = soft_min(d0, d1, factor);
    blobDist = soft_min(blobDist, d2, factor);
    blobDist = soft_min(blobDist, d3, factor);

    highp float angle = atan(point.x-c0.x, point.y-c0.y) * 57.296  + 180.;
    highp float pieAlpha = step(pieAngle, angle) * pieVisibility + (1. - pieVisibility);

    highp float line = 0.;

    for (float i = 0.; i < ringCount; i+=1.){
        highp float ringSpacing = (ringMax - ringMin)/ringCount;
        highp float linePos = pow(mod(i/ringCount + anim, 1.), easing)*ringCount * ringSpacing + ringMin;
        highp float lineDist = abs(blobDist-linePos);
        highp float lineAlpha = (ringMax - blobDist)/(ringMax-ringMin);
        line += (1. - clamp(0., 1., lineDist / ringWidth)) * lineAlpha;
    }

    vec4 linesColor = vec4(line * pieAlpha);

    float blobAlpha = step(blobDist, blobSize);
    vec4 blobColor = texture2D(texture, qt_TexCoord0);

    gl_FragColor = mix(linesColor, blobColor, blobAlpha);
}

