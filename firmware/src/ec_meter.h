#include <Arduino.h>
#include "GravityTDS.h"
// Initializing pins for EC sensor
const int ecSensorPin = 34;
const int ecSensorPowerPin = 32;
const int ecSensorGroundPin = 33;

// Declaring variables for EC sensor
int R1 = 1000;  // 
int Ra = 25;  // Resistance of powering Pins

float EC = 0;  // Declaring variable for EC-value
float EC25 = 0;  // EC value at 25°C
float K = 1.44;  // trail measured coefficient
float TemperatureCoef = 0.019;  // temperature coefficient

float raw = 0;  // The raw data from a EC-sensor reading is delared to this variable
float Vin = 5;  // The initial voltage supply from Arduino uno to a analog pin
float Vdrop = 0;  // The voltage drop when current flows through the water
float Rc = 0;  // The voltage of the water solvent

// Estimates  Resistance of Liquid

void checkEcValue() {
    digitalWrite(ecSensorPowerPin, HIGH);  // Setting the power pin for EC sensor
}