/* Functions for float sensor */

#include <Arduino.h>

// Declare variables for float sensor
int floatSensorPin = 33;
int buttonState = 1;
float floatSensorValue;

// Declare a function to get the float sensor value
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