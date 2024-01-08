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
        spacing: 10
        width: 100
        height: parent.height

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("复杂组件")
        }


        Button{
            width:100
            height:25
            text:"ListView"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/mvd/ListViewTest.qml")
            }
        }

        Button{
            width:100
            height:25
            text:"ListView2"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/mvd/ListViewTest2.qml")
            }
        }

        Button{
            width:100
            height:25
            text:"SwipeView"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/widget/SwipeViewTest.qml")
            }
        }

        Button{
            width:100
            height:25
            text:"自定义Model"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/mvd/CustomModel.qml")
            }
        }

        Button{
            width:100
            height:25
            text:"抽屉式导航栏"
            background: Rectangle{
                border.color: parent.focus ? "blue" : "black"
            }
            onClicked: {
                openNewWindow("qrc:/test/qml/widget/NaviTest.qml")
            }
        }


    }


}
