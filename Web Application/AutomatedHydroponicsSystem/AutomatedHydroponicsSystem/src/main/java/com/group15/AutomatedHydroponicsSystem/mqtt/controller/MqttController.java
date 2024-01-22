package com.group15.AutomatedHydroponicsSystem.mqtt.controller;


import com.amazonaws.services.iot.client.AWSIotException;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.MyTopic;
import com.group15.AutomatedHydroponicsSystem.mqtt.dto.SelectedPlantIDListDTO;
import com.group15.AutomatedHydroponicsSystem.mqtt.service.MqttService;
import com.group15.AutomatedHydroponicsSystem.mqtt.utils.MqttConfig;
import com.group15.AutomatedHydroponicsSystem.plants.Plant;
import com.group15.AutomatedHydroponicsSystem.plants.PlantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/auth")
public class MqttController {

    @Autowired
    private MqttService service;

    @Autowired
    private PlantRepository repository;

    @Autowired
    private MqttConfig  mqttConfig;
    @Autowired
    private SelectedPlantIDListDTO selectedPlantIDList;


    @PostMapping("/connect-iot")
    public void connectToIoT() throws AWSIotException, InterruptedException {
        mqttConfig.connectToIoT();
    }
    @GetMapping("/select-plant")
    public String selectPlants(@RequestParam int id) {
        Optional<Plant> optionalPlant = Optional.ofNullable(repository.findById(id));

        if (optionalPlant.isPresent()) {
            Plant plant = optionalPlant.get();

            float tdsLow = plant.getTdsLow();
            float tdsHigh = plant.getTdsHigh();
            float pHLow = plant.getPhLow();
            float pHHigh = plant.getPhHigh();
            float waterPump = 1; // write a method for boolean

            try {
                service.publishMessageToTopic(tdsLow, "tdsvalue");
                service.publishMessageToTopic(tdsHigh, "tdsvalue");
                service.publishMessageToTopic(pHLow, "phlow");
                service.publishMessageToTopic(pHHigh, "phhigh");
                service.publishMessageToTopic(waterPump,"waterpump"); // write a method for boolean

                return "Plant selection successful.";
            } catch (AWSIotException | InterruptedException e) {
                // Handle the AWSIotException, e.g., log the error or return an error message
                return "Failed to publish messages to AWS IoT. Reason: " + e.getMessage();
            }
        } else {
            return "Plant not found with ID: " + id;
        }
    }

    @GetMapping("/selected_plants")
    public String selectPlantsByIdList(@RequestBody SelectedPlantIDListDTO plantIDList) {
        List<Integer> plantIDs = plantIDList.getPlantIDs();

        if (plantIDs == null || plantIDs.isEmpty()) {
            return "No plants selected.";
        }

        Optional<Plant> firstPlant = repository.findById(plantIDs.get(0));

        if (firstPlant.isEmpty()) {
            return "Plant with ID " + plantIDs.get(0) + " not found.";
        }

        int lengthOfList = plantIDs.size();
        float pHLow = firstPlant.get().getPhLow();
        float pHHigh = firstPlant.get().getPhHigh();
        float tdsLow = firstPlant.get().getTdsLow();
        float tdsHigh = firstPlant.get().getTdsHigh();
        float waterPump = 1; // Call a method for boolean

        Plant currentPlant;

        for (int i = 1; i < lengthOfList; i++) {
            currentPlant = repository.findById(plantIDs.get(i)).orElse(null);

            if (currentPlant != null) {
                float pHLowCurrent = currentPlant.getPhLow();
                float pHHighCurrent = currentPlant.getPhHigh();
                float tdsLowCurrent = currentPlant.getTdsLow();
                float tdsHighCurrent = currentPlant.getTdsHigh();

                if (pHLowCurrent > pHLow) {
                    pHLow = pHLowCurrent;
                }
                if (tdsLowCurrent > tdsLow) {
                    tdsLow = tdsLowCurrent;
                }
                if (pHHighCurrent < pHHigh) {
                    pHHigh = pHHighCurrent;
                }
                if (tdsHighCurrent < tdsHigh) {
                    tdsHigh = tdsHighCurrent;
                }
            }
        }

        try {
            service.publishMessageToTopic(tdsLow, "tdsvalue");
            service.publishMessageToTopic(tdsHigh, "tdshigh");
            service.publishMessageToTopic(pHLow, "phlow");
            service.publishMessageToTopic(pHHigh, "phhigh");
            service.publishMessageToTopic(waterPump, "waterpump"); // Call a method for boolean

            return "Plants selection successful.";
        } catch (AWSIotException | InterruptedException e) {
            // Handle the AWSIotException, e.g., log the error or return an error message
            return "Failed to publish messages to AWS IoT. Reason: " + e.getMessage();
        }
    }



