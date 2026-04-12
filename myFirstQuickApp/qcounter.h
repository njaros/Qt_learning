#ifndef QCOUNTER_H
#define QCOUNTER_H

#include <QObject>
#include <QtQml>
#include "counter.h"

class QCounter : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Counter* _counter;
public:
    explicit QCounter(QObject *parent = nullptr);
    ~QCounter();

    Q_INVOKABLE void incr();
    Q_INVOKABLE int get_counter() const;

signals:
    void counterIncremeted();
};

#endif // QCOUNTER_H
