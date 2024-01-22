package com.group15.AutomatedHydroponicsSystem.mqtt.dto;

import com.amazonaws.services.iot.client.AWSIotException;
import com.amazonaws.services.iot.client.AWSIotMessage;
import com.amazonaws.services.iot.client.AWSIotQos;
import com.amazonaws.services.iot.client.AWSIotTopic;
import com.group15.AutomatedHydroponicsSystem.mqtt.Topics;
import com.group15.AutomatedHydroponicsSystem.mqtt.service.MqttService;
import org.springframework.beans.factory.annotation.Autowired;
import org.json.JSONObject;



public class MyTopic extends AWSIotTopic {

    //static variables to store the received data
    public  static double pHData ;
    public static double tdsData;
    public static double floatSensorData;
    public static double phpumpData;
    public static double phlowpumpData;
    public static double tdspumpData;
    public static double phhigherrorData;
    public static double phlowerrorData;
    public static double tdserrorData;
    public static double phsensorerrorData;
    public static double tdssensorerrorData;

    public static int  phPumpCount = 0;
    public static int phLowPumpCount = 0;
    public static int tdsPumpCount = 0;

    @Autowired
    private MqttService service;


    public MyTopic(String topic, AWSIotQos qos) {
        super(topic, qos);
    }

    @Override
    public void onMessage(AWSIotMessage message) {
        // called when a message is received
        String receivedData = new String(message.getPayload());
        String receivedTopic = message.getTopic();
        System.out.println("The data received is: " + receivedData + " from the topic: " + receivedTopic);
        JSONObject jsonData = new JSONObject(receivedData);

        switch (receivedTopic) {
            case Topics.phsensorTopic -> {
                pHData = jsonData.getDouble("ph");
                System.out.println("PH value : " + pHData);
            }
            case Topics.phlowpumpTopic -> {
                phlowpumpData = jsonData.getDouble("phlowpumpstate");
                System.out.println("PH pump state : " + phlowpumpData);
                if (phlowpumpData == 1) {
                    phLowPumpCount++;
                    System.out.println("The acid pump is on"); // Display it on the page
                } else {
                    System.out.println("The acid pump is off");
                }

                if(phLowPumpCount == 30){
                    System.out.println("Acidic liquid container is going to empty! REFILL IT.");
                } else if (phLowPumpCount == 40) {
                    System.out.println("ALERT!!! Acidic liquid container is emptied"); // reset the count to 0 by clicking a button after refilling it
                    System.out.println("The acidic liquid pump is OFF");

                    try {
                        service.publishMessageToTopic(0,"phlowpumpBack"); // To save the pump from air drying
                    } catch (AWSIotException | InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
            case Topics.phpumpTopic -> {
                phpumpData = jsonData.getDouble("phhighpumpstate");
                if (phpumpData == 1) {
                    phPumpCount++;
                    System.out.println("The count : " + phPumpCount);
                    System.out.println("The base pump is on"); // Display it on the page
                } else {
                    System.out.println("The base pump is off");
                }

                if(phPumpCount == 5){
                    System.out.println("Base liquid container is going to empty! REFILL IT.");
                } else if (phPumpCount == 10) {
                    System.out.println("ALERT!!! Base liquid container is emptied"); // reset the count to 0 by clicking a button after refilling it
                    System.out.println("The base liquid pump is OFF");

                    try {
                        service.publishMessageToTopic(0,"phpumpBack"); // To save the pump from air drying
                    } catch (AWSIotException | InterruptedException e) {
                        throw new RuntimeException(e);
                    }

                }
            }
            case Topics.phhigherrorTopic -> {
                phhigherrorData = jsonData.getDouble("phhigherror");
            }
            case Topics.phlowerrorTopic -> {
                phlowerrorData = jsonData.getDouble("phlowerror");
            }
            case Topics.phsensorerrorTopic -> {
                phsensorerrorData = jsonData.getDouble("phsensorerror");
                if (phsensorerrorData == 1) {
                    System.out.println("The ph sensor is not working properly."); // Alert the user
                }
            }

            case Topics.tdssensorTopic -> {
                tdsData = jsonData.getDouble("tds");
            }
            case Topics.tdspumpTopic -> {
                tdspumpData = jsonData.getDouble("tdspumpstate");
                if (tdspumpData == 1) {
                    tdsPumpCount++;
                    System.out.println("The tds pump is on"); // Display it on the page
                } else {
                    System.out.println("The tds pump is off");
                }

                if(tdsPumpCount == 30){
                    System.out.println("Nutrient container is going to empty! REFILL IT.");
                } else if (tdsPumpCount == 40) {
                    System.out.println("ALERT!!! Nutrient container is emptied"); // reset the count to 0 by clicking a button after refilling it
                    System.out.println("The tds pump is OFF");

                    try {
                        service.publishMessageToTopic(0,"tdspumpBack"); // To save the pump from air drying
                    } catch (AWSIotException | InterruptedException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
            case Topics.tdserrorTopic -> {
                tdserrorData = jsonData.getDouble("tdserror");
            }
            case Topics.tdssensorerrorTopic -> {
                tdssensorerrorData = jsonData.getDouble("tdssensorerror");
                if (tdssensorerrorData == 1) {
                    System.out.println("The tds sensor is not working properly."); // Alert the user
                }
            }
            case Topics.floatsensorTopic -> {
                floatSensorData = jsonData.getDouble("float");
            }

            default -> System.out.println("Received data not relevant to this device.");
        }

    }

 }
