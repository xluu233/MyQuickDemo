//
// Created by xlu on 2023/12/29.
//

#ifndef QML_TEST_MYTEST_H
#define QML_TEST_MYTEST_H

#include <QObject>

class MyTest : public QObject
{
    Q_OBJECT
public:
    MyTest():a(-1){};

    Q_INVOKABLE int getA()
    {
        return a;
    }

    Q_INVOKABLE void setA(int a)
    {
        this->a = a;
        a_Changed();
    };


    void add(int value)
    {
        a += value;
        a_Changed();
    };

    Q_PROPERTY(int m_a READ getA WRITE add NOTIFY a_Changed);

signals:
    void a_Changed();

private:
    int a;


};
#endif //QML_TEST_MYTEST_H
