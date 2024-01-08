import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Button")

    Column{
        spacing: 10

        Button {
            text: "Ok"
            onClicked: model.submit()
        }
        Button {
            text: "Cancel"
            onClicked: model.revert()
        }

        DelayButton{
            text:"delay button"
            delay: 1000
        }


        //radio button可以自动实现排他性
        RadioButton{
            text: "radio button1"
        }

        RadioButton{
            text: "radio button2"
        }

        RadioButton{
            text: "radio button3"
        }

        Switch{
            text: "switch1  wifi"
        }

        Switch{
            text: "switch1  bluetooh"
        }


        TabBar{
            TabButton{
                text:qsTr("tab btn1")
            }
            TabButton{
                text:qsTr("tab btn2")
            }
            TabButton{
                text:qsTr("tab btn3")
            }
        }

        RoundButton{
            text: "text"
            radius: 10
        }


        //自定义button风格
        Button {
            id:btn
            width: 100
            height:50
            background: Rectangle{
                anchors.fill: parent
                color: "blue"
            }
            contentItem: Rectangle{
                Text {
                    text: qsTr("custom button")
                    font.pixelSize: 18
                    font.bold: true
                    font.italic: true
                    color: "red"
                }
                Image {
                    id: imag
                    source: ":/qml/image/1 (1).gif"
                    width: 100
                    height:50
                }
            }
        }

        //自定义封装的button
        MyButton {
            id: myButton
            x: 12; y: 12
            text: "Start"

            // 绑定的是自定义的"m_clicked信号"
            onM_clicked: {
                console.log("myButton ：m_clicked")
            }
        }

    }



}
