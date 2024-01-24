package com.group15.AutomatedHydroponicsSystem.plants;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Builder
@AllArgsConstructor
public class Plant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Getter
    String name;
    @Getter
    String details;

    @Getter
    @Lob
    @Column(length = 5242880)
    byte [] image;


    @Getter
    float phLow;
    @Getter
    float phHigh;
    @Getter
    float tdsHigh;
    @Getter
    float tdsLow;

    public void setName(String name) {
        this.name = name;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public void setPhLow(float phLow) {
        this.phLow = phLow;
    }

    public void setPhHigh(float phHigh) {
        this.phHigh = phHigh;
    }

    public void setTdsHigh(float tdsHigh) {
        this.tdsHigh = tdsHigh;
    }

    public void setTdsLow(float tdsLow) {
        this.tdsLow = tdsLow;
    }



    public Plant() {

    }

}
