package com.group15.AutomatedHydroponicsSystem.system;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Entity
@RequiredArgsConstructor
@AllArgsConstructor
public class HydroponicsSystem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int systemId;
    private String name;
    private String userName;
    private String email;

}
