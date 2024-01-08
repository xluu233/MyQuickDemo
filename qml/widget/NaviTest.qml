import QtQuick
//import "navigation.qml" as Navigation

Window {
    width: 640
    height: 480
    visible: true

    Loader{
        id: load
        anchors {
            fill: parent
            centerIn: parent
        }
        source: "Navigation.qml"
    }

}
