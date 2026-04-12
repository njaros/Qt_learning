#ifndef TEXTFINDER_H
#define TEXTFINDER_H

#include <QWidget>

QT_BEGIN_NAMESPACE
namespace Ui {
class TextFinder;
}
QT_END_NAMESPACE

class TextFinder : public QWidget
{
    Q_OBJECT

public:
    explicit TextFinder(QWidget *parent = nullptr);
    ~TextFinder() override;

private slots:
    void on_findButton_clicked();

private:
    Ui::TextFinder *ui;
    void loadTextFile();
};
#endif // TEXTFINDER_H
