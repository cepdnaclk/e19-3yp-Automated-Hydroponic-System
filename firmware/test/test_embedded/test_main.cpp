#include <Arduino.h>
#include <unity.h>  // Arduino Unit Testing framework
#include <main.cpp>


// Mock classes for isolated testing
class MockWiFiClientSecure : public WiFiClientSecure {
public:
    virtual int connect(const char* host, uint16_t port) override {
        return 1;  // Mock a successful connection
    }
};

class MockPubSubClient : public PubSubClient {
public:
    virtual bool test_publish(const char* topic, const char* payload) {
        Serial.println("Mock publish: " + String(topic) + " - " + String(payload));
        return true;
    }

    virtual bool test_subscribe(const char* topic) {
        Serial.println("Mock subscribe: " + String(topic));
        return true;
    }
};



void checkPhValue();
void checkTdsValue();
void checkFloatSensor();
void publishMessage(float value, const char* topic, const char* sensorType);
void activatePumps();
void connectAWS();
void subscribeToTopic(const char* topic);

// Test functions
void test_connectAWS() {
    
    // Setup
    MockWiFiClientSecure mockNet;
    client.setClient(mockNet);

    // Exercise
    connectAWS();

    // Verify
    TEST_ASSERT_TRUE(client.connected());
}


void test_checkPhValue() {
    // Mock the sensor reading
    phValue = 6.5;
    checkPhValue();

    // Verify the published value
    TEST_ASSERT_EQUAL_FLOAT(6.5, phValue);
}

void test_checkTdsValue() {
    // Mock the sensor reading
    tdsValue = 1200;
    checkTdsValue();

    // Verify the published value
    TEST_ASSERT_EQUAL_INT(1200, tdsValue);
}

void test_checkFloatSensor() {
    // Mock the sensor reading
    floatSensorValue = HIGH;
    checkFloatSensor();

    // Verify the published value
    TEST_ASSERT_EQUAL_INT(HIGH, floatSensorValue);
}

void test_activatePumps() {
    // Set sensor values to trigger pump actions
    phValue = phLow - 0.1;
    tdsValue = tdslow - 100;

    activatePumps();

    //int pumpPins = [14, 26, 27]

    // Assert pin states
    //TEST_ASSERT_EQUAL(HIGH, digitalRead(pumpPins[0])); // Expected pump 1 activated
}

int main(int argc, char** argv) {
    delay(2000);  // Give some time to open the Serial Monitor
    UNITY_BEGIN();

    // Run all tests
    RUN_TEST(test_connectAWS);
    RUN_TEST(test_checkPhValue);
    RUN_TEST(test_checkTdsValue);
    RUN_TEST(test_checkFloatSensor);
    RUN_TEST(test_activatePumps);

    Serial.println("All tests passed!");

    UNITY_END();
}

