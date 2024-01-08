import QtQuick
import QtQuick.Controls

Window {
    height: 480
    width: 640
    title: qsTr("页面切换测试")
    visible: true

    Loader {
        id:myLoader
        anchors.centerIn: parent
    }


    //登录页面-Component
    Component{
        id:loginPage
        LoginPage {
            // width: 300
            // height: 200
            anchors.centerIn: parent
        }
    }

    //主页面-Component
    Component{
        id:mainPage
        MainPage {
            // width: 500
            // height: 350
            anchors.centerIn: parent
        }
    }

    // 一开始显示登录页面
    Component.onCompleted: {
        myLoader.sourceComponent = loginPage
    }

}
