
// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"



void setup() {
    Serial.begin(115200);
    pinMode(TdsSensorPin,INPUT);
    connectAWS(PH_SENSOR_TOPIC);
}

void loop() {
  checkPhValue();
  Serial.print(F(" ph: "));
  
  Serial.println(phValue);
  checkTdsValue();
  publishMessage(phValue, PH_SENSOR_TOPIC, "ph");
  publishMessage(tdsValue, TDS_SENSOR_TOPIC, "tds");
  client.loop();
  delay(2000);
}




