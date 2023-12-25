
// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"
#include "float_sensor.h"
#include "pumps.h"

const int phAdd = 32;  // declaring increasing ph pump
const int phMinus = 31;  // declaring decreasing ph pump
const int nutrientAdd = 30;  // declaring increasing nutrient pump

void activatePumps() {
    if (tdsValue <= 700 && phValue >= 6.6) {
        digitalWrite(phMinus, HIGH);
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
    } else if (tdsValue <= 700 && phValue <= 4.5) {
        digitalWrite(phAdd, HIGH);
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
    } else if (phValue >= 6.6) {
        digitalWrite(phMinus, HIGH);
        delay(2000);
    } else if (phValue <= 4.5) {
        digitalWrite(phAdd, HIGH);
        delay(2000);
    } else if (tdsValue <= 700) {
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
    } else {
        digitalWrite(phAdd, LOW);
        digitalWrite(phMinus, LOW);
        digitalWrite(nutrientAdd, LOW);
    }
}

void setup() {
    Serial.begin(115200);
    pinMode(TdsSensorPin,INPUT);
    pinMode(phSensorPin,INPUT);
    pinMode(floatSensorPin,INPUT_PULLUP);
    pinMode(phAdd,OUTPUT);
    pinMode(phMinus,OUTPUT);
    pinMode(nutrientAdd,OUTPUT);
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
  activatePumps();
  delay(2000);
}




