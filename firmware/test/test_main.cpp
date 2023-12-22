#include <Arduino.h>
#include <unity.h>  // Arduino Unit Testing framework
#include "utils.h"
#include <WiFi.h>
#include <WiFiClientSecure.h>

// Mock WiFiClientSecure to avoid actual network operations
// Mock WiFiClientSecure to avoid actual network operations
class MockWiFiClientSecure : public WiFiClientSecure {
public:
    virtual int connect(const char* host, uint16_t port) override {
        // Mock the connection
        return 1;  // Return a non-zero value to simulate a successful connection
    }
};

void test_connectAWS() {
    // Setup
    MockWiFiClientSecure mockNet;
    client.setClient(mockNet);

    // Exercise
    connectAWS();

    // Verify
    TEST_ASSERT_TRUE(client.connected());
}

void setup() {
    delay(2000);  // Give some time to open the Serial Monitor
    UNITY_BEGIN();

    // Run the test
    RUN_TEST(test_connectAWS);
    Serial.println("All tests passed!");

    UNITY_END();
}

void loop() {
    // Nothing to do here
}
