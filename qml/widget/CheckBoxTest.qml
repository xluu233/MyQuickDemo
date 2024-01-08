import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id:component_window
    width: 640
    height: 480
    visible: true
    title: qsTr("CheckBox")

    //实现单选check group
    ButtonGroup{
        id:check_group
        exclusive: true
        buttons: col.children
    }

    Column{
        id:col
        CheckBox {
            checked: true
            text: qsTr("First")
        }
        CheckBox {
            text: qsTr("Second")
        }
        CheckBox {
            checked: true
            text: qsTr("Third")
        }
    }


    //方式二：

    Column{
        id:col2
        anchors.left: col.right
        anchors.top: col.top

        ButtonGroup{
            id:btn_group
            exclusive: false
            checkState: parentBox.checkState
        }

        CheckBox {
            //三态
            tristate: true
            checked: true
            text: qsTr("First")
            checkState: child
        }
        CheckBox {
            text: qsTr("Second")
        }
        CheckBox {
            checked: true
            text: qsTr("Third")
        }
    }


}
