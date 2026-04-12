#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qcounter.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<QCounter>("Counter", 1, 0, "Counter");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("myFirstQuickApp", "Main");

    return QCoreApplication::exec();
}
