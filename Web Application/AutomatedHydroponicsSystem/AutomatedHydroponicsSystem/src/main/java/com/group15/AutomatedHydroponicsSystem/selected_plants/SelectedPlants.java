package com.group15.AutomatedHydroponicsSystem.selected_plants;

import com.group15.AutomatedHydroponicsSystem.system.HydroponicsSystem;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@RequiredArgsConstructor
public class SelectedPlants {
    @Id
    private int systemId;

    @ManyToOne
    @JoinColumn(name = "device_id", referencedColumnName = "systemId")
    private HydroponicsSystem hydroponicsSystem;

    private List<Integer> selectedPlantIds;

    public void setSystemId(int systemId) {
        this.systemId = systemId;
    }

    public void setHydroponicsSystem(HydroponicsSystem hydroponicsSystem) {
        this.hydroponicsSystem = hydroponicsSystem;
    }

    public void setSelectedPlantIds(List<Integer> selectedPlantIds) {
        this.selectedPlantIds = selectedPlantIds;
    }
}
