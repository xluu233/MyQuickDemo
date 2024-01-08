import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480

    // 用来显示一个等待图元
    BusyIndicator {
        id: busy
        running: true
        anchors.centerIn: parent
        z: 2
    }

    Text {
        id: stateLabel
        visible: false
        anchors.centerIn: parent
        z: 3
    }

    Image {
        id: imageViewer
        width: parent.width
        // 开启异步加载模式，专门使用一个线程来加载图片
        asynchronous: true
        // 图片较大的情况下,指定不缓存图像(cache默认为true)
        cache: false
        anchors.fill: parent
        // 设置图片的填充模式为“等比缩放”
        fillMode: Image.PreserveAspectFit
        onStatusChanged: {
            if (imageViewer.status === Image.Loading) {
                console.log("Image.Loading")
                busy.running = true; // 图片为“加载状态”，则显示“等待图元”
                stateLabel.visible = false
            }
            else if(imageViewer.status === Image.Ready){
                console.log("Image.Ready")
                busy.running = false; // 图片为“准备好的状态”，则不再显示“等待图元”
            }
            else if(imageViewer.status === Image.Error) {
                console.log("Image.Error")
                busy.running = false;
                stateLabel.visible = true // 图片为“加载失败状态”，则显示“Error”文本
                stateLabel.text = "Error"
            }
        }

        // 上面都执行完了，再显示图片
        Component.onCompleted: {
//            imageViewer.source = "https://i.ibb.co/6m75sYz/lol-4.jpg"
            imageViewer.source = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F3aa2ab6e-12f6-4621-8752-ebadce93a102%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1707157489&t=b5e155b625c1812371eba92a5ca8a077"
        }
    }

}
