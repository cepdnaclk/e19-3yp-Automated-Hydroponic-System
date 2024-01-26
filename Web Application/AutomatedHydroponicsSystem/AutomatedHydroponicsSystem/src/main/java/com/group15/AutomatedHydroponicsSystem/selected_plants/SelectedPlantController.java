package com.group15.AutomatedHydroponicsSystem.selected_plants;

import com.group15.AutomatedHydroponicsSystem.Exception.PlantNotFoundException;
import com.group15.AutomatedHydroponicsSystem.Exception.SelectedPlantNotFoundException;
import com.group15.AutomatedHydroponicsSystem.plants.Plant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin
@RequestMapping("/api/v1/auth")
public class SelectedPlantController {

    @Autowired
    private  SelectedPlantRepository repository;

    @PostMapping("/store_selected-plant-ids")
    public ResponseEntity<String> storeSelectedPlantList(@RequestBody SelectedPlants selectedPlants){
        SelectedPlants newPlantIdList = new SelectedPlants();
        newPlantIdList.setSystemId(selectedPlants.getSystemId());
        newPlantIdList.setSelectedPlantIds(selectedPlants.getSelectedPlantIds());
        repository.save(newPlantIdList);

        return ResponseEntity.ok("The selected plant ids stored successfully");
    }

    @GetMapping("/get-selected-plant-id-list/{id}")
    public Optional<SelectedPlants> getSelectedPlantlistById(@PathVariable Integer id){
        return repository.findById(id);
    }

    @GetMapping("/selected-plant-list/all")
    public List<SelectedPlants> getAllSelectedPlants(){
        return repository.findAll();
    }

    @PutMapping("/update-selected-plants/{id}")
    public String updateSelectedPlants(@PathVariable Integer id, @RequestBody SelectedPlants selectedPlants){
        Optional<SelectedPlants> updatedSelectedPlants = repository.findById(id);

        return updatedSelectedPlants.map(selectedPlants1 -> {
            selectedPlants1.setSelectedPlantIds(selectedPlants.getSelectedPlantIds());
            repository.save(selectedPlants1);
            return  "The selected plant list is updated successfully.";
        }).orElseThrow(() -> new SelectedPlantNotFoundException(id));
    }
}
