#include <Arduino.h>
#include "certs.h"
#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include <WiFiClientSecure.h>
#include <WiFiManager.h>

/* Define publish and subscribe topics */
#define AWS_IOT_PUBLISH_TOPIC   "esp32pub"
#define AWS_IOT_SUBSCRIBE_TOPIC "esp32sub"
#define PH_SENSOR_TOPIC "phsensor"
#define TDS_SENSOR_TOPIC "tdssensor"
#define FLOAT_SENSOR_TOPIC "floatsensor"
#define WATER_PUMP_TOPIC "waterpump"
#define PH_HIGH_TOPIC "phhigh"
#define TDS_VALUE_TOPIC "tdsvalue"
#define PH_LOW_TOPIC "phlow"
#define PH_HIGH_PUMP_TOPIC "phpump"
#define PH_LOW_PUMP_TOPIC "phlowpump"
#define TDS_PUMP_TOPIC "tdspump"
#define PH_HIGH_ERROR_TOPIC "phhigherror"
#define PH_LOW_ERROR_TOPIC "phlowerror"
#define TDS_ERROR_TOPIC "tdserror"
#define PH_SENSOR_ERROR_TOPIC "phsensorerror"
#define TDS_SENSOR_ERROR_TOPIC "tdssensorerror"



float message;
float phHigh;
float phLow;
float tdslow;
int button;
const int waterPump = 25;

WiFiClientSecure net = WiFiClientSecure();
PubSubClient client(net);

void messageHandler(char* topic, byte* payload, unsigned int length) {

    Serial.print(" Incoming: ");
    Serial.println(topic);

    StaticJsonDocument<200> doc;
    deserializeJson(doc, payload);
    message = doc["message"];
    Serial.print(message);

    if ((strcmp(topic, PH_HIGH_TOPIC) == 0) && (message > 0)) {

        phHigh = message;
      
    } else if ((strcmp(topic, PH_LOW_TOPIC) == 0) && (message > 0)) {

            phLow = message;

    } else if ((strcmp(topic, TDS_VALUE_TOPIC) == 0) && (message > 0)) {

            tdslow = message;
      
    } else if (strcmp(topic, WATER_PUMP_TOPIC) == 0) {

        if (message < 1) {

            
            button = message;

        } else {

            
            button = 1;

        } 

    } else {

        Serial.println("Invalid topic");

    }
    
}

void connectAWS() {

    WiFi.mode(WIFI_STA);
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

    Serial.println("Connecting to Wi-Fi");

    while (WiFi.status() != WL_CONNECTED) {

        delay(500);
        Serial.print(".");

    }

    // Configure WiFiClientSecure to use the AWS IoT device credentials
    net.setCACert(AWS_CERT_CA);
    net.setCertificate(AWS_CERT_CRT);
    net.setPrivateKey(AWS_CERT_PRIVATE);

    // Connect to the MQTT broker on the AWS endpoint we defined earlier
    client.setServer(AWS_IOT_ENDPOINT, 8883);

    

    Serial.println("Connecting to AWS IOT");

    while (!client.connect(THINGNAME)) {

        Serial.print(".");
        delay(100);

    }

    if (!client.connected()) {

        Serial.println("AWS IoT Timeout!");
        return;

    }

    // Subscribe to a topic
    //client.subscribe(topic);

    Serial.println("AWS IoT Connected!");

}

void publishMessage(float sensorValue, const char* topic, const char* dataName) {

  StaticJsonDocument<200> doc;
  doc[dataName] = sensorValue;

  char jsonBuffer[512];
  serializeJson(doc, jsonBuffer);
 
  client.publish(topic, jsonBuffer);

}

void subscribeToTopic(const char* topic) {

    // Create a message handler
    client.setCallback(messageHandler);
    client.subscribe(topic);
    
}



