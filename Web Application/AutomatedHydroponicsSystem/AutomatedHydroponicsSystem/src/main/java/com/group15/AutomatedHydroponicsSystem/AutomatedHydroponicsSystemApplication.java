package com.group15.AutomatedHydroponicsSystem;

import com.group15.AutomatedHydroponicsSystem.User.Role;
import com.group15.AutomatedHydroponicsSystem.auth.AuthenticationService;
import com.group15.AutomatedHydroponicsSystem.auth.RegisterRequest;
import com.group15.AutomatedHydroponicsSystem.auth.UserAlreadyExistsException;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AutomatedHydroponicsSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(AutomatedHydroponicsSystemApplication.class, args);
	}

//	@Bean
//	public CommandLineRunner commandLineRunner(
//			AuthenticationService service
//	){
//		return args -> {
//			var admin = RegisterRequest.builder()
//					.firstname("Admin")
//					.lastname("Admin")
//					.email("admin@mail.com")
//					.password("password")
//					.role(Role.ADMIN)
//					.build();
//            try {
//                System.out.println("Admin token: "+ service.register(admin).getAccessToken());
//            } catch (UserAlreadyExistsException e) {
//                throw new RuntimeException(e);
//            }
//
//            var manager = RegisterRequest.builder()
//					.firstname("MANAGER")
//					.lastname("MANAGER")
//					.email("manager@mail.com")
//					.password("password")
//					.role(Role.MANAGER)
//					.build();
//            try {
//                System.out.println("MANAGER token: "+ service.register(manager).getAccessToken());
//            } catch (UserAlreadyExistsException e) {
//                throw new RuntimeException(e);
//            }
//        };
//	}
}
