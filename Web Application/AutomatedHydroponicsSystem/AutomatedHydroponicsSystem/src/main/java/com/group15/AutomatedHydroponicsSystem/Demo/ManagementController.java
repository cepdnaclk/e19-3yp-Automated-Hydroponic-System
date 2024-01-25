package com.group15.AutomatedHydroponicsSystem.Demo;

import org.springframework.web.bind.annotation.*;
@CrossOrigin("http://65.2.179.127:3000")
@RestController
@RequestMapping("/api/v1/management")
public class ManagementController {

    @GetMapping
    public String get(){
        return "GET:: management control";
    }

    @PostMapping
    public String post(){
        return "Post:: management control";
    }


}
