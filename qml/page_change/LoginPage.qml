import QtQuick
import QtQuick.Controls

Rectangle {
    width: 400
    height: 300
    color: "#051f58"
    radius: 8

    Button {
        text: "登录页面"
        anchors.centerIn: parent
        onClicked: myLoader.sourceComponent = mainPage // 切换显示主页面
    }

}
