import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 120
    height: 40

    color: "red"
    border.color: "slategrey"
    radius: 10


    property alias text: label.text

    //自定义信号
    signal m_clicked


    Text {
        id: label
        text: qsTr("MyButton")
        anchors.centerIn: parent
    }

    MouseArea {
        id:mousea
        anchors.fill: parent
        onClicked: {
            console.log("MouseArea: click")
            root.m_clicked();
        }
    }


    //另外一种触发signal的方式
//    Component.onCompleted:{
//        mousea.clicked.connect(m_clicked)
//    }


}
