package com.group15.AutomatedHydroponicsSystem.config;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.springframework.security.core.GrantedAuthority;

import static javax.crypto.Cipher.SECRET_KEY;

@Service
public class JwtService {
    @Value("${application.security.jwt.secret-key}")
    private String secretKey;
    @Value("${application.security.jwt.expiration}")
    private long jwtExpiration;
    @Value("${application.security.jwt.refresh-token.expiration}")
    private long refreshExpiration;
    //= "529424ba8964aa3c4de609cf5b23f29a0741602186e31fdbd6605252faeef089";

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    } // Here the subject is the email or username of the user

    // To extract one single claim
    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver){
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);

    }

    // Only use userDetails to generate the token
    public String generateToken(UserDetails userDetails){
        return generateToken(new HashMap<>(), userDetails);
    }
    // Uses extraClaims and userDetails to generate the token
    public String generateToken(
            // To pass authority details
            Map<String, Object> extraClaims,
            UserDetails userDetails
    ){  List<String> authorities = userDetails.getAuthorities()
            .stream()
            .map(GrantedAuthority::getAuthority)
            .collect(Collectors.toList());

        // Add user authorities to claims
        Map<String, Object> claims = new HashMap<>();
        claims.put("authorities", authorities);

        // Add extra claims if provided
        if (extraClaims != null && !extraClaims.isEmpty()) {
            claims.putAll(extraClaims);
        }
        //return buildToken(extraClaims,userDetails,jwtExpiration);
        return Jwts
                .builder()
                .setClaims(claims)
                .setSubject(userDetails.getUsername())
                //.setSubject(userDetails.getAuthorities().toString())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis()+ jwtExpiration))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public String generateRefreshToken(
            UserDetails userDetails
    ){
        return buildToken(new HashMap<>(),userDetails,refreshExpiration);
    }

    private String buildToken(
            Map<String, Object> extraClaims,
            UserDetails userDetails,
            long expiration
    ){

        return Jwts
                .builder()
                .setClaims(extraClaims)
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis()+ expiration))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public boolean isTokenValid(String token,UserDetails userDetails){
        final String username = extractUsername(token);
        return (username.equals(userDetails.getUsername())) && !isTokenExpired(token);
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    // To extract all the claims
    private Claims extractAllClaims(String token){
        return Jwts
                .parserBuilder()   // Create a JWT parser builder
                .setSigningKey(getSignInKey())   // Set the signing key for verifying the token
                .build()   // Build the JWT parser
                .parseClaimsJws(token)   // Parse the provided token
                .getBody();   // Get the body of the JWT, which contains the claims
    }

    private Key getSignInKey() {
        // String.valueOf is recently added by the recommendation
        byte[] keyBytes = Decoders.BASE64.decode(String.valueOf(secretKey));
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
