package com.group15.AutomatedHydroponicsSystem.Exception;

public class PlantNotFoundException extends RuntimeException{
    public PlantNotFoundException(Integer id) {
        super("Could not found any plant with the give id: " + id);
    }
}
