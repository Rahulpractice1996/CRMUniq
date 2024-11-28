package com.org.CRMUniq.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.org.CRMUniq.model.Manager;

@Repository
public interface ManagerRepo extends JpaRepository<Manager, Long>{

}
