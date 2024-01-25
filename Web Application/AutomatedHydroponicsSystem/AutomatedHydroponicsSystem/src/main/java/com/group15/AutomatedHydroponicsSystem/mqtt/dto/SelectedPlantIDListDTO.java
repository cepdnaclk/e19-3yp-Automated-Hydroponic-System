package com.group15.AutomatedHydroponicsSystem.mqtt.dto;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;

@RequiredArgsConstructor
@Getter
@Setter
@Component
public class SelectedPlantIDListDTO {
    List<Integer> plantIDs;
}
