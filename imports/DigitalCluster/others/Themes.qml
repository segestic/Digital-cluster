pragma Singleton
import QtQuick 2.12

Item {
    id: themes
    property string currentTheme: "darkMode"

    property color textColor: "#ffffffff"
    property color labelColor: "#80ffffff"
    property string backgroundImage: "assets/background-dark.png"

    property color speedBlobColorTop: "#e34f59";
    property color speedBlobColorBottom: "#9759b5";

    property color batteryBlobColorTop: "#38ef7d";
    property color batteryBlobColorBottom: "#11998e";
    property color speedoRingColor: "#ffffff";

    states: [
        State {
            name: "darkmode"
            when: themes.currentTheme === "darkMode"
        },
        State {
            name: "lightmode"
            when: themes.currentTheme === "lightMode"

            PropertyChanges {
                target: themes
                x: 1
                textColor: "#ff000000"
                labelColor: "#80000000"
                backgroundImage: "assets/background-light.jpg"

                speedBlobColorTop: "#EF3B36";
                speedBlobColorBottom: "#FFDFDE";

                batteryBlobColorTop: "#BDFFF3";
                batteryBlobColorBottom: "#4AC29A";

                speedoRingColor: "#333333";
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PropertyAnimation {
                        target: themes
                        properties: "textColor, labelColor,
                                     speedBlobColorTop, speedBlobColorBottom,
                                     batteryBlobColorTop, batteryBlobColorBottom, speedoRingColor"
                        duration: 1250
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
    D{i:0}D{i:4;transitionDuration:2000}
}
##^##*/