    @GetMapping("/subscribeToTopics")
    public String subscribeToTopics() throws AWSIotException, InterruptedException {

        // sensor data readings
        service.suscribeToTopic("phsensor");
        service.suscribeToTopic("tdssensor");
        service.suscribeToTopic("floatsensor");

        //pump states
        service.suscribeToTopic("phpump");
        service.suscribeToTopic("phlowpump");
        service.suscribeToTopic("tdspump");

        //Error states of pumps
        service.suscribeToTopic("phhigherror");
        service.suscribeToTopic("phlowerror");
        service.suscribeToTopic("tdserror");

        //Error states of sensors
        service.suscribeToTopic("phsensorerror");
        service.suscribeToTopic("tdssensorerror");



        System.out.println("The topics are subscribed");
        return "The topics are subscribed";

    }

    @GetMapping("/get-ph-data")
    public double get_pH_Data() {
        System.out.println("The received ph data: " + MyTopic.pHData);
        return MyTopic.pHData;
    }

    @GetMapping("/get-tds-data")
    public double get_tds_Data() {
        System.out.println("The received tds data: " + MyTopic.tdsData);
        return MyTopic.tdsData;
    }

    @GetMapping("/get-floatSensor-data")
    public double get_floatSensor_data() {
        System.out.println("The received float sensor data: " + MyTopic.floatSensorData);
        return MyTopic.floatSensorData;
    }

    @GetMapping("/get-phpump-data")
    public double get_phpump_data() {
        System.out.println("The received ph pump data: " + MyTopic.phpumpData);
        return MyTopic.phpumpData;
    }

    @GetMapping("/get-phlowpump-data")
    public double get_phlowpump_data() {
        System.out.println("The received ph low pump data: " + MyTopic.phlowpumpData);
        return MyTopic.phlowpumpData;
    }

    @GetMapping("/get-tdspump-data")
    public double get_tdspump_data() {
        System.out.println("The received tds pump data: " + MyTopic.tdspumpData);
        return MyTopic.tdspumpData;
    }

    @GetMapping("/get-phsensorerror-data")
    public double get_phsensorerror_data() {
        System.out.println("The received ph sensor error data: " + MyTopic.phsensorerrorData);
        return MyTopic.phsensorerrorData;
    }

    @GetMapping("/get-tdssensorerror-data")
    public double get_tdssensorerror_data() {
        System.out.println("The received tds sensor error data: " + MyTopic.tdssensorerrorData);
        return MyTopic.tdssensorerrorData;
    }

    @GetMapping("/get-phlowerror-data")
    public double get_phlowerror_data() {
        System.out.println("The received ph low error data: " + MyTopic.phlowerrorData);
        return MyTopic.phlowerrorData;
    }

    @GetMapping("/get-phhigherror-data")
    public double get_phhigherror_data() {
        System.out.println("The received ph high error data: " + MyTopic.phhigherrorData);
        return MyTopic.phhigherrorData;
    }

    @GetMapping("/get-tdserror-data")
    public double get_tdserror_data() {
        System.out.println("The received tds error data: " + MyTopic.tdserrorData);
        return MyTopic.tdserrorData;
    }

}

