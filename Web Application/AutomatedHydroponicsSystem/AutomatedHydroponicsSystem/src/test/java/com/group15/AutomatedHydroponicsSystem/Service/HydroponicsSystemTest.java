package com.group15.AutomatedHydroponicsSystem.Service;

import com.group15.AutomatedHydroponicsSystem.system.HydroponicsSystem;
import com.group15.AutomatedHydroponicsSystem.system.HydroponicsSystemService;
import com.group15.AutomatedHydroponicsSystem.system.SystemRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.mockito.Mockito.when;
import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(MockitoExtension.class)
public class HydroponicsSystemTest {

    @Mock
    private SystemRepository systemRepository;

    @InjectMocks
    private HydroponicsSystemService systemService;

    @Test
    public void testGetSystemById() {
        // Create a sample HydroponicsSystem
        HydroponicsSystem sampleSystem = new HydroponicsSystem(1, "System 1", "user1", "user1@example.com");

        // Mock the behavior of the systemRepository.findById method
        when(systemRepository.findById(1)).thenReturn(java.util.Optional.of(sampleSystem));

        // Call the service method to get the system by ID
        HydroponicsSystem result = systemService.getSystemById(1);

        // Assertions
        assertEquals(1, result.getSystemId());
        assertEquals("System 1", result.getName());
        assertEquals("user1", result.getUserName());
        assertEquals("user1@example.com", result.getEmail());
    }

    // Add more test cases as needed
}
