package com.org.CRMUniq.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.org.CRMUniq.model.AllUsers;
@Repository
public interface AllUsersRepo extends JpaRepository<AllUsers, Long>{



	List<AllUsers> findByrole(String string);

	AllUsers findByuname(String username);

}
