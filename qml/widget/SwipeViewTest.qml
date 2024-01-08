import QtQuick 2.15
import QtQuick.Controls 2.0


Window {
    width: 640
    height: 480
    visible: true

    property int sw_index: 0

    SwipeView {
        id: view
        currentIndex: sw_index
        anchors.fill: parent

        Item {
            id: firstPage
            Rectangle{
                anchors.fill: parent
                color: "#3f4241"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("one")
                }
            }
        }
        Item {
            id: secondPage
            Rectangle{
                anchors.fill: parent
                color: "#ffd461"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("two")
                }
            }
        }
        Item {
            id: thirdPage
            Rectangle{
                anchors.fill: parent
                color: "#30d461"
                Text {
                    anchors.centerIn: parent
                    text: qsTr("three")
                }
            }
        }
        Item {
            id:fourPage
            Text {
                anchors.fill: parent
                anchors.centerIn: parent
                text: qsTr("four")
            }
        }

        //监听index
        onCurrentIndexChanged: {
            sw_index = currentIndex
            console.log("onCurrentIndexChanged: " + sw_index)
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button{
        id: btn_pre
        text: "pre"
        width: 100
        onClicked: {
            sw_index--
            if(sw_index < 0) sw_index = view.count-1
            if(sw_index > view.count-1) sw_index = 0

            view.currentIndex = sw_index

            console.log("isCurrentItem:%1   isPreviousItem:%2    isNextItem:%3".arg(view.isCurrentItem)
                        .arg(view.isPreviousItem).arg(view.isNextItem))
        }
    }

    Button{
        id: btn_next
        text: "next"
        width: 100
        anchors.left: btn_pre.right
        onClicked: {
            sw_index++
            if(sw_index < 0) sw_index = view.count-1
            if(sw_index > view.count-1) sw_index = 0

            view.currentIndex = sw_index
        }
    }



}
