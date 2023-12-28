// Libraries
#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
#include "ph_meter.h"
#include "ec_meter.h"
#include "float_sensor.h"

// Declare variables for ph range and tds range
const int phAdd = 27;  // declaring increasing ph pump
const int phMinus = 26;  // declaring decreasing ph pump
const int nutrientAdd = 14;  // declaring increasing nutrient pump


// Declare a function to activate pumps
void activatePumps() {

    if (tdsValue <= tdslow) {

        digitalWrite(nutrientAdd, HIGH);
        delay(2000);
        digitalWrite(nutrientAdd, LOW);

    } 

    if (phValue <= phLow) {

        digitalWrite(phAdd, HIGH);
        delay(2000);
        digitalWrite(phAdd, LOW);  

    }

    if (phValue >= phHigh) {

        digitalWrite(phMinus, HIGH);
        delay(2000);
        digitalWrite(phMinus, LOW);

    } 
    
}

// Declare the setup function
void setup() {

    Serial.begin(115200);

    pinMode(TdsSensorPin,INPUT);
    pinMode(phSensorPin,INPUT);
    pinMode(floatSensorPin,INPUT_PULLUP);
    pinMode(phAdd,OUTPUT);
    pinMode(phMinus,OUTPUT);
    pinMode(nutrientAdd,OUTPUT);
    pinMode(waterPump,OUTPUT);

    connectAWS();

    subscribeToTopic(PH_VALUE_TOPIC);
    subscribeToTopic(WATER_PUMP_TOPIC);
    subscribeToTopic(TDS_VALUE_TOPIC);
    
}

// Declare the loop function
void loop() {
    
  checkPhValue();
  Serial.println(phLow);
  Serial.println(phHigh);
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




