package com.org.CRMUniq.model;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AllUsers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long EID;

    @Column(name = "role")
    private String role;
    
    @Column(name = "uname", nullable = false, unique = true)
    private String uname;

    @Column(name = "pwd", nullable = false)
    private String pwd;

    @Column(name = "email", nullable = false, unique = true)
    private String email;
    
    @Column(name = "contact", nullable = false, unique = true)
    private Long contact;
    
    

    
}
