import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

//下拉菜单
Window {
    width: 640
    height: 480
    visible: true

    Column{

        ComboBox{
            id:combox
            model: ["button","text","color"]
        }

        ComboBox {
            editable: true
            model: ListModel {
                id: model
                ListElement { text: "Banana" }
                ListElement { text: "Apple" }
                ListElement { text: "Coconut" }
            }

            //可以手动新增数据
            onAccepted: {
                if (find(editText) === -1)
                    model.append({text: editText})
            }

            Component.onCompleted:{
                console.log("completed")
            }
        }

    }


}


