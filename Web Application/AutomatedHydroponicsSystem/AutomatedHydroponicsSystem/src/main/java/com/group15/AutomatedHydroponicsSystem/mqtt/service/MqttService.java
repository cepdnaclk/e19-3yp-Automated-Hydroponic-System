package com.group15.AutomatedHydroponicsSystem.mqtt.service;

import com.amazonaws.services.iot.client.AWSIotException;
import com.group15.AutomatedHydroponicsSystem.mqtt.utils.MqttConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MqttService {

    @Autowired
    private MqttConfig mqttConfig;


    public void publishMessageToTopic(Object payLoad, String topic) throws AWSIotException, InterruptedException {
        mqttConfig.publishData(payLoad,topic);
    }

    public void suscribeToTopic(String topic) throws AWSIotException {
        mqttConfig.subscribeToTopic(topic);
    }
}
