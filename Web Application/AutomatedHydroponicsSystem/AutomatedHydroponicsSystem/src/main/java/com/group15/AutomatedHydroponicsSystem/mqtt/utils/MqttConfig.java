package com.group15.AutomatedHydroponicsSystem.mqtt.utils;

import com.amazonaws.services.iot.client.AWSIotException;
import com.amazonaws.services.iot.client.AWSIotMqttClient;
import com.amazonaws.services.iot.client.AWSIotQos;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.MyMessage;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.MyTopic;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {

    String clientEndpoint = "a398am5o3vbqfl-ats.iot.ap-south-1.amazonaws.com";
    String clientId = "Test_client";
    String awsAccessKeyId ="YOUR_ACCESS_KEY";
    String awsSecretAccessKey = "YOUR_SECRET_ACCESS_KEY";
    AWSIotMqttClient client = null;

    public String connectToIoT() throws AWSIotException, InterruptedException {
            client = new AWSIotMqttClient(clientEndpoint, clientId, awsAccessKeyId, awsSecretAccessKey, null);
            client.connect();
            System.out.println("Connected to IoT");
//            Thread.sleep(10000);
//            client.disconnect();
//        System.out.println("Disconnected from IoT");
            return "Connected to IoT device successfully.";
    }

    public void disconncetFromIoT() throws AWSIotException {
        client.disconnect();
        System.out.println("Disconnected from IoT");
    }


    public void publishFloatData(float payLoad, String topic) {
        AWSIotQos qos = AWSIotQos.QOS1;
        long timeout = 3000;

        try {
            MyMessage message = new MyMessage(topic,qos, String.valueOf(payLoad));
            client.publish(message,timeout);
        } catch (AWSIotException e) {
            throw new RuntimeException(e);
        }
    }

    public void subscribeToTopic(String topicName) throws AWSIotException {
        AWSIotQos qos = AWSIotQos.QOS1;

        MyTopic topic = new MyTopic(topicName, qos);
        client.subscribe(topic);
        System.out.println("Hello, User You subscribed a topic");
    }
}
