// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
 
// initializing pins for the relay boards controlling the pumps
const int waterPumpPin = 23;
const int nutrientPumpPin = 22;
const int pHDownPumpPin = 21;
const int pHUpPumpPin = 19;

// Initializing pins for EC sensor
const int ecSensorPin = 34;
const int ecSensorPowerPin = 32;
const int ecSensorGroundPin = 33;

// Declaring variables for EC sensor
int R1 = 1000;  // 
int Ra = 25;  // Resistance of powering Pins

float EC = 0;  // Declaring variable for EC

void setup() {
    Serial.begin(115200);
    connectAWS(PH_SENSOR_TOPIC);
}

void loop() {
  checkPhValue();
  Serial.print(F(" ph: "));
  
  Serial.print(phValue);

  
  publishMessage(phValue, PH_SENSOR_TOPIC, "ph");
  client.loop();
  delay(2000);
}
