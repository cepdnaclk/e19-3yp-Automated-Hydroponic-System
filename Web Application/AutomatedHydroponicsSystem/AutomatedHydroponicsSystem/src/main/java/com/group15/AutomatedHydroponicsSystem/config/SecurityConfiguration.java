package com.group15.AutomatedHydroponicsSystem.config;


import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import static com.group15.AutomatedHydroponicsSystem.User.Permission.*;
import static com.group15.AutomatedHydroponicsSystem.User.Role.ADMIN;
import static com.group15.AutomatedHydroponicsSystem.User.Role.MANAGER;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableMethodSecurity
public class SecurityConfiguration {

    private final JwtAuthenticationFilter jwtAuthFilter;
    private final AuthenticationProvider authenticationProvider;
    private final LogoutHandler logoutHandler;

    @Bean // responsible for the all http functions
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{


        http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(req ->
                                req.requestMatchers("/api/v1/auth/**")
                                .permitAll()

                                        .requestMatchers("/api/v1/management/**").hasAnyRole(ADMIN.name(), MANAGER.name())
                                        .requestMatchers(HttpMethod.GET,"/api/v1/management/**").hasAnyAuthority(ADMIN_READ.name(),MANAGER_READ.name())
                                        .requestMatchers(HttpMethod.POST,"/api/v1/management/**").hasAnyAuthority(ADMIN_CREATE.name(),MANAGER_CREATE.name())
                                        .requestMatchers(HttpMethod.PUT,"/api/v1/management/**").hasAnyAuthority(ADMIN_UPDATE.name(),MANAGER_UPDATE.name())
                                        .requestMatchers(HttpMethod.DELETE,"/api/v1/management/**").hasAnyAuthority(ADMIN_DELETE.name(),MANAGER_DELETE.name())

                                        
                                        .anyRequest()
                                        .authenticated()

                )//authorizeHttpRequests()




                /*.requestMatchers("/api/v1/admin/**").hasRole(ADMIN.name())
                .requestMatchers(HttpMethod.GET,"/api/v1/admin/**").hasAuthority(ADMIN_READ.name())
                .requestMatchers(HttpMethod.POST,"/api/v1/admin/**").hasAuthority(ADMIN_CREATE.name())
                .requestMatchers(HttpMethod.PUT,"/api/v1/admin/**").hasAuthority(ADMIN_UPDATE.name())
                .requestMatchers(HttpMethod.DELETE,"/api/v1/admin/**").hasAuthority(ADMIN_DELETE.name())*/




                .sessionManagement(session ->session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))


                .authenticationProvider(authenticationProvider)
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
                .logout(logout ->
                                logout.logoutUrl("/api/v1/auth/logout")
                                .addLogoutHandler(logoutHandler)
                                .logoutSuccessHandler((request,response,authentication) -> SecurityContextHolder.clearContext())
                        )

            ;

                

        return http.build();

    }

}

/*
*package com.group15.AutomatedHydroponicsSystem.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

    private final JwtAuthenticationFilter jwtAuthFilter;
    private final AuthenticationProvider authenticationProvider;
    private final LogoutHandler logoutHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http
            .cors().and()
            .csrf().disable()
            .authorizeRequests(authorizeRequests ->
                authorizeRequests
                    .antMatchers("/api/v1/auth/**").permitAll()
                    .anyRequest().authenticated()
            )
            .sessionManagement(sessionManagement ->
                sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )
            .authenticationProvider(authenticationProvider)
            .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
            .logout(logout ->
                logout
                    .logoutUrl("/api/v1/auth/logout")
                    .addLogoutHandler(logoutHandler)
                    .logoutSuccessHandler((request, response, authentication) -> SecurityContextHolder.clearContext())
            );

        return http.build();
    }
}
 */
