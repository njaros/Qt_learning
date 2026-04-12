#ifndef COUNTER_H
#define COUNTER_H

class Counter
{

    int _n;

public:
    explicit Counter();

    void incr();
    int get_counter() const;
};

#endif // COUNTER_H
