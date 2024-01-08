import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480

    Column {
        id: radio_group1
        RadioButton {
            checked: true
            text: qsTr("First")
        }
        RadioButton {
            text: qsTr("Second")
        }
        RadioButton {
            text: qsTr("Third")
        }
    }


    Column {
        id: radio_group2
        anchors.left: radio_group1.right

        CustomRadioButton {
            checked: true
            text: qsTr("First")
        }
        CustomRadioButton {
            text: qsTr("Second")
            checked: false
        }
        CustomRadioButton {
            text: qsTr("Third")
            checked: false
        }
    }


    /*---------------推荐的方式-----------------*/

    ButtonGroup {
        id: buttonGroup
    }

    ListView {
        x:10
        y:150
        width: 200
        height: parent.height
        model: ["Option 1", "Option 2", "Option 3"]
        delegate: RadioDelegate {
            id: control
            text: modelData
            checked: index == 0
            ButtonGroup.group: buttonGroup

            contentItem: Text {
                rightPadding: control.indicator.width + control.spacing
                text: control.text
                font: control.font
                opacity: enabled ? 1.0 : 0.3
                color: control.down ? "#17a81a" : "#21be2b"
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }

            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: control.width - width - control.rightPadding
                y: parent.height / 2 - height / 2
                radius: 13
                color: "transparent"
                border.color: control.down ? "#17a81a" : "#21be2b"

                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 7
                    color: control.down ? "#17a81a" : "#21be2b"
                    visible: control.checked
                }
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                visible: control.down || control.highlighted
                color: control.down ? "#bdbebf" : "#eeeeee"
            }

            onCheckedChanged: {
                console.log("radiobtn: %1 checked:%2".arg(text).arg(checked))
            }
        }
    }



}


