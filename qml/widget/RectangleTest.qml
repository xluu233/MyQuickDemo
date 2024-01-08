import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id:rectangle_window
    width: 640
    height: 480
    visible: true
    title: qsTr("Rectangle")

    Rectangle{
        x:30
        y:30
        id:rect1
        width:100
        height: 200
//            color: "red"
//            focus: true
        state: "released"

        states: [
            State {
                name: "pressed"
                PropertyChanges {
                    target: rect1
                    color: "blue"
                }
            },
            State {
                name: "released"
                PropertyChanges {
                    target: rect1
                    color: "red"
                }
            }
        ]

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("MouseArea click")
            }
            onPressed: {
                console.log("MouseArea onPressed")
                rect1.state = "pressed"
            }
            onReleased: {
                console.log("MouseArea onReleased")
                rect1.state = "released"
            }
        }

        Keys.onReturnPressed: {
            console.log("onReturnPressed click")
        }

        PropertyAnimation on x{
            to : 100
            duration: 200
        }
        PropertyAnimation on y{
            to : 100
            duration: 200
        }

        //颜色动画
        ColorAnimation on color{
            from: "red"
            to: "yellow"
            duration: 600
        }

        //预先针对值得行为，在改变的时候显示动画
        Behavior on x {
            NumberAnimation {
                id:behav
                easing{
                    type: Easing.InOutQuad
                    amplitude: 1.0
                    period: 0.5
                }
            }
        }

        Behavior on y{
            animation: behav
        }

//            Behavior {
//                ColorAnimation {
//                    target: rect1
//                    from: "white"
//                    to: "black"
//                    duration: 200
//                }
//            }

    }

    Rectangle{
        id:rect2
        width:100
        height: 200
        color: "blue"
        anchors.left: rect1.right
        anchors.top: rect1.top
        anchors.leftMargin: 10
    }

    Rectangle{
        id:rect3
        width:100
        height: 200
        color: "black"
        anchors.top: rect1.bottom
        anchors.topMargin: 10
        anchors.left: rect1.left
    }


    Rectangle{
        id:rect4
        width:100
        height: 200
        color: "red"

        //四周的边框
        border.color: "black"
        border.width: 3

        anchors.left: rect2.right
        anchors.leftMargin: 50

        Text {
            id: name
            text: qsTr("带边框的rect")
//                horizontalCenter: parent.horizontalCenter
//                verticalCenter: parent.verticalCenter
        }

//            Rectangle{
//                color: "white"
//                anchors.fill: parent
//                anchors.topMargin: 6
//                anchors.leftMargin: 6
//            }
    }

}
