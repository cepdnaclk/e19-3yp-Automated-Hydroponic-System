#include <Arduino.h>
#include "utils.h"
#include <PubSubClient.h>
 




void setup() {
    Serial.begin(115200);
    connectAWS();
}

void loop() {
  int metricsValue = random(1, 100);
  Serial.print(F(" metrics: "));
  Serial.print(metricsValue);

  publishMessage(metricsValue);
  client.loop();
  delay(1000);
}
