import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id:mouse_window
    width: 640
    height: 480
    visible: true
    title: qsTr("MouseArea")

    MouseArea{
        id:mouse_area
        anchors.fill: parent
//        color:"blue"
//        opacity:0.5

        onClicked: {
            console.log("onClicked")
        }
        onPressed: {
            console.log("onPressed")
        }
        onReleased: {
            console.log("onReleased")
        }
//        pressedButtons: {

//        }

    }


    Rectangle{
        id:rect
        color: "red"
        width: 100
        height: 100

        //利用mouseArea来拖动rect
        MouseArea{
            anchors.fill: parent
            drag.target: rect
            drag.axis: Drag.XAxis | Drag.YAxis
            drag.minimumX: 0
            drag.maximumX: mouse_window.width - rect.width
        }
    }


}
