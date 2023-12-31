package com.group15.AutomatedHydroponicsSystem.Exception;

public class UserNotFoundException extends RuntimeException{
    public UserNotFoundException(Integer id) {
        super("Could not found any user with the given id: " + id );
    }
}
