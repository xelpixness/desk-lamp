#include "lightbulb.h"

LightBulb::LightBulb(QObject *parent)
    : QObject{parent}, m_currentMode(Mode::Off), m_currentColor(Color::Warm), m_intensity(100)
{}

void LightBulb::toggle() {
    m_currentMode = (m_currentMode == Mode::Off) ? Mode::On : Mode::Off;
    emit modeChanged();
}

int LightBulb::intensity() const {
    return m_intensity;
}

LightBulb::Mode LightBulb::mode() const {
    return m_currentMode;
}

LightBulb::Color LightBulb::colorTemp() const {
    return m_currentColor;
}

void LightBulb::intensityUp() {
    if (this->m_intensity >= MaxIntensity || m_currentMode == Mode::Off) return;
    this->m_intensity += IntensityStep;

    emit intensityChanged();
}

void LightBulb::intensityDown() {
    if (this->m_intensity <= MinIntensity || m_currentMode == Mode::Off) return;
    this->m_intensity -= IntensityStep;

    emit intensityChanged();
}

void LightBulb::changeColor() {
    if (m_currentMode == Mode::Off) return;
    switch (m_currentColor) {
    case Color::Warm: this->m_currentColor = Color::Cold; break;
    case Color::Cold: this->m_currentColor = Color::Mixed; break;
    case Color::Mixed: this->m_currentColor = Color::Warm; break;
    }

    emit colorTempChanged();
}








