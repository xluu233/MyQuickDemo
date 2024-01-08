import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id:mouse_window
    width: 640
    height: 480
    visible: true
    title: qsTr("MouseArea")


    Rectangle {
        id:rect
        width: 320
        height: 240
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if(mouse.button == Qt.RightButton){
                Qt.quit()
            }
            else if(mouse.button == Qt.LeftButton){
                rect.color = Qt.rgba((mouse.x % 255) / 255.0 , (mouse.y % 255) / 255.0, 0.6, 1.0)
            }
        }
        onDoubleClicked: {
            rect.color = "gray"
        }
    }

}
