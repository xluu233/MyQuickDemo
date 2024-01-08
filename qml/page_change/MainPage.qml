import QtQuick
import QtQuick.Controls

Rectangle {
    width: 400
    height: 300
    color: "#498ff8"
    radius: 8

    Button {
        text: "主页面"
        anchors.centerIn: parent
        onClicked: myLoader.sourceComponent = loginPage
    }
}
