package com.group15.AutomatedHydroponicsSystem.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class HydroponicsSystemService {

    private final SystemRepository systemRepository;

    @Autowired
    public HydroponicsSystemService(SystemRepository systemRepository) {
        this.systemRepository = systemRepository;
    }

    public HydroponicsSystem getSystemById(int systemId) {
        Optional<HydroponicsSystem> optionalSystem = systemRepository.findById(systemId);
        return optionalSystem.orElse(null);
    }

    public HydroponicsSystem saveSystem(HydroponicsSystem hydroponicsSystem) {
        return systemRepository.save(hydroponicsSystem);
    }

    public HydroponicsSystem updateSystem(int systemId, HydroponicsSystem updatedSystem) {
        Optional<HydroponicsSystem> optionalSystem = systemRepository.findById(systemId);

        if (optionalSystem.isPresent()) {
            HydroponicsSystem existingSystem = optionalSystem.get();
            existingSystem.setName(updatedSystem.getName());
            existingSystem.setUserName(updatedSystem.getUserName());
            existingSystem.setEmail(updatedSystem.getEmail());
            return systemRepository.save(existingSystem);
        } else {
            // Handle the case where the system with the given ID is not found
            return null;
        }
    }

    // Add more methods as needed
}
