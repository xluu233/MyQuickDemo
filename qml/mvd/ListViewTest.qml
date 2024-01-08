import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480
    visible: true

    ListView{
        width: 440
        height: 500
        model: m_model
//        orientation: ListView.Horizontal
        orientation: ListView.Vertical
    }

    ObjectModel {
        id:m_model
        Rectangle {
            width : 400
            height: 300
            color: "black"
        }
        Rectangle {
            width : 400
            height: 300
            color: "red"
        }
        Rectangle {
            width : 400
            height: 300
            color: "grey"
        }
    }


}
