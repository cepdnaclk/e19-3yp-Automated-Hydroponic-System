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
float tdson;
float phhighon;
float phlowon;
float phlowpumperror;
float phhighpumperror;
float tdspumperror;
float phError;
float tdsError;


// Declare a function to activate pumps
void activatePumps() {

    if (tdsValue <= tdslow) {

        digitalWrite(nutrientAdd, HIGH);
        tdson = 1;
        publishMessage(tdson, TDS_PUMP_TOPIC, "tdspumpstate");
        delay(1000);
        digitalWrite(nutrientAdd, LOW);
        
        if (tdsValue <= tdslow) {
            tdspumperror = 1;
            publishMessage(tdspumperror, TDS_ERROR_TOPIC, "tdserror");
        }
        

    } 

    if (phValue <= phLow) {

        digitalWrite(phAdd, HIGH);
        phlowon = 1;
        publishMessage(phlowon, PH_LOW_PUMP_TOPIC, "phlowpumpstate");
        delay(1000);
        digitalWrite(phAdd, LOW);  
        
        if (phValue <= phLow) {
            phlowpumperror = 1;
            publishMessage(phlowpumperror, PH_LOW_ERROR_TOPIC, "phlowerror");
        }

    }

    if (phValue >= phHigh) {

        digitalWrite(phMinus, HIGH);
        phhighon = 1;
        publishMessage(phhighon, PH_HIGH_PUMP_TOPIC, "phhighpumpstate");
        delay(1000);
        digitalWrite(phMinus, LOW);
        
        if (phValue >= phHigh) {
            phhighpumperror = 1;
            publishMessage(phhighpumperror, PH_HIGH_ERROR_TOPIC, "phhigherror");
        }
    } 

    if (button == 1) {
  
            digitalWrite(waterPump, LOW);

    } else {
            
                digitalWrite(waterPump, HIGH);
    }

    

    
    
}

// Declare the setup function
void setup() {

    Serial.begin(115200);

    pinMode(33,INPUT);
    pinMode(phSensorPin,INPUT);
    pinMode(floatSensorPin,INPUT_PULLUP);
    pinMode(phAdd,OUTPUT);
    pinMode(phMinus,OUTPUT);
    pinMode(nutrientAdd,OUTPUT);
    pinMode(waterPump,OUTPUT);
    digitalWrite(waterPump, HIGH);
    

    connectAWS();

    subscribeToTopic(PH_HIGH_TOPIC);
    subscribeToTopic(PH_LOW_TOPIC);
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
  Serial.print("Button: ");
  Serial.println(button);

  checkTdsValue();

  Serial.println(tdsValue);

  checkFloatSensor();

  publishMessage(phValue, PH_SENSOR_TOPIC, "ph");
  publishMessage(tdsValue, TDS_SENSOR_TOPIC, "tds");
  publishMessage(floatSensorValue, FLOAT_SENSOR_TOPIC, "float");
  

  client.loop();

  activatePumps();

  if (phHigh > 14 || phLow < 0) {
    phError = 1;
    publishMessage(phError, PH_SENSOR_ERROR_TOPIC, "phsensorerror");
  }

  if (tdslow < 0 || tdslow > 5000) {
    tdsError = 1;
    publishMessage(tdsError, TDS_SENSOR_ERROR_TOPIC, "tdssensorerror");
  }
  
  delay(10000);
  
} 