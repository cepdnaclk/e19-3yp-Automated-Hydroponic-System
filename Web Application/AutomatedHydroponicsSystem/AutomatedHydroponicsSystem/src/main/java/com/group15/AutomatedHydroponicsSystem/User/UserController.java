package com.group15.AutomatedHydroponicsSystem.User;

import com.group15.AutomatedHydroponicsSystem.Exception.PlantNotFoundException;
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

    @PutMapping("/users/{id}")
    public User updateUser(@RequestBody User newUser, @PathVariable Integer id){
        Optional <User> optionalUser = userRepository.findById(id);

        return optionalUser.map(user -> {
            user.setFirstname(newUser.getFirstname());
            user.setLastname(newUser.getLastname());
            user.setEmail(newUser.getEmail());
            user.setRole(newUser.getRole());
            user.setPassword(newUser.getPassword());

            return userRepository.save(user);
        }).orElseThrow(() -> new UserNotFoundException(id));

    }

    @DeleteMapping("/users/{id}")
    String deleteUser(@PathVariable Integer id) {
        if(!userRepository.existsById(id)){
            throw new UserNotFoundException(id);
        }else {
            userRepository.deleteById(id);
            return "User with id " + id + "deleted successfully.";
        }
    }

}
