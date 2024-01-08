//
// Created by xlu on 2023/12/29.
//

#include "MySingleTest.h"
#include <QQmlEngine>

int MySingleTest::getA() {
    return a;
}

/**
 * 这是qmlRegisterSingletonType的回调函数，通过这个函数获取一个实例的指针作为Qml单例的引用地址
 * @param engine
 * @param scriptEngine
 * @return
 */
static QObject *getMySingleInstancePtr(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return MySingleTest::Instance();
}


MySingleTest::MySingleTest() {

    /**
     * qml中导入：import single 1.0
     * 调用：MySingleTestInstance.getA();
     */
    qmlRegisterSingletonType<MySingleTest>("single",
                                           1,0,
                                           "MySingleTestInstance",
                                           getMySingleInstancePtr);

}
