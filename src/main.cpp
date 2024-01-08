#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "src/MyTest.h"
#include "src/MySingleTest.h"


void initQmlType(QQmlApplicationEngine& engine)
{
    //将c++类型注册到qml系统中，MyTest必须继承自public QObject
    qmlRegisterType<MyTest>("MyTest",1,0,"MyTest");

    //将c++对象注册到qml系统中
    MyTest *test = new MyTest();
    engine.rootContext()->setContextProperty("mTestObject",test);

    //单例对象注册
    MySingleTest::Instance();

//    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/test/toast/toast.qml")), "SingletonComponent", 1, 0, "HoverShowMessage" );
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    initQmlType(engine);
//    QQmlContext* context = engine.rootContext();
//    const QUrl url(u"qrc:/test/qml/toast.qml"_qs);
    const QUrl url(QStringLiteral("qrc:/test/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
