#include "controller.h"

Controller::Controller(LightBulb &bulb, QObject *parent)
: QObject{parent}, lightBulb(bulb)
{}


void Controller::handleInput(Command input) {
    qDebug() << input;
    switch(input) {
    case Controller::Command::TOGGLE:
        lightBulb.toggle();
        break;
    case Controller::Command::CHANGE:
        lightBulb.changeColor();
        break;
    case Controller::Command::DOWN:
        lightBulb.intensityDown();
        break;
    case Controller::Command::UP:
        lightBulb.intensityUp();
        break;
    default:
        qDebug() << "bad input!";
        break;
    }
}
