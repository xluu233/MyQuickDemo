import QtQuick
import QtQuick.Controls

Window {
    id: window
    width: 400
    height: 400
    visible: true

    Loader {
        id: loader
        onSourceChanged: animation.running = true

        NumberAnimation {
            id: animation
            target: loader.source
            property: "x"
            from: 0
            to: window.width - loader.item.width
            duration: 1000
            easing.type: Easing.InExpo
        }
    }

    // Replace this with some other action that changes the source.
    Component.onCompleted: loader.source = "qrc:/test/anim/LoginPage.qml"
}