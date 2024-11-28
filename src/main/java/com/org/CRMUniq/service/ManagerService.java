package com.org.CRMUniq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.ManagerRepo;
import com.org.CRMUniq.model.Manager;

@Service
public class ManagerService {

	@Autowired
	ManagerRepo managerRepo;
	
	public Manager save(Manager manager) {
		return managerRepo.save(manager);

	}

	public Manager getByID(Long i) {
		return managerRepo.findById(i).get();
	}

	public List<Manager> GetAllManagers() {
		return managerRepo.findAll();
	}

}
 