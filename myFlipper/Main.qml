import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    StackView {
        id: view
        anchors.fill: parent

        Lobby {}

        Playground {}
    }
}
