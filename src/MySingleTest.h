//
// Created by xlu on 2023/12/29.
//

#ifndef QML_TEST_MYSINGLETEST_H
#define QML_TEST_MYSINGLETEST_H
#include <QObject>

class MySingleTest : public QObject{
    Q_OBJECT
public:
    MySingleTest();

    static MySingleTest* Instance()
    {
        static MySingleTest _INSTANCE;
        return &_INSTANCE;
    }

    Q_INVOKABLE int getA();

    Q_INVOKABLE void addA()
    {
        a++;
    }

private:
    int a;
};


#endif //QML_TEST_MYSINGLETEST_H
