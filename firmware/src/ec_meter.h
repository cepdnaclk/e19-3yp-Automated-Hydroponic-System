#include <Arduino.h>

const int TdsSensorPin  = 33;

unsigned long int avgvalue;
float tdsValue;
int tbuf[10], ttemp;

void checkTdsValue() {
      
      for (int i = 0; i < 10; i++) {  
  
          tbuf[i] = analogRead(TdsSensorPin);
          delay(10);  // Delay 10ms
          
      }
  
      for (int i = 0; i < 9; i++) {
  
          for (int j = i + 1; j < 10; j++) {
  
              if (tbuf[i] > tbuf[j]) {
  
                  ttemp = tbuf[i];
                  tbuf[i] = tbuf[j];
                  tbuf[j] = ttemp;
  
              }
          }
      }
  
      avgvalue = 0;  // a temporary parameter for the ph readings
  
      for (int i = 2; i < 8; i++) {
  
          avgvalue += tbuf[i];
  
      }
  
      avgvalue /= 6;  // get the average value of the 6 center samples
  
      tdsValue = (avgvalue * 5.0 / 1024);  // convert the analog into volt

      tdsValue = tdsValue * 236;
  
        // convert the volt into ph value
}