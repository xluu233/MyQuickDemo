import QtQuick
import QtQuick.Controls 2.0
import MyTest 1.0
import single 1.0

Column {
    id:col1
    width: 100
    height: parent.height
    spacing: 10

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

    Text {
        id: title
        text: qsTr("动画测试")
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }


    Button {
        width: parent.width
        height:25
        text: "颜色测试"
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        onClicked: {
            openNewWindow("qrc:/test/qml/anim/ColorTest.qml")
        }
    }

    Button {
        width: parent.width
        height:25
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        text: "Text跑马灯"
        onClicked: {
            openNewWindow("qrc:/test/qml/anim/TextColorAnim.qml")
        }
    }

    Button {
        width: parent.width
        height:25
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        text: "界面切换"
        onClicked: {
            openNewWindow("qrc:/test/qml/page_change/page_change.qml")
        }
    }

    Button {
        width: parent.width
        height:25
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        text: "界面切换带动画"
        onClicked: {
        }
    }


    Button {
        width: parent.width
        height:25
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        text: "Loader加载动画"
        onClicked: {
        }
    }


}
