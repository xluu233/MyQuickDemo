import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Basic Test")

    Column {
        anchors.centerIn: parent
        spacing: 10



        Button {
            text: "QML类型 测试"
            onClicked: {
                   testBasicType()
            }
        }


        Button{
            id: btn1
            text: "JS类型 测试"
            onClicked: {
                //这种类型不能定义为全局变量
                var i                   //undefined
                var j = null            //null
                var name =  'hahah'    //string
                var age = 27            //number
                var isSex = false       //bool


                console.log(typeof i) // 输出：qml:undefined
                console.log(typeof j) // 输出：qml:object
                console.log(typeof name) // 输出：qml:string
                console.log(typeof age) // 输出：qml:number
                console.log(typeof isSex) // 输出：qml:boolean
            }
        }

        Button {
            text: "console.log 测试"
            onClicked: {
                testLog()
            }
        }

        Button {
            text: "function 测试"
            onClicked: {
                var i = 100
                var j = 10
                console.log(add(i,j))
            }
        }


        Button {
            text: "Qt枚举类型 测试"
            onClicked: {
                    testQtEnum()
            }
        }
    }


    function testLog(){
        console.time("console")

        console.log("hello world")
        console.debug("hello world")
        console.info("hello world")
        console.warn("hello world")
        console.error("hello world")

        //断言，true的时候跳过
        var x = 100
        console.assert(x == 100,"x == 100, pass")
        console.assert(x > 100,"x: %1 failed".arg(x))

        //计算程序执行时间
        console.timeEnd("console")

        //抛出异常
        console.exception()
    }


    function add(num1,num2)
    {
        num1 /= 2
        num2 *= 2
        console.log("add() num1:%1  num2:%2   result:%3".arg(num1).arg(num2).arg(num1 + num2))
        return num1 + num2
    }


    function testQtEnum()
    {
        var p1 = Qt.point(100,0)
        Qt.rect(0,0,100,100)

        var today = new Date();
        console.log(Qt.formatDateTime(today, "yyyy-MM-dd hh:mm:ss.zzz"));
    }

    property bool isMan: false
    property double x: 12.0
    property int name: 23
    property var names: ["my","your","man"]

    property real w: 100.10
    property real h: 102.22


    Item {
        id: item
        property var aNumber: 100
        property var aBool: false
        property var aString: "Hello world!"
        property var anotherString: String("#FF008800")
        property var aColor: Qt.rgba(0.2, 0.3, 0.4, 0.5)
        property var aRect: Qt.rect(10, 10, 10, 10)
        property var aPoint: Qt.point(10, 10)
        property var aSize: Qt.size(10, 10)
        property var aVector3d: Qt.vector3d(100, 100, 100)
        property var anArray: [1, 2, 3, "four", "five", (function() { return "six"; })]
        property var anObject: { "foo": 10, "bar": 20 }
        property var aFunction: (function() { return "one"; })
    }

    function testBasicType()
    {
        var names = ["my","your","man"]
        for(var i = 0; i < names.length; i++)
        {
            console.log("names:%1  ".arg(i) + names[i])
        }

        console.log("------------------------")

        for(var i = 0; i < item.anArray.length; i++)
        {
            console.log("anArray:%1  ".arg(i) + item.anArray[i])
        }

        console.log("------------------------")
    }


}
