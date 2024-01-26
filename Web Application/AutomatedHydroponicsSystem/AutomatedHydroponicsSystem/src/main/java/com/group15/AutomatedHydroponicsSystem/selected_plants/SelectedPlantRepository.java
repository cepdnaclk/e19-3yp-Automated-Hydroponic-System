package com.group15.AutomatedHydroponicsSystem.selected_plants;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SelectedPlantRepository extends JpaRepository<SelectedPlants, Integer> {
}
