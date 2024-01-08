import QtQuick
import QtQuick.Controls


Window {
    width: 640
    height: 480
    visible: true

    Text {
        id: centerText;
        text: "A Single Text.";
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        font.pixelSize: 24;
        font.bold: true;
    }

    function setTextColor(clr){
        centerText.color = clr;
    }

    Flow {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.bottomMargin: 4
        spacing: 10

        Rectangle {
            width: 120;
            height: 20;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }

        Rectangle {
            width: 200;
            height: 10;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 35;
            height: 35;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 50;
            height: 30;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 70;
            height: 30;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 50;
            height: 250;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 35;
            height: 35;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 120;
            height: 20;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }

        Rectangle {
            width: 35;
            height: 35;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 200;
            height: 10;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 60;
            height: 60;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }

        Rectangle {
            width: 70;
            height: 30;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }
        Rectangle {
            width: 120;
            height: 20;
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
        }

//        Repeater {
//            model: 100
//            Rectangle {
//                width: Math.random()/200;
//                height: Math.random()/100;
//                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
//            }
//        }

    }
}
