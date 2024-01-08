import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 480


    ScrollView {
        anchors.fill: parent

        Column{
            spacing: 10
            anchors.centerIn: parent

            Text {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("渐变色")
            }

            Rectangle {
                id: rect1
                x: 12; y: 12
                width: 176; height: 96
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "lightsteelblue" }
                    GradientStop { position: 1.0; color: "slategray" }
                }
                border.color: "slategray"
            }

            Text {
                id: text1
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("AAAABCDEFG")
                font.family: "Ubuntu"
                font.pixelSize: 28
                color: "#ff2056ab"
            }

            Button{
                width: parent.width
                text:"设置字体颜色"
                onClicked: {
                    if(text1.color == "#303030")
                        text1.color = "#ff2056ab"
                    else
                        text1.color = "#303030"
                }
            }


        }
    }

}
