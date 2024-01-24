package com.group15.AutomatedHydroponicsSystem.mqtt.utils;

import com.amazonaws.services.iot.client.AWSIotException;
import com.amazonaws.services.iot.client.AWSIotMqttClient;
import com.amazonaws.services.iot.client.AWSIotQos;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.MyMessage;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.MyTopic;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {

    String clientEndpoint = "a398am5o3vbqfl-ats.iot.ap-south-1.amazonaws.com";
    String clientId = "Test_client";
    String awsAccessKeyId ="AKIATY6FSZD72T45UQXE";
    String awsSecretAccessKey = "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";
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

    public String disconncetFromIoT() throws AWSIotException {
        client = new AWSIotMqttClient(clientEndpoint, clientId, awsAccessKeyId, awsSecretAccessKey, null);
        client.disconnect();
        System.out.println("Disconnected from IoT");

        return "Disconnected from IoT device successfully.";
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
