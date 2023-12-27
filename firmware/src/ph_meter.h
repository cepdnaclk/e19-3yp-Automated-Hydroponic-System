#include <Arduino.h>

// initializing pin for pH sensor
const int phSensorPin = 35;  // Declaring analog pin 32 to the pH-sensor probe

// Declaring variables for pH sensor
unsigned long int avgValue;  // Store the average value of the sensor feedback
float phValue;  // Storing the calculated pH reading in assigned to this variable
int buf[10], temp;  // Temporary variable used to sort the 10 pH reading samples

// Declare a function to get the pH sensor value
void checkPhValue() {
    
    // Get 10 sample value from the sensor for smooth value
    for (int i = 0; i < 10; i++) {  

        buf[i] = analogRead(phSensorPin);
        delay(10);  // Delay 10ms
        
    }

    // Sorting the analog from small to large
    for (int i = 0; i < 9; i++) {

        for (int j = i + 1; j < 10; j++) {

            if (buf[i] > buf[j]) {

                temp = buf[i];
                buf[i] = buf[j];
                buf[j] = temp;

            }
        }
    }

    avgValue = 0;  // a temporary parameter for the ph readings

    // take the sum of the 6 center samples
    for (int i = 2; i < 8; i++) {

        avgValue += buf[i];

    }

    avgValue /= 6;  // get the average value of the 6 center samples

    phValue = (avgValue * 5.0 / 1024);  // convert the analog into volt

    phValue = phValue / 2 - 2;  // convert the volt into ph value

}