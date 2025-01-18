#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "lightbulb.h"
#include <QObject>
#include <QDebug>

class Controller : public QObject {
    Q_OBJECT
public:
    explicit Controller(LightBulb& bulb, QObject *parent = nullptr);

    enum class Command {TOGGLE, UP, DOWN, CHANGE};
    Q_ENUM(Command)

    Q_INVOKABLE void handleInput(Command input);

signals:

private:
    LightBulb& lightBulb;
};

#endif // CONTROLLER_H
