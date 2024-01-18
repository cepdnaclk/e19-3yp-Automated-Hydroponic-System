package com.group15.AutomatedHydroponicsSystem.Plant;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.group15.AutomatedHydroponicsSystem.Exception.PlantNotFoundException;
import com.group15.AutomatedHydroponicsSystem.plants.Plant;
import com.group15.AutomatedHydroponicsSystem.plants.PlantController;

import com.group15.AutomatedHydroponicsSystem.plants.PlantRepository;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Arrays;
import java.util.Base64;
import java.util.Optional;

import static org.hamcrest.Matchers.hasSize;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
public class PlantControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private PlantRepository plantRepository;

//    @Test
//    public void testAddPlant() throws Exception {
//        Plant plantToAdd = new Plant();
//        plantToAdd.setName("Rose");
//        plantToAdd.setDetails("Beautiful red flower");
//        plantToAdd.setImage(Base64.getEncoder().encodeToString(new byte[]{0, 1, 2, 3, 4}).getBytes());
//
//        when(plantRepository.save(any(Plant.class))).thenReturn(plantToAdd);
//
//        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/auth/plants/add")
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(objectMapper.writeValueAsString(plantToAdd)))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("$.name").value("Rose"))
//                .andExpect(jsonPath("$.details").value("Beautiful red flower"))
//                .andExpect(jsonPath("$.image").value(Arrays.toString(new byte[]{0, 1, 2, 3, 4})));
//    }


    @Test
    public void testGetAllPlants() throws Exception {
        Plant plant1 = new Plant();
        plant1.setId(1);
        plant1.setName("Sunflower");
        plant1.setDetails("Yellow flower");
        plant1.setImage(new byte[]{0, 1, 2, 3, 4});

        Plant plant2 = new Plant();
        plant2.setId(2);
        plant2.setName("Tulip");
        plant2.setDetails("Colorful flower");
        plant2.setImage(new byte[]{5, 6, 7, 8, 9});

        when(plantRepository.findAll()).thenReturn(Arrays.asList(plant1, plant2));

        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/auth/plants/all"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].id").value(1))
                .andExpect(jsonPath("$[0].name").value("Sunflower"))
                .andExpect(jsonPath("$[1].id").value(2))
                .andExpect(jsonPath("$[1].name").value("Tulip"));
    }

    @Test
    public void testGetPlantById() throws Exception {
        Plant plant = new Plant();
        plant.setId(1);
        plant.setName("Rose");
        plant.setDetails("Beautiful red flower");
        plant.setImage(new byte[]{0, 1, 2, 3, 4});

        when(plantRepository.findById(1)).thenReturn(Optional.of(plant));

        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/auth/plants/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.name").value("Rose"))
                .andExpect(jsonPath("$.details").value("Beautiful red flower"))
                .andExpect(jsonPath("$.image").value(Matchers.equalTo(Base64.getEncoder().encodeToString(new byte[]{0, 1, 2, 3, 4}))));
    }


//    @Test
//    public void testGetPlantById_NotFound() throws Exception {
//        when(plantRepository.findById(1)).thenReturn(Optional.empty());
//
//        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/auth/plants/1"))
//                .andExpect(status().isNotFound())
//                .andExpect(result -> assertTrue(result.getResolvedException() instanceof PlantNotFoundException))
//                .andExpect(result -> assertEquals("Could not found any plant with the give id: 1", result.getResolvedException().getMessage()));
//    }


//    @Test
//    public void testUpdatePlant() throws Exception {
//        Plant existingPlant = new Plant();
//        existingPlant.setId(1);
//        existingPlant.setName("Sunflower");
//        existingPlant.setDetails("Yellow flower");
//        existingPlant.setImage(new byte[]{0, 1, 2, 3, 4});
//
//        Plant updatedPlant = new Plant();
//        updatedPlant.setId(1);
//        updatedPlant.setName("Rose");
//        updatedPlant.setDetails("Beautiful red flower");
//        updatedPlant.setImage(new byte[]{5, 6, 7, 8, 9});
//
//        when(plantRepository.findById(1)).thenReturn(Optional.of(existingPlant));
//        when(plantRepository.save(any(Plant.class))).thenReturn(updatedPlant);
//
//        mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/auth/plants/1")
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(objectMapper.writeValueAsString(updatedPlant)))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("$.id").value(1))
//                .andExpect(jsonPath("$.name").value("Rose"))
//                .andExpect(jsonPath("$.details").value("Beautiful red flower"))
//                .andExpect(jsonPath("$.image").value(Arrays.toString(new byte[]{5, 6, 7, 8, 9})));
//    }
//
//    @Test
//    public void testUpdatePlant_NotFound() throws Exception {
//        Plant updatedPlant = new Plant();
//        updatedPlant.setId(1);
//        updatedPlant.setName("Rose");
//        updatedPlant.setDetails("Beautiful red flower");
//        updatedPlant.setImage(new byte[]{5, 6, 7, 8, 9});
//
//        when(plantRepository.findById(1)).thenReturn(Optional.empty());
//
//        mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/auth/plants/1")
//                        .contentType(MediaType.APPLICATION_JSON)
//                        .content(objectMapper.writeValueAsString(updatedPlant)))
//                .andExpect(status().isNotFound());
//    }
//
//    @Test
//    public void testDeletePlant() throws Exception {
//        when(plantRepository.existsById(1)).thenReturn(true);
//
//        mockMvc.perform(MockMvcRequestBuilders.delete("/api/v1/auth/plants/1"))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Plant with id 1 deleted successfully."));
//    }
//
//    @Test
//    public void testDeletePlant_NotFound() throws Exception {
//        when(plantRepository.existsById(1)).thenReturn(false);
//
//        mockMvc.perform(MockMvcRequestBuilders.delete("/api/v1/auth/plants/1"))
//                .andExpect(status().isNotFound());
//    }
}
