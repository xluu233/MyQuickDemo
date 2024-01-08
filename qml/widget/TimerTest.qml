import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Button")

    property int time: 0

    Text {
        id: time_s
        text: time
        anchors.centerIn: parent
        font.pixelSize: 20
    }

    Timer{
        id:timer
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            time += 1
        }

    }


}
