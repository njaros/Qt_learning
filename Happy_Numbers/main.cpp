#include "happynumber.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    happyNumber w;
    w.show();
    return QCoreApplication::exec();
}
