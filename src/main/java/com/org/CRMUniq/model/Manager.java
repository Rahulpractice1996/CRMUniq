package com.org.CRMUniq.model;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Manager {

    @Id
    private Long MID;

    @OneToMany(mappedBy = "managerRef", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<SalesUser> salesUser;
    
    

    
   
}
