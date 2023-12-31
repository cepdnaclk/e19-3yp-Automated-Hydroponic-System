#include <Arduino.h>
#include "certs.h"
#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include <WiFiClientSecure.h>

/* Define publish and subscribe topics */
#define AWS_IOT_PUBLISH_TOPIC   "esp32pub"
#define AWS_IOT_SUBSCRIBE_TOPIC "esp32sub"
#define PH_SENSOR_TOPIC "phsensor"
#define TDS_SENSOR_TOPIC "tdssensor"
#define FLOAT_SENSOR_TOPIC "floatsensor"
#define WATER_PUMP_TOPIC "waterpump"
#define PH_VALUE_TOPIC "phvalue"
#define TDS_VALUE_TOPIC "tdsvalue"

float message;
float phHigh;
float phLow;
float tdslow;
int button = 1;
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

    if (strcmp(topic, PH_VALUE_TOPIC) == 0) {

        if (message > 0 && message < 9) {

            phLow = message;

        } else if (message > 9 && message < 14) {

            phHigh = message;

        } else {

            Serial.println("Invalid value");

        }

    } else if (strcmp(topic, TDS_VALUE_TOPIC) == 0) {

        if (message > 0 && message < 600) {

            tdslow = message;

        } else {

            Serial.println("Invalid value");

        }
    } else if (strcmp(topic, WATER_PUMP_TOPIC) == 0) {

        if (message == 1) {

            digitalWrite(waterPump, HIGH);
            button = 1;

        } else if (message == 0) {

            digitalWrite(waterPump, LOW);
            button = 0;

        } else {

            Serial.println("Invalid value");

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



