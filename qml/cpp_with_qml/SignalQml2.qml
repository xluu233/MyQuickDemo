import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480
    visible: true


    Component {
        id:com1
        Button{
            width: 100
            height: 40
            x:100
            y:100

            signal btn1Sig(int value)

            onClicked: {
                btn1Sig(10)
            }
        }
    }

    Component {
        id:com2
        Button{
            width: 100
            height: 40
            x:200
            y:100

            signal btn2Sig(int value)

            onClicked: {
                btn2Sig(10)
            }
        }
    }


    Loader{
        id: loader1
        sourceComponent: com1

        Connections{
            target: loader1.item
            function onBtn1Sig(value){
                console.log("1 +",value)
            }
        }
    }

    Loader{
        id: loader2
        sourceComponent: com2

        Connections{
            target: loader2.item
            function onBtn2Sig(value){
                console.log("2 +",value)
            }
        }
    }

}
