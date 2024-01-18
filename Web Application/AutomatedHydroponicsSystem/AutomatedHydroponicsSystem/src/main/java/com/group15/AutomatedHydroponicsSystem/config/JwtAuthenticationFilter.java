package com.group15.AutomatedHydroponicsSystem.config;

import com.group15.AutomatedHydroponicsSystem.token.TokenRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    // To use the extract username from the JWT web token
    private final JwtService jwtService;
    private final UserDetailsService userDetailsService;
    private final TokenRepository tokenRepository;

    @Override
    protected void doFilterInternal(
            @NonNull HttpServletRequest request,
            @NonNull HttpServletResponse response,
            // Contain the list of the other filters
            @NonNull FilterChain filterChain
    ) throws ServletException, IOException {
        // We need to pass authentication details in the header contains the JWT token
        final String authHeader = request.getHeader("Authorization");
        final String jwt;
        final String userEmail;
        // Authentication header should start with the word "Bearer"
        if (authHeader == null || !authHeader.startsWith("Bearer ")){
            filterChain.doFilter(request,response);
            // Here we don't want to continue with the execution since the requirement is not satisfied
            return;
        }
        // Since the authHeader will start with the "Bearer " Keyword
        jwt = authHeader.substring(7);
        // To extract the user email we have used the build in class name called JWTservice
        userEmail = jwtService.extractUsername(jwt); //todo extract the user email from JWT token

        // Check whether the user is already registered or not
        if (userEmail != null && SecurityContextHolder.getContext().getAuthentication() == null ){
            UserDetails userDetails = this.userDetailsService.loadUserByUsername(userEmail);
            var isTokenValid = tokenRepository.findByToken(jwt)
                    .map(t -> !t.isExpired() && !t.isRevoked())
                    .orElse(false);

            // Check the user is valid or not
            if (jwtService.isTokenValid(jwt, userDetails) && isTokenValid){
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
                authToken.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails(request)
                );
                SecurityContextHolder.getContext().setAuthentication(authToken);
            }
        }
        // To handle the next filters to be executed
        filterChain.doFilter(request,response);
    }
}
