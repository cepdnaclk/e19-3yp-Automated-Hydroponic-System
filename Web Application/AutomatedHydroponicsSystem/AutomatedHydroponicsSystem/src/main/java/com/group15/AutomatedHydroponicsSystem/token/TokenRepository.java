package com.group15.AutomatedHydroponicsSystem.token;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Integer> {

    @Query("""
            select t from Token t inner join User u on t.user.id = u.id
            where u.id = :userId and (t.expired = false or t.revoked = false)
            """
    )
    // find the valid tokens for a specific user
    List<Token> findAllValidTokensByUser(Integer userId);

    Optional<Token> findByToken(String token);
}
