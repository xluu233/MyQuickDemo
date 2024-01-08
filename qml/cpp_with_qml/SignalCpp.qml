import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MyQmlObject 1.0


Window {
    id:sig_win
    width: 640
    height: 480
    visible: true


//    property var myObj : value = myQmlObj

    Column{

        Button{
            width:150
            height:40
            text:"获取cpp对象"
            background: Rectangle{
                border.color: btn2.focus ? "blue" : "black"
            }
            onClicked: {
                myQmlObj.ss = "click"
                myQmlObj.ii = 100
                console.log(myQmlObj.ss,myQmlObj.ii)

//                myObj.ss = "ahahha"
//                console.log(myQmlObj.ss,myQmlObj.ii)
            }
        }


        Button{
            width:150
            height:40
            text:"调用cpp对象函数"
            background: Rectangle{
                border.color: btn2.focus ? "blue" : "black"
            }
            onClicked: {
                //直接调用cpp对象函数
                myQmlObj.testFunc()
            }
        }

        Button{
            width:150
            height:40
            text:"调用cpp对象函数"
            background: Rectangle{
                border.color: btn2.focus ? "blue" : "black"
            }
            onClicked: {
                qmlWithCppFun(123,"??")
            }
        }

    }

    //在cpp中定义的数据类型，需要通过qmlRegisterType注册
    MyQmlObject{
        id: myQmlObj
        ss: "test"
        ii: 123
        Component.onCompleted: {
            console.log(ss,ii)
        }
    }



    signal qmlWithCppFun(int i,string s)

    //绑定cpp槽函数，style1
    Component.onCompleted: {
        qmlWithCppFun.connect(myQmlObj.cppSlot)
    }

    //绑定cpp槽函数，style2
//    Connections{
//        target: sig_win
//        function onQmlWithCppFun(i,s){
//            myQmlObj.cppSlot(i,s)
//        }
//    }

}
