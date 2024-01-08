import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root
    width: 640
    height: 1920

    Column {
        anchors.fill: parent
        anchors.centerIn: parent
        spacing: 10



        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            Text {
                text: "Hello World!"
                font.family: "Helvetica"    //字体设置
                font.pointSize: 20      //字体大小
                font.bold: true         //加粗
                font.italic: true       //斜体
                color: "red"    //颜色设置
            }
        }


        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //html格式
            Text {
                text: "<b>Hello</b> <i>World!</i>"
            }
        }


        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //水平居中
            Text {
                anchors.fill: parent
                text: "Hello World!（horizontalAlignment）"
                font.pointSize: 20
                horizontalAlignment: Text.AlignHCenter  //水平居中
            }
        }


        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //垂直居中
            Text {
                anchors.fill: parent
                text: "Hello World!（verticalAlignment）"
                font.pointSize: 20
                verticalAlignment: Text.AlignVCenter     //垂直居中
            }

        }


        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //删除线和下划线
            Text {
                anchors.centerIn: parent
                text: "Hello World!"
                font.pointSize: 20
                font.strikeout: true
                font.underline: true
            }
        }

        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //删除线和下划线
            Text {
                anchors.centerIn: parent
                text: "Hello World! \nHello World! \nHello World! \nHello World! "
                font.pointSize: 10
                lineHeight: 1.5 //设置行高为1.5倍字号
                maximumLineCount: 3     //设置最多行数，超出部分用省略号表示。
                elide: Text.ElideRight  //省略号位置在右侧
            }
        }

        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //垂直居中 && 水平居中 (方式一)
            Text {
                anchors.fill: parent
                text: "Hello World!（center）"
                font.pointSize: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignVCenter
            }

            // (方式二)
            /*
            Text {
                anchors.centerIn: parent
                text: "Hello World!（center 22）"
                font.pointSize: 20
            }
            */
        }

        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            //文本换行方式

//            Text {
//                width:200
//                height: parent.height
//                anchors.centerIn: parent
//                text: "This is a long text which will be automatically wrapped when it exceeds the width of the container."
//                font.pointSize: 20
//                wrapMode: Text.NoWrap //不换行
//            }

//                Text {
//                    width:200
//                    height: parent.height
//                    anchors.centerIn: parent
//                    text: "This is a long text which will be automatically wrapped when it exceeds the width of the container."
//                    font.pointSize: 10
//                    wrapMode: Text.WordWrap //根据word换行
//                }

//                Text {
//                    width:200
//                    height: parent.height
//                    anchors.centerIn: parent
//                    text: "This is a long text which will be automatically wrapped when it exceeds the width of the container."
//                    font.pointSize: 10
//                    wrapMode: Text.WrapAnywhere
//                }

                Text {
                    width:200
                    height: parent.height
                    anchors.centerIn: parent
                    text: "This is a long text which will be automatically wrapped when it exceeds the width of the container."
                    font.pointSize: 10
                    wrapMode: Text.Wrap
                }


        }


        Rectangle {
            width: parent.width
            height: 100
            border.width: 1
            border.color: red

            Text {
                id: myText
                text: "Hello, World!"
                Layout.preferredWidth: 100      //理想宽度被设置为100像素
                Layout.alignment: Qt.AlignCenter        //当Rectangle的宽度大于100像素时，Text元素将保持其理想宽度，并根据Layout.alignment属性在Rectangle中居中对齐。
            }
        }

    }

}
