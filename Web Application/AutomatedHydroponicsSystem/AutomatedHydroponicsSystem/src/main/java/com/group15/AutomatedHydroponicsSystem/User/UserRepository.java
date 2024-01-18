package com.group15.AutomatedHydroponicsSystem.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // To retrieve the user by email
    Optional<User> findByEmail(String email);


}
