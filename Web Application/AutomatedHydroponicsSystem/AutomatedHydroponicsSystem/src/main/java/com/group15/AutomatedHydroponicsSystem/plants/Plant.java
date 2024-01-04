package com.group15.AutomatedHydroponicsSystem.plants;

import jakarta.persistence.*;
import lombok.*;


@Entity
@Data
@Builder
@AllArgsConstructor
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
