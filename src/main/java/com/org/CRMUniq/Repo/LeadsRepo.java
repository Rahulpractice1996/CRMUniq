package com.org.CRMUniq.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.org.CRMUniq.model.Leads;

@Repository
public interface LeadsRepo extends JpaRepository<Leads, Long>{

}
