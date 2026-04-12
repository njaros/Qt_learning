#include "counter.h"

Counter::Counter()
{
    _n = 0;
}

void Counter::incr() {
    _n += 1;
}

int Counter::get_counter() const {
    return _n;
}
