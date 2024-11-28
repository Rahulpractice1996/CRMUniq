package com.org.CRMUniq.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.org.CRMUniq.model.Transactions;

@Repository
public interface TransactionRepo extends JpaRepository<Transactions, Long>{

}
