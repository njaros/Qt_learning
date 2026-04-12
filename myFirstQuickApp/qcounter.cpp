#include "qcounter.h"

QCounter::QCounter(QObject *parent)
    : QObject{parent}
{
    _counter = new Counter;
}

QCounter::~QCounter()
{
    delete _counter;
}

void QCounter::incr()
{
    _counter->incr();
    emit counterIncremeted();
}

int QCounter::get_counter() const {
    return _counter->get_counter();
}