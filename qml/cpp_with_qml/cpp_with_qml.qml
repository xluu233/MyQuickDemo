import QtQuick
import QtQuick.Controls
import MyTest 1.0
import single 1.0

Window {
    height: 480
    width: 640
    title: qsTr("cpp与qml交互测试")
    visible: true


    property int a: -1


    MyTest {
        id: myTest
    }

    Row {
        anchors.centerIn: parent

        Column {
            id: col1

            Text {
                width: 100
                text: a
            }

            Button {
                id: btn1
                width: 100
                text: "getA"

                onClicked: {
                    a = myTest.getA();
                    console.log(" myTest getA():", myTest.getA());
                }
            }
            Button {
                id: btn2
                width: 100
                text: "add A"

                onClicked: {
                    myTest.setA(++a);
                }
            }

            Button {
                id:btn3
                width: 100
                text:"测试c++对象注册"
                onClicked: {
                    console.log(mTestObject.getA())
                }
            }

        }

        Column {
            id: col2
            leftPadding: 20

            Button {
                width: 100
                text: "单例测试"
                onClicked: {
                    console.log(MySingleTestInstance.getA())
                    MySingleTestInstance.addA()
                }
            }
        }

        Column {
            leftPadding: 20

            MyTest {
                id: myTest2
                onA_Changed: {
                    //这个是cpp类中定义的信号
                    console.log("onA_Chaned~")
                }
                onM_aChanged: {
                    //这个是Q_PROPERTY中定义的m_a，自动生成的信号
                    console.log("onM_aChanged~")
                }
            }

            Button {
                width: 100
                text: "信号槽测试:" + myTest2.m_a
                onClicked: {
                    //实际上这里是调用WRITE属性，也就是add方法
                    myTest2.m_a = 1;
                    //直接调用myTest2.m_a就是调用READ属性，getA方法
                    console.log(myTest2.m_a)
                }
            }
        }
    }


}
