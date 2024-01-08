import QtQuick
import QtQuick.Controls
import "qrc:///test/qml/anim/"
import "qrc:///test/qml/component/"

Window {
    height: 480
    width: 640
    title: qsTr("QML")
    visible: true

    Row{
        anchors.fill: parent
        spacing: 10

        WidgetTest{
           id:widget_test
           width: 210
           height: parent.height
        }


        WidgetTest2{
           id:widget_test2
           width: 100
           height: parent.height
        }

        FunctionTest{
            width: 100
            height: parent.height
        }

        ComponentTest {
            id:com_test
            width: 100
            height: parent.height
        }

    }



}
