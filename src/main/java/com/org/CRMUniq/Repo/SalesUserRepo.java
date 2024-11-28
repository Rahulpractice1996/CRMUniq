package com.org.CRMUniq.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.org.CRMUniq.model.SalesUser;

@Repository
public interface SalesUserRepo extends JpaRepository<SalesUser, Long>{

}
