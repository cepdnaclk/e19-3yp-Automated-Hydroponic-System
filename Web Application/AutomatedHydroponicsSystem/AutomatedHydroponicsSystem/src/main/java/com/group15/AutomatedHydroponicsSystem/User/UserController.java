package com.group15.AutomatedHydroponicsSystem.User;

import com.group15.AutomatedHydroponicsSystem.Exception.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/auth")
public class UserController {
    @Autowired
    private  UserRepository userRepository;

    @GetMapping("/users/all")
    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    @GetMapping("/users/{email}")
    public Optional<User> getUserByEmail(@PathVariable String email){
        return userRepository.findByEmail(email);
    }

    @GetMapping("/users/{id}")
    public Optional<User> getUserById(@PathVariable Integer id){
        return Optional.ofNullable(userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id)));
    }

}
