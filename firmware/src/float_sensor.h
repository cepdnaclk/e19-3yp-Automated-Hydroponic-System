#include <Arduino.h>

int floatSensorPin = 33;
int buttonState = 1;
float floatSensorValue;

void checkFloatSensor() {
    buttonState = digitalRead(floatSensorPin);

    if (buttonState == LOW) {
        Serial.println("Water level is low");
        floatSensorValue = 0.0;
    } else {
        Serial.println("Water level is high");
        floatSensorValue = 1.0;
    }
}