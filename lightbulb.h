#ifndef LIGHTBULB_H
#define LIGHTBULB_H

#include <QObject>
#include <QDebug>

class LightBulb : public QObject {
    Q_OBJECT

    Q_PROPERTY(int intensity READ intensity NOTIFY intensityChanged)
    Q_PROPERTY(Mode currentMode READ mode NOTIFY modeChanged)
    Q_PROPERTY(Color colorTemp READ colorTemp NOTIFY colorTempChanged)

public:
    enum class Mode {Off, On};
    Q_ENUM(Mode)
    enum class Color {Warm, Cold, Mixed};
    Q_ENUM(Color)

    static constexpr int MaxIntensity = 100;
    static constexpr int MinIntensity = 20;
    static constexpr int IntensityStep = 10;

    explicit LightBulb(QObject *parent = nullptr);

    int intensity() const;
    Mode mode() const;
    Color colorTemp() const;

signals:
    void intensityChanged();
    void modeChanged();
    void colorTempChanged();

public slots:
    void toggle();
    void changeColor();
    void intensityUp();
    void intensityDown();

private:
    Mode m_currentMode;
    Color m_currentColor;
    int m_intensity;
};

#endif // LIGHTBULB_H


