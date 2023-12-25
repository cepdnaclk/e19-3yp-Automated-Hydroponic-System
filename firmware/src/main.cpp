
// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"
#include "float_sensor.h"


void setup() {
    Serial.begin(115200);
    pinMode(TdsSensorPin,INPUT);
    pinMode(phSensorPin,INPUT);
    pinMode(floatSensorPin,INPUT_PULLUP);
    connectAWS(PH_SENSOR_TOPIC);
}

void loop() {
  checkPhValue();
  Serial.print(F(" ph: "));
  
  Serial.println(phValue);
  checkTdsValue();
  checkFloatSensor();
  publishMessage(phValue, PH_SENSOR_TOPIC, "ph");
  publishMessage(tdsValue, TDS_SENSOR_TOPIC, "tds");
  publishMessage(floatSensorValue, FLOAT_SENSOR_TOPIC, "float");
  client.loop();
  delay(2000);
}




