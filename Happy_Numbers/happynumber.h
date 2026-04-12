#ifndef HAPPYNUMBER_H
#define HAPPYNUMBER_H

#include <QWidget>

QT_BEGIN_NAMESPACE
namespace Ui {
class happyNumber;
}
QT_END_NAMESPACE

class happyNumber : public QWidget
{
    Q_OBJECT

public:
    explicit happyNumber(QWidget *parent = nullptr);
    ~happyNumber() override;

    void compute() const;
    void setInput(const QString& in);

private slots:
    void on_numberInput_textChanged(const QString &text);
    void on_computeButton_clicked();

private:
    Ui::happyNumber *ui;
    QString _input;
    bool _isNumber() const;
};
#endif // HAPPYNUMBER_H
