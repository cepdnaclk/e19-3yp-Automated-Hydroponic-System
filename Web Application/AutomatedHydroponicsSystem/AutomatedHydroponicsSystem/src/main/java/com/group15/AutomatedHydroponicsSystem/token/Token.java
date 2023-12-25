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
    private boolean revoked;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
