package com.group15.AutomatedHydroponicsSystem.Exception;

public class SystemNotFoundException extends RuntimeException {
    public SystemNotFoundException(Integer systemId) {
        super("Could not find any system with the system id :" + systemId);
    }
}
