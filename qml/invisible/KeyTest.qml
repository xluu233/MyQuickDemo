import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 480

    Text {
        id: keyView
        anchors.horizontalCenter: parent.horizontalCenter
        font{ bold: true; pixelSize: 24}
        text: qsTr("text");
    }

    Rectangle {
        width: 300
        height: 200
        anchors.top: keyView.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter

        color: "#203020"
        focus: true
        Keys.enabled: true
        Keys.onEscapePressed: Qt.quit()
        Keys.onBackPressed: Qt.quit()
        Keys.onPressed: {

            console.log("key:"+event.key)
            console.log("nativeScanCode:"+event.nativeScanCode)
            console.log("text:"+event.text)
            console.log("******************************")

            keyView.text = "code:%1  key:%2".arg(event.key).arg(event.text)

            switch(event.key) {
            case Qt.Key_0:
            case Qt.Key_1:
            case Qt.Key_2:
            case Qt.Key_3:
            case Qt.Key_4:
            case Qt.Key_5:
            case Qt.Key_6:
            case Qt.Key_7:
            case Qt.Key_8:
            case Qt.Key_9:
                event.accept = true
                break;
            }
        }
    }

}
