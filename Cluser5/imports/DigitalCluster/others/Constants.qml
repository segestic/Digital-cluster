pragma Singleton
import QtQuick 2.10

QtObject {
    readonly property int width: 1920
    readonly property int height: 720

    readonly property FontLoader mySystemFont: FontLoader {source: "../../fonts/Lato-Medium.ttf"}
    readonly property FontLoader latoBold: FontLoader {
        source: "../../fonts/Lato-Bold.ttf"
    }

    property alias fontDirectory: directoryFontLoader.fontDirectory
    property alias relativeFontDirectory: directoryFontLoader.relativeFontDirectory

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: mySystemFont.name,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font fontBold: Qt.font({
                                                  family: latoBold.name,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })
    readonly property color backgroundColor: "#c2c2c2"

    property DirectoryFontLoader directoryFontLoader: DirectoryFontLoader {
        id: directoryFontLoader
    }
}
