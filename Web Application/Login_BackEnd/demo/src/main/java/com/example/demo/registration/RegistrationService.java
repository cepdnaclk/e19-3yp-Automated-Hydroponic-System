package com.example.demo.registration;

import org.springframework.stereotype.Service;

@Service
public class RegistrationService {

    public String register(RegistrationRequest request){
        return "works";
    }
}
