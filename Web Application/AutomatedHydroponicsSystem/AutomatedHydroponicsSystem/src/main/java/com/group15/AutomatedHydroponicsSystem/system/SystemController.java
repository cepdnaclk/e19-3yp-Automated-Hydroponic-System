package com.group15.AutomatedHydroponicsSystem.system;

import com.group15.AutomatedHydroponicsSystem.Exception.SystemNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/auth")
@CrossOrigin
public class SystemController {
    @Autowired
    private SystemRepository systemRepository;

//    @PostMapping("/systems/add")
//    public void addNewSystem(
//            @RequestParam("systemId") int systemId,
//            @RequestParam("name") String name,
//            @RequestParam("userName") String userName,
//            @RequestParam("email") String email
//            ) throws IOException {
//        System system = new System();
//
//        system.setSystemId(systemId);
//        system.setName(name);
//        system.setUserName(userName);
//        system.setEmail(email);
//
//        systemRepository.save(system);
//    }
    @PostMapping("/systems/add")
    HydroponicsSystem hydroponicsSystem(@RequestBody HydroponicsSystem newHydroponicsSystem){
        return systemRepository.save(newHydroponicsSystem);
    }

    @GetMapping("/systems/all")
    public List<HydroponicsSystem> getAllSystems(){
        return systemRepository.findAll();
    }

    @GetMapping("/systems/{systemId}")
    public Optional<HydroponicsSystem> GetSystemById(Integer systemId){
        return Optional.ofNullable(systemRepository.findById(systemId)
                .orElseThrow(() -> new SystemNotFoundException(systemId)));
    }

//    @PutMapping("/plants/{id}")
//    System updateSystem(@RequestBody System newSystem, @PathVariable Integer systemId) {
//        Optional<System> optionalSystem = systemRepository.findById(systemId);
//        return optionalSystem.map(system -> {
//            system.setSystemId(newSystem.getSystemId());
//            system.setName(newSystem.getName());
//            system.setUserName(newSystem.getUserName());
//            system.setEmail(newSystem.getEmail());
//            return systemRepository.save(system);
//        }).orElseThrow(() -> new SystemNotFoundException(systemId));
//    }

    @DeleteMapping("/systems/{systemId}")
    String deleteSystem(@PathVariable Integer systemId) {
        if(!systemRepository.existsById(systemId)){
            throw new SystemNotFoundException(systemId);
        }else {
            systemRepository.deleteById(systemId);
            return "System with id " + systemId + "deleted successfully.";
        }
    }
}
