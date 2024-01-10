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
    @Setter
    @Getter
    String name;
    @Setter
    @Getter
    String details;
    @Setter
    @Getter
    @Lob
    @Column(length = 5242880)
    byte [] image;

    public Plant() {

    }

}
