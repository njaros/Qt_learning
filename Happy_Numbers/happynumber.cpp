#include "happynumber.h"
#include "./ui_happynumber.h"

happyNumber::happyNumber(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::happyNumber)
{
    ui->setupUi(this);
}

happyNumber::~happyNumber()
{
    delete ui;
}
bool happyNumber::_isNumber() const
{
    if (_input.isEmpty())
        return false;
    for (auto c: _input) {
        if (!c.isDigit())
            return false;
    }
    return true;
}

void happyNumber::compute() const
{
    unsigned int n = _input.toUInt();
    if (n < 10)
        n = n * n;
    while (n > 9) {
        unsigned int sum = 0;
        while (n > 0) {
            sum += (n % 10) * (n % 10);
            n /= 10;
        }

        n = sum;
    }
    if (n == 1)
        ui->textBrowser->setText(_input + " is a happy number !");
    else
        ui->textBrowser->setText(_input + " is not a happy number");
}

void happyNumber::setInput(const QString& in)
{
    _input = in;
    ui->computeButton->setEnabled(_isNumber());
}

void happyNumber::on_numberInput_textChanged(const QString &text)
{
    setInput(text);
}

void happyNumber::on_computeButton_clicked()
{
    compute();
}