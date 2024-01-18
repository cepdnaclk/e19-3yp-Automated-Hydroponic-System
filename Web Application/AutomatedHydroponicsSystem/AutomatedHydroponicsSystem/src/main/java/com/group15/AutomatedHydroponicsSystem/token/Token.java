package com.group15.AutomatedHydroponicsSystem.token;

import com.group15.AutomatedHydroponicsSystem.User.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Equivalent to getters and setters
@Builder
@NoArgsConstructor
@Entity
@Table
@AllArgsConstructor
public class Token {
    @Id
    @GeneratedValue
    private Integer id;
    private String token;
    @Enumerated(EnumType.STRING)
    private TokenType tokenType;
    private boolean expired;
    // Can be used to revoke the token when starting the system or manually revoking the system
    private boolean revoked ;


    @ManyToOne //Many tokens can be belonged to one user
    @JoinColumn(name = "user_id")  // user_id is the one collabarating with the token columns
    private User user;

}
