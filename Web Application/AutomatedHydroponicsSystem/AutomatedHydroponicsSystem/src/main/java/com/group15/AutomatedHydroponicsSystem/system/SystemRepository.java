package com.group15.AutomatedHydroponicsSystem.system;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SystemRepository extends JpaRepository<HydroponicsSystem,Integer> {
}