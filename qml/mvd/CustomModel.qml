import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480
    visible: true


    ListView{
        id:list_1
        spacing: 10
        orientation: ListView.Vertical;
        anchors{
            fill:parent
        }

        //设置高光
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        highlightFollowsCurrentItem: true

        model:ListModel{
            ListElement{
                name: "张三"
                age: "12"
            }
            ListElement{
                name: "张三"
                age: "12"
            }
            ListElement{
                name: "张三"
                age: "12"
            }
        }
        delegate: Component {
            Item{
                width: 200
                height: 50
                Column{
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: "姓名：" + name
                    }
                    Text {
                        text: "年龄" + age
                    }
                }
            }
        }
    }
}
