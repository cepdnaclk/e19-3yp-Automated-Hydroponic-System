#include <Arduino.h>

const int VoltageSensorPin1 = 34;
const int VoltageSensorPin2 = 32;
float correctionfactor = 1.1;
float vout1 = 0.0;
float vout2 = 0.0;
float vin1 = 0.0;
float vin2 = 0.0;
float R1 = 30000.0;
float R2 = 7500.0;
int value1 = 0;
int value2 = 0;

void checkVoltageLevel() {
    value1 = analogRead(VoltageSensorPin1);
    value2 = analogRead(VoltageSensorPin2);
    vout1 = (value1 * 5) / 4095.0;
    vout2 = (value2 * 5) / 4095.0;
    vin1 = vout1 / (R2 / (R1 + R2));
    vin2 = vout2 / (R2 / (R1 + R2));
    vin1 = vin1 - correctionfactor;
    vin2 = vin2 - correctionfactor;
    Serial.print("Voltage1: ");
    Serial.println(vin1);
    Serial.print("Voltage2: ");
    Serial.println(vin2);
    delay(1000);
}