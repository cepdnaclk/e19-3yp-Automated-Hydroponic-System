package com.group15.AutomatedHydroponicsSystem.Plant;

import com.group15.AutomatedHydroponicsSystem.plants.Plant;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PlantTest {
    @Test
    public void testPlantClass() {
        // Creating a Plant instance using the no-arg constructor
        Plant plant = new Plant();

        // Setting values using setters
        plant.setId(1);
        plant.setName("Sunflower");
        plant.setDetails("Beautiful yellow flower");
        plant.setImage(new byte[]{0, 1, 2, 3, 4});

        // Getting values using getters
        assertEquals(1, plant.getId());
        assertEquals("Sunflower", plant.getName());
        assertEquals("Beautiful yellow flower", plant.getDetails());
        assertArrayEquals(new byte[]{0, 1, 2, 3, 4}, plant.getImage());

        // Testing toString method
        String expectedToString = "Plant(id=1, name=Sunflower, details=Beautiful yellow flower, image=[0, 1, 2, 3, 4])";
        assertEquals(expectedToString, plant.toString());
    }
}
