// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"
 
// initializing pins for the relay boards controlling the pumps
const int waterPumpPin = 23;
const int nutrientPumpPin = 22;
const int pHDownPumpPin = 21;
const int pHUpPumpPin = 19;

void setup() {
    Serial.begin(115200);
    pinMode(ecSensorPin, INPUT);  // Setting pin mode for the input pin for the EC sensor probe
    pinMode(ecSensorPowerPin, OUTPUT);  // Setting pin mode for sourcing current
    pinMode(ecSensorGroundPin, OUTPUT);  // Setting grount level for the EC sensor probe
    R1 += Ra;  // Taking into account Powering Pin resistance
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
