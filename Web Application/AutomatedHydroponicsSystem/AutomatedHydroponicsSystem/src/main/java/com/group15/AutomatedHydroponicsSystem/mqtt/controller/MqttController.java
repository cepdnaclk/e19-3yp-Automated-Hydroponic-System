package com.group15.AutomatedHydroponicsSystem.mqtt.controller;


import com.amazonaws.services.iot.client.AWSIotException;
import com.group15.AutomatedHydroponicsSystem.mqtt.DataVariables;
import com.group15.AutomatedHydroponicsSystem.mqtt.Topics;
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


    // To connect to iot
    @PostMapping("/connect-iot")
    public String connectToIoT() throws AWSIotException, InterruptedException {
        mqttConfig.connectToIoT();
        return "Connected to an IoT device successfully.";
    }

    // To disconnect from iot
    @PostMapping("/disconnect-iot")
    public String disconnectToIot() throws AWSIotException {
        mqttConfig.disconncetFromIoT();
        return "Disconnected from IoT device successfully.";
    }
//    @GetMapping("/select-plant")
//    public String selectPlants(@RequestParam int id) {
//        Optional<Plant> optionalPlant = Optional.ofNullable(repository.findById(id));
//
//        if (optionalPlant.isPresent()) {
//            Plant plant = optionalPlant.get();
//
//            float tdsLow = plant.getTdsLow();
//            float tdsHigh = plant.getTdsHigh();
//            float pHLow = plant.getPhLow();
//            float pHHigh = plant.getPhHigh();
//            float waterPump = 0; // write a method for boolean
//
//            try {
//                service.publishMessageToTopic(tdsLow, "tdsvalue");
//                service.publishMessageToTopic(tdsHigh, "tdsvalue");
//                service.publishMessageToTopic(pHLow, "phlow");
//                service.publishMessageToTopic(pHHigh, "phhigh");
//                service.publishMessageToTopic(waterPump,"waterpump"); // write a method for boolean
//
//                return "Plant selection successful.";
//            } catch (AWSIotException | InterruptedException e) {
//                // Handle the AWSIotException, e.g., log the error or return an error message
//                return "Failed to publish messages to AWS IoT. Reason: " + e.getMessage();
//            }
//        } else {
//            return "Plant not found with ID: " + id;
//        }
//    }



    // To send the common ph,tds ranges to iot
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
       // boolean waterPump = true; // Call a method for boolean

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
            service.publishMessageToTopic(tdsLow, Topics.tdsLow);
            service.publishMessageToTopic(tdsHigh, Topics.tdsHigh);
            service.publishMessageToTopic(pHLow, Topics.phLow);
            service.publishMessageToTopic(pHHigh, Topics.phHigh);

            return "Plants selection successful.";
        } catch (AWSIotException | InterruptedException e) {
            // Handle the AWSIotException, e.g., log the error or return an error message
            return "Failed to publish messages to AWS IoT. Reason: " + e.getMessage();
        }
    }

    @PostMapping("/publish-to-water-pump")
    public String publishToWaterPump(@RequestParam float pumpON) throws AWSIotException, InterruptedException {
        if (pumpON == 1) {
            service.publishMessageToTopic(pumpON, Topics.waterPump);
            return "Water pump turned on.";
        } else if (pumpON == 0) {
            service.publishMessageToTopic(pumpON, Topics.waterPump);
            return "Water pump turned off.";
        } else {
            return "Invalid input. Please provide 0 to turn off or 1 to turn on the water pump.";
        }
    }


    @GetMapping("/subscribeToTopics")
    public String subscribeToTopics() throws AWSIotException, InterruptedException {

        // sensor data readings
        service.suscribeToTopic(Topics.phsensorTopic);
        service.suscribeToTopic(Topics.tdssensorTopic);
        service.suscribeToTopic(Topics.floatsensorTopic);

        //pump states
        service.suscribeToTopic(Topics.phpumpTopic);
        service.suscribeToTopic(Topics.phlowpumpTopic);
        service.suscribeToTopic(Topics.tdspumpTopic);

        //Error states of pumps
        service.suscribeToTopic(Topics.phhigherrorTopic);
        service.suscribeToTopic(Topics.phlowerrorTopic);
        service.suscribeToTopic(Topics.tdserrorTopic);

        //Error states of sensors
        service.suscribeToTopic(Topics.phsensorerrorTopic);
        service.suscribeToTopic(Topics.tdssensorerrorTopic);



        System.out.println("The topics are subscribed");
        return "The topics are subscribed";

    }

    // Returns the pH value received from an iot client
    @GetMapping("/get-ph-data")
    public double get_pH_Data() {
        System.out.println("The received ph data: " + DataVariables.pHData);
        return DataVariables.pHData;
    }

    // Returns the tds value received from an iot client
    @GetMapping("/get-tds-data")
    public double get_tds_Data() {
        System.out.println("The received tds data: " + DataVariables.tdsData);
        return DataVariables.tdsData;
    }

    // Returns the floating tube value received from an iot client
    @GetMapping("/get-floatSensor-data")
    public double get_floatSensor_data() {
        System.out.println("The received float sensor data: " + DataVariables.floatSensorData);
        return DataVariables.floatSensorData;
    }


    // Returns the ph pump state
    @GetMapping("/get-phpump-data")
    public double get_phpump_data() {
        System.out.println("The received ph pump data: " + DataVariables.phpumpData);
        return DataVariables.phpumpData;
    }

    // Returns the ph low pump state
    @GetMapping("/get-phlowpump-data")
    public double get_phlowpump_data() {
        System.out.println("The received ph low pump data: " + DataVariables.phlowpumpData);
        return DataVariables.phlowpumpData;
    }

    // Returns the tds pump state
    @GetMapping("/get-tdspump-data")
    public double get_tdspump_data() {
        System.out.println("The received tds pump data: " + DataVariables.tdspumpData);
        return DataVariables.tdspumpData;
    }


    // Returns 1 / true if ph sensor does not work properly.
    @GetMapping("/get-phsensorerror-data")
    public double get_phsensorerror_data() {
        System.out.println("The received ph sensor error data: " + DataVariables.phsensorerrorData);
        return DataVariables.phsensorerrorData;
    }

    // Returns 1 / true if tds sensor does not work properly.
    @GetMapping("/get-tdssensorerror-data")
    public double get_tdssensorerror_data() {
        System.out.println("The received tds sensor error data: " + DataVariables.tdssensorerrorData);
        return DataVariables.tdssensorerrorData;
    }

    // Returns 1 if the read ph value less than 0
    @GetMapping("/get-phlowerror-data")
    public double get_phlowerror_data() {
        System.out.println("The received ph low error data: " + DataVariables.phlowerrorData);
        return DataVariables.phlowerrorData;
    }

    // Returns 1 if the read ph value is higher than 14
    @GetMapping("/get-phhigherror-data")
    public double get_phhigherror_data() {
        System.out.println("The received ph high error data: " + DataVariables.phhigherrorData);
        return DataVariables.phhigherrorData;
    }

    // Returns 1 if the read tds value is  higher than threshold value
    @GetMapping("/get-tdserror-data")
    public double get_tdserror_data() {
        System.out.println("The received tds error data: " + DataVariables.tdserrorData);
        return DataVariables.tdserrorData;
    }

}

