pragma Singleton
import QtQuick 2.12

Item {
    id: car3dControl

    property bool driverDoorOpen: false
    property bool passengerDoorOpen: false
    property bool trunkOpen: false;
    property bool frontLightsOn: false;
    property bool highBeamOn: false
    property bool hueChangePaused: true
    property string themaColor: 'dark'


    // viewState:
    // - adas
    // - front
    // - left
    // - right
    // - tirePressure
    // - battery
    // - interior

    property string viewState: "adas"

    // ********************
    // interior light
    // ********************

    property bool makeInteriorDarkerButtonPressed: false
    property bool makeInteriorBrighterButtonPressed: false

    property real interiorBrightnessStep: 0.1
    property int interiorBrightnessStepDuration: 150

    property real interiorBrightness: 0.5
    property real interiorHue: 0.5
    property color interiorHueColor: Qt.hsla(interiorHue, 1.0, 0.5, 1.0) // color based on hue value


    // hue looped animation

    NumberAnimation {
        id: interiorHueAnimation
        target: car3dControl
        property: "interiorHue"
        paused: hueChangePaused
        running: true
        from: 0.0
        to: 1.0
        loops: Animation.Infinite
        duration: 2500
    }



    // brightness change on button pressed

    Timer {
        id: timer
        interval: interiorBrightnessStepDuration
        repeat: true
        running: makeInteriorBrighterButtonPressed || makeInteriorDarkerButtonPressed
        onTriggered: interiorBrightness = makeInteriorBrighterButtonPressed ? makeInteriorBrighter() : makeInteriorDarker()
    }

    function makeInteriorDarker() {
        return interiorBrightness > interiorBrightnessStep ? interiorBrightness - interiorBrightnessStep : 0.0
    }

    function makeInteriorBrighter() {
        return 1.0 - interiorBrightness > interiorBrightnessStep ? interiorBrightness + interiorBrightnessStep : 1.0
    }

    // Behavior for fluid interiorBrightness value change

    Behavior on interiorBrightness {
        NumberAnimation { duration: interiorBrightnessStepDuration }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}D{i:2}
}
##^##*/
