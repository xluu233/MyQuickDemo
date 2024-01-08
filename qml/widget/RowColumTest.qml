import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5


Window {
    id:row_cloum
    width: 640
    height: 480
    visible: true

    Column{
        id:col
        spacing: 20
        Repeater{
            id:repeater
            model: 3
            Button{
                width:100
                height: 30
                text:"btn_coluum"+modelData
            }
        }

        Row{
            Repeater{
                model: 3
                Button{
                    width:100
                    height: 30
                    text:"btn_row"+modelData
                }
            }
        }

        Rectangle{
            width: 400
            height: 300
            border.width: 2
            border.color: "black"
            //流式布局，自动根据宽高布局
            Flow{
                anchors.fill: parent
                anchors.margins: 4
                spacing: 10
                Text {
                    text: qsTr("texaa")
                    font.pixelSize:30
                }
                Text {
                    text: qsTr("xyz")
                    font.pixelSize:1 
                }
                Text {
                    text: qsTr("texaabcdefghijklmnopquvwxyz")
                    font.pixelSize:50
                }
                Text {
                    text: qsTr("texaabcdefghijklmnopquvwxyz")
                    font.pixelSize:40
                }
            }
        }

    }
}
