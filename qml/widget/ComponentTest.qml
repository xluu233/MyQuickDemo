import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id:component_window
    width: 640
    height: 480
    visible: true
    title: qsTr("Component")

    //component必须要有一个子元素
    Component {
        id: com
        Rectangle {
            color: "red"
            width: 200
            height: 100
            Component.onCompleted: console.log("onCompleted")
            Component.onDestruction: console.log("onDestruction")
        }
    }


    Component {
        id:com_image
        Column {
            spacing: 20

            Image {
                id: jpg
                width: 200
                fillMode: Image.PreserveAspectFit
                source: "qrc:/test/resource/image/jpg_test.jpg"
            }

            AnimatedImage{
                id:image2
                source: "qrc:/test/resource/image/gif_test.gif"
            }
        }
    }

    //Loader加载component,否则是 不显示的
    Loader{
        id:load
        onScaleChanged: {
            console.log("statuc:".status)
        }
        //异步加载
        asynchronous: true
    }

    Button{
        id:btn1
        height: 50
        anchors.centerIn: parent
        text: "加载"
        onClicked: {
            if(load.sourceComponent == null){
                load.sourceComponent = com
                btn1.text =  "默认Component"
            }
            else if(load.sourceComponent == com){
                load.sourceComponent = com_image
                btn1.text = "图片Component"
            }
            else{
                load.sourceComponent = null
                btn1.text = "null"
            }

        }
    }

}
