package com.group15.AutomatedHydroponicsSystem.Demo;


import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
@CrossOrigin("http://65.2.179.127:3000")
@RestController
public class TestController {
    @GetMapping("/api/testing")
    public Object hello(){
        Map<String, String> object = new HashMap<>();
        object.put("name","Danujan");
        object.put("email","Danujan06@gmail.com");
        return object;
    }
}
