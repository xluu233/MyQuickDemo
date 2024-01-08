import QtQuick
import QtQuick.Controls

Window {
    width: 1000
    height: 480


    Row{
        anchors.fill: parent
        anchors.left: imageViewer.right
        spacing: 20

        Column {
            Text {
                width: parent.width
                text: "本地资源图片"
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id: jpg
                width: 300
                fillMode: Image.PreserveAspectFit
                source: "qrc:/test/resource/image/jpg_test.jpg"
            }
        }

        Column {
            Text {
                width: parent.width
                text: "GIF图片"
                horizontalAlignment: Text.AlignHCenter
            }

            AnimatedImage{
                id:image_gif
                source: "qrc:/test/resource/image/gif_test.gif"
            }

        }

        Column {
            Text {
                width: parent.width
                text: "SVG图片"
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id:image_SVG
                width: 400
                fillMode: Image.PreserveAspectFit
                source: "qrc:/test/resource/image/svg_test.svg"
            }
        }

    }

}
