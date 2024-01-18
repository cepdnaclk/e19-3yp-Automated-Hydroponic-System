package com.group15.AutomatedHydroponicsSystem.auth;

public class UserAlreadyExistsException extends Throwable {
    public UserAlreadyExistsException(String message) {
        super(message);
    }
}
