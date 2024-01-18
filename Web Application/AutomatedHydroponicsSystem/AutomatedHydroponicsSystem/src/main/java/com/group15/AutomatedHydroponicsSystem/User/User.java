package com.group15.AutomatedHydroponicsSystem.User;

import com.group15.AutomatedHydroponicsSystem.token.Token;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Data   // Equivalent to getters and setters
@Builder // Build the user object in an easy way
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table  //(name = "_user")
// UserDetails interface have bunch of methods
public class User implements UserDetails, UserDetailsNew {
    @Id // To indicate the primary key
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Integer id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;

    // Added after the role base authentication enabled
    @Column(length = 200) // Adjust the length accordingly
    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "user")
    private List<Token> tokens;

    @Override // Will return a list of roles
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return role.getAuthorities();
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public String getPassword(){
        return password;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Role getRole() {
        return role;
    }


}
