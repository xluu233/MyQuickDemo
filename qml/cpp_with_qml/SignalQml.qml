import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: root
    width: 640
    height: 480
    visible: true


    //定义一个信号
    signal win(string s, int i)


    Button{
        id:btn
        width:150
        height:40
        anchors.centerIn: parent
        text:"qml信号槽-发送"
        background: Rectangle{
            border.color: parent.focus ? "blue" : "black"
        }
        onClicked: {
            //这里发送了一次信号函数，有三处槽函数会响应
            win("fuck",1)
        }
    }

    //信号对应的槽函数,win默认的槽函数
    onWin:function(s,i){
//        console.log("signal recvie")
        onWinOpened(s,i+1)
    }

    //openWin的槽函数
    function onWinOpened(s,i){
        console.log("onWinOpened: " + s + i)
    }

    //绑定信号槽：方式一，控件结束的时候绑定
    Component.onCompleted: {
        //可以绑定多个槽函数
        win.connect(onWinOpened)
    }


    //绑定信号槽：方式二，推荐
    Connections {
//        发送信号者
        target: root
//        接收的槽函数
        onWin: onWinOpened(s,i+2)
    }

}
