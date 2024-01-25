package com.group15.AutomatedHydroponicsSystem.Exception;

public class SelectedPlantNotFoundException extends RuntimeException{
    public SelectedPlantNotFoundException(Integer id) {
        super("Could not found any selected plant list with the given id: " + id);
    }

}
