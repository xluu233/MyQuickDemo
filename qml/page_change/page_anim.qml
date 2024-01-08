import QtQuick
import QtQuick.Controls

Window {
    id:pageWin
    height: 480
    width: 640
    title: qsTr("页面切换测试-动画")
    visible: true

    Loader {
        id:myLoader
        anchors.centerIn: parent
        anchors.fill: parent

        source: "qrc:/test/page_change/LoginPage.qml"
        onSourceChanged: animation.running = true

        // sourceComponent: loginPage
        // onSourceComponentChanged: animation.running = true

        NumberAnimation {
            id: animation
            target: myLoader.sourceComponent
            property: "x"
            from: 0
            to: pageWin.width - myLoader.item.width
            duration: 1000
            easing.type: Easing.InExpo
        }

        // NumberAnimation {
        //     id: animation
        //     target: myLoader.source
        //     property: "x"
        //     from: 0
        //     to: pageWin.width - myLoader.item.width
        //     duration: 1000
        //     easing.type: Easing.InExpo
        // }
    }


    //登录页面-Component
    Component{
        id:loginPage
        LoginPage {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            Behavior on y {
                NumberAnimation {
                    duration: 500
                }
            }
        }
    }

    //主页面-Component
    Component{
        id:mainPage
        MainPage {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            Behavior on y {
                NumberAnimation {
                    duration: 500
                }
            }
        }
    }

    // 一开始显示登录页面
    Component.onCompleted: {
        myLoader.sourceComponent = loginPage
    }


    Button {
        anchors.centerIn: parent.top
        text:"change"
        onClicked: {
            if(myLoader.sourceComponent === loginPage){
                hide()
            } else {
                show()
            }
        }
    }


    // 显示的时候加载qml，并且设置进入动画为true
    function show() {
        // myLoader.sourceComponent = loginPage
        myLoader.source = "qrc:/test/page_change/LoginPage.qml"
    }

    // 退出的时候，将退出动画设置为true
    function hide() {
        myLoader.source = "qrc:/test/page_change/MainPage.qml"
    }


}
