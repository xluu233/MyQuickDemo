import QtQuick
import QtQuick.Controls


Window {
    id:root
    width: 640
    height: 480
    visible: true




    Grid {
        id:grid_view
        anchors.fill: parent

        signal itemClick(int index)

        Repeater {
            model:10
            Rectangle {
                width: 100
                height: 33
                radius: 5
                anchors.margins: 10
                anchors.leftMargin: 10
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0)

                Text {
                    color: "white"
                    text: qsTr("item%1".arg(index))
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: grid_view.itemClick(index)
                }
            }
        }
    }


    Grid {
        id:grid_view2
        x:0
        y:200

        Repeater {
            model: ["张三","Jack","Roce","Pack","sb"]

            Rectangle {
                width: 100
                height: 33
                radius: 5
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0)
                Text {
                    anchors.centerIn: parent
                    text: qsTr(modelData)
                }

            }
        }
    }

    function click(index){
        console.log("grid clicked: " + index)
    }

    Connections{
        target:grid_view
        onItemClick: click(index)
    }
}
