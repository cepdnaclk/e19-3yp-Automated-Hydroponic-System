package com.group15.AutomatedHydroponicsSystem.system;

import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@Entity
@RequiredArgsConstructor
@AllArgsConstructor
public class System {
    private int systemId;
    private String name;
    private String userName;
    private String email;
    public void setSystemId(int systemId) {
        this.systemId = systemId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
