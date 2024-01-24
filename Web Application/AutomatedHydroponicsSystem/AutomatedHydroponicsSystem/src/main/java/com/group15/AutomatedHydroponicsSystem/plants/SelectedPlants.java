package com.group15.AutomatedHydroponicsSystem.plants;

import com.group15.AutomatedHydroponicsSystem.User.User;
import com.group15.AutomatedHydroponicsSystem.system.HydroponicsSystem;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
public class SelectedPlants {
    @Id
    private int systemId;

    @ManyToOne
    @JoinColumn(name = "device_id", referencedColumnName = "systemId")
    private HydroponicsSystem hydroponicsSystem;

    private List<Integer> selectedPlantIds;
}
