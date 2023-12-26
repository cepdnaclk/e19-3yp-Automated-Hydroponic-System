
// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"
#include "float_sensor.h"


const int phAdd = 32;  // declaring increasing ph pump
const int phMinus = 31;  // declaring decreasing ph pump
const int nutrientAdd = 30;  // declaring increasing nutrient pump


void activatePumps() {
    if (tdsValue <= tdslow && phValue >= phHigh) {
        digitalWrite(phMinus, HIGH);
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
        digitalWrite(phMinus, LOW);
        digitalWrite(nutrientAdd, LOW);
    } else if (tdsValue <= tdslow && phValue <= phLow) {
        digitalWrite(phAdd, HIGH);
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
        digitalWrite(phAdd, LOW);
        digitalWrite(nutrientAdd, LOW);
    } else if (phValue >= phHigh) {
        digitalWrite(phMinus, HIGH);
        delay(2000);
        digitalWrite(phMinus, LOW);
    } else if (phValue <= phLow) {
        digitalWrite(phAdd, HIGH);
        delay(2000);
        digitalWrite(phAdd, LOW);
    } else if (tdsValue <= tdslow) {
        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
        digitalWrite(nutrientAdd, LOW);
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
    pinMode(waterPump,OUTPUT);
    pinMode(waterPump, HIGH);
    connectAWS();
    subscribeToTopic(PH_VALUE_TOPIC);
    subscribeToTopic(WATER_PUMP_TOPIC);
    subscribeToTopic(TDS_VALUE_TOPIC);
    
    
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




