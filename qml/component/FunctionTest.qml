import QtQuick
import QtQuick.Controls

Item {
    id: name

    //开启一个新窗口
    function openNewWindow(qml){
        var component = Qt.createComponent(qml)
        if (component.status === Component.Ready) {
            //qml实例化成功
            var win = component.createObject(parent);
            if (win === null) {
                console.log("Error creating object");
            }
            win.closing.connect(function() {
                console.log('窗口关闭了')
            })
            win.show();
        } else {
            //qml实例化失败
            console.log("Error loading component:", component.errorString());
        }
    }



    Column {
        id:col3
        spacing: 10
        width: 100
        height: parent.height

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("功能测试")
        }

        Button{
            width:100
            height:25
            text:"基础语法测试"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/widget/BasicTest.qml")
            }
        }


        Button{
            width:100
            height:25
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            text:"Timer定时器"
            onClicked: {
                openNewWindow("qrc:/test/qml/widget/TimerTest.qml")
            }
        }


        Button{
            width:100
            height:25
            text:"按键测试"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/invisible/KeyTest.qml")
            }
        }

        Button{
            width:100
            height:25
            text:"qml信号槽"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/cpp_with_qml/SignalQml.qml")
            }
        }


        Button{
            width:100
            height:25
            text:"信号槽 qml with cpp"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/cpp_with_qml/SignalCpp.qml")
            }
        }


        Button{
            width:100
            height:25
            text: "cpp with qml测试"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/cpp_with_qml/cpp_with_qml.qml")
            }
        }





    }


}
