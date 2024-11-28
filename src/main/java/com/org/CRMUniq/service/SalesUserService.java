package com.org.CRMUniq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.SalesUserRepo;
import com.org.CRMUniq.model.SalesUser;

@Service
public class SalesUserService {

	@Autowired
	SalesUserRepo SUrepo;
	
	public SalesUser saveTL(SalesUser TL) {
		
		return SUrepo.save(TL);
	}
	
	public List<SalesUser> saveAll(List<SalesUser> salesUsers) {
		return SUrepo.saveAll(salesUsers);
	}

	public SalesUser getByID(Long i) {
		
		return SUrepo.findById(i).get();		
	}
	
	public List<SalesUser> getAllSu() {
		return SUrepo.findAll();
	}
	
	public List<SalesUser> getAllSuByIds(List<Long> ids) {
		return SUrepo.findAllById(ids);
	}
	
	
}
