import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Window {
    width: 640
    height: 480
    visible: true


    //1、定义delegate
    Component {
        id:list_item

        Item {
            id: wrapper
            width: parent.width
            height: ListView.isCurrentItem ? 50 : 30

            // 实现了鼠标点选高亮的效果
            MouseArea {
                anchors.fill: parent;
                onClicked: wrapper.ListView.view.currentIndex = index
            }

            /*Row {
                spacing: 30
                Text {
                    text: name
                    // 是否是当前条目
                    color: wrapper.ListView.isCurrentItem ? "red" : "black"
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                    Layout.preferredWidth: 200
                }

                Text {
                    text: cost
                    color: wrapper.ListView.isCurrentItem ? "red" : "black"
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                    Layout.preferredWidth: 200
                }

                Text {
                    text: manufacturer
                    color: wrapper.ListView.isCurrentItem ? "red" : "black"
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                    Layout.fillWidth: true
                }
            }*/

            Text {
                width: parent.width
                text: name
                horizontalAlignment: Text.AlignLeft
//                verticalAlignment: Text.AlignVCenter  //无效居中
                anchors.verticalCenter: parent.verticalCenter //有效居中
                // 是否是当前条目
                leftPadding: 20
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
                font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                Layout.preferredWidth: 200
            }

            Text {
                width: parent.width
                text: cost
                horizontalAlignment: Text.AlignHCenter
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
                font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                Layout.preferredWidth: 200
            }

            Text {
                width: parent.width
                text: manufacturer
                rightPadding: 20
                horizontalAlignment: Text.AlignRight
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
                font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18
                Layout.fillWidth: true
            }
        }
    }

    //header
    Component {
        id: headerView
        Item {
            width: parent.width
            height: 30
            Text {
                width: parent.width
                text: "Name:"
                font.pixelSize: 20
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 20
                Layout.preferredWidth: 200
            }

            Text {
                width: parent.width
                text: "Cost:"
                font.pixelSize: 20
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
                Layout.preferredWidth: 200
            }

            Text {
                width: parent.width
                text: "Manufacturer:"
                font.pixelSize: 20
                font.bold: true
                rightPadding: 20
                horizontalAlignment: Text.AlignRight
                anchors.verticalCenter: parent.verticalCenter
                Layout.fillWidth: true
            }
        }
    }

    //footer
    Component {
        id: footView

        Rectangle {
            id:divider_line
            width: parent.width
            height: 1
            color: "red"
        }
    }


    // 2.定义ListView
    ListView {
        id: listView
        anchors.fill: parent

        // 使用先前设置的delegate
        delegate: list_item

        footer: footView
        header: headerView

        // 3.ListModel专门定义列表数据的，它内部维护一个 ListElement 的列表。
        model: ListModel {
            id: phoneModel

            // 一个 ListElement 对象就代表一条数据
            ListElement{
                name: "iPhone 3GS"
                cost: "1000"
                manufacturer: "Apple"
            }
            ListElement{
                name: "iPhone 4"
                cost: "1800"
                manufacturer: "Apple"
            }
            ListElement{
                name: "iPhone 4S"
                cost: "2300"
                manufacturer: "Apple"
            }
            ListElement{
                name: "iPhone 5"
                cost: "4900"
                manufacturer: "Apple"
            }
            ListElement{
                name: "B199"
                cost: "1590"
                manufacturer: "HuaWei"
            }
            ListElement{
                name: "MI 2S"
                cost: "1999"
                manufacturer: "XiaoMi"
            }
            ListElement{
                name: "GALAXY S5"
                cost: "4699"
                manufacturer: "Samsung"
            }
        }

        // 背景高亮
        focus: true
        highlight: Rectangle{
            color: "lightblue"
            border.width: 1
        }

        onCurrentIndexChanged: {
            console.log("CurrentIndexChanged: " + listView.currentIndex)
        }

        onCurrentItemChanged: {
            console.log("CurrentItemChanged: " + listView.currentItem)
        }

        onCurrentSectionChanged: {
            console.log("CurrentSectionChanged: " + listView.currentSection)

        }
    }


    Row {
        spacing: 20
        y: 400
//        anchors.bottom: parent.bottom
//        anchors.verticalCenter: parent.verticalCenter

        Button {
            text: "访问数据"
            onClicked: {
                var data = listView.model.get(listView.currentIndex)
                console.log("name:%1  cost:%2  m:%3".arg(data.name).arg(data.cost).arg(data.manufacturer))
            }
        }

        Button {
            text: "删除数据"
            onClicked: {
               listView.model.remove(listView.currentIndex)
            }
        }

        Button {
            text: "新增数据"
            onClicked: {
                var data = listView.model.get(listView.currentIndex)
                listView.model.append(data)
            }
        }
    }


}
