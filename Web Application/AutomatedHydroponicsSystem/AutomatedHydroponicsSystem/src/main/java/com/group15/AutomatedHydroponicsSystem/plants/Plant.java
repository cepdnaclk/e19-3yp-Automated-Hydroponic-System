package com.group15.AutomatedHydroponicsSystem.plants;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;


@Entity
@Data
@Builder
public class Plant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Getter
    String name;
    @Getter
    String details;
    @Getter
    @Lob
    @Column(length = 5242880)
    byte [] image;

    public Plant() {

    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
}
