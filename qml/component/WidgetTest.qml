import QtQuick
import QtQuick.Controls

Item {

    //开启一个新窗口
    function openNewWindow(qml){
        var component = Qt.createComponent(qml)
        if (component.status === Component.Ready) {
            //qml实例化成功
            var win = component.createObject(parent);
            if (win === null) {
                console.log("Error creating object");
            }
            win.closing.connect(function() {
                console.log('窗口关闭了')
            })
            win.show();
        } else {
            //qml实例化失败
            console.log("Error loading component:", component.errorString());
        }
    }

    Column{
        spacing: 10
//        width: 100
//        height: parent.height

        Text {
            id: title
            //anchors.centerIn: parent  //会导致Column失效
            text: qsTr("基础组件")
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            //                verticalAlignment: Text.AlignVCenter
        }

        Row {
            spacing: 10

            Column {
                spacing: 10

                Button{
                    width:100
                    height:25
                    text:"Button"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/ButtonTest.qml")
                    }
                }


                Button{
                    width:100
                    height:25
                    text:"Text"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/TextTest.qml")
                    }
                }

                Button{
                    id:btn1
                    width:100
                    height:25
                    background: Rectangle{
                        border.color: btn1.focus ? "blue" : "black"
                    }
                    text:"Rectangle"
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/RectangleTest.qml")
                    }

                }

                Button{
                    id:btn2
                    width:100
                    height:25
                    text:"Component"
                    background: Rectangle{
                        border.color: btn2.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/ComponentTest.qml")
                    }
                }


                Button{
                    width:100
                    height:25
                    text:"ComboBox"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/MyComboBox.qml")
                    }
                }


                Button{
                    width:100
                    height:25
                    text:"Checkbox"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/CheckBoxTest.qml")
                    }
                }

                Button{
                    width:100
                    height:25
                    text:"RadioButton"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/RadioButtonTest.qml")
                    }
                }



                Button{
                    width:100
                    height:25
                    text:"MouseArea"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/invisible/MouseAreaTest.qml")
                    }
                }

                Button{
                    width:100
                    height:25
                    text:"MouseArea2 test"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/invisible/MouseAreaTest2.qml")
                    }
                }


                Button{
                    width:100
                    height:25
                    text:"Image"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/ImageTest.qml")
                    }
                }

                Button{
                    width:100
                    height:25
                    text:"Image网络加载"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/ImageTest2.qml")
                    }
                }



            }

            Column {
                spacing: 10

                Button{
                    width:100
                    height:25
                    text:"row colum布局"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/RowColumTest.qml")
                    }
                }

                Button{
                    width:100
                    height:25
                    text:"flow布局"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/FlowTest.qml")
                    }
                }

                Button{
                    width:100
                    height:25
                    text:"grid布局"
                    background: Rectangle{
                        border.color: parent.focus ? "blue" : "black"
                    }
                    onClicked: {
                        openNewWindow("qrc:/test/qml/widget/GridTest.qml")
                    }
                }

            }
        }


    }

}
