package com.group15.AutomatedHydroponicsSystem.plants;

import com.group15.AutomatedHydroponicsSystem.Exception.PlantNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/auth")
public class PlantController {

    @Autowired
    private PlantRepository plantRepository;

//    @PostMapping("/plants/add")
//    public void addPlant(
//            @RequestParam("name") String name,
//            @RequestParam("details") String details,
//            @RequestParam("image")MultipartFile image
//    ) throws IOException {
//        Plant plant = new Plant();
//
//        plant.setName(name);
//        plant.setDetails(details);
//        plant.setImage(image.getBytes());
//
//        plantRepository.save(plant);
//    }
    @PostMapping("/plants/add")
    Plant plant(@RequestBody Plant newPlant){
        return plantRepository.save(newPlant);
    }

    @GetMapping("/plants/all")
    public List<Plant> getAllPlants(){
        return plantRepository.findAll();
    }

    @GetMapping("/plants/{id}")
    public Optional<Plant> getPlantById(@PathVariable Integer id){
        return Optional.ofNullable(plantRepository.findById(id)
                .orElseThrow(() -> new PlantNotFoundException(id)));
    }

    @PutMapping("/plants/{id}")
    Plant updatePlant(@RequestBody Plant newPlant, @PathVariable Integer id) {
        Optional<Plant> optionalPlant = plantRepository.findById(id);
        return optionalPlant.map(plant -> {
            plant.setName(newPlant.getName());
            plant.setDetails(newPlant.getDetails());
            plant.setImage(newPlant.getImage());
            return plantRepository.save(plant);
        }).orElseThrow(() -> new PlantNotFoundException(id));
    }


    @DeleteMapping("/plants/{id}")
    String deletePlant(@PathVariable Integer id) {
        if(!plantRepository.existsById(id)){
            throw new PlantNotFoundException(id);
        }else {
            plantRepository.deleteById(id);
            return "Plant with id " + id + "deleted successfully.";
        }
    }


}
