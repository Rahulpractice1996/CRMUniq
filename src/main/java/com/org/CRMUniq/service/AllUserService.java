package com.org.CRMUniq.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.AllUsersRepo;
import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.model.Manager;
import com.org.CRMUniq.model.SalesUser;

@Service
public class AllUserService 
{

	@Autowired
	AllUsersRepo userRepo;	
	@Autowired
	ManagerService managerService;
	@Autowired
	SalesUserService SUservice;

	
	public AllUsers addusers(AllUsers user) {
		
		if(user.getRole().equalsIgnoreCase("manager")) 
		{
			AllUsers SavedUser=userRepo.save(user);
			Manager manager=new Manager();
			
			manager.setMID(SavedUser.getEID());  
			
			managerService.save(manager);
			
			return SavedUser;
		}
		else if(user.getRole().equalsIgnoreCase("SalesUser")) 
		{
			AllUsers SavedUser=userRepo.save(user);
			SalesUser SU=new SalesUser();
			SU.setSUID(SavedUser.getEID());
			SUservice.saveTL(SU);
			
			return SavedUser;
		}
		
		
		return userRepo.save(user);
	}
	
	public List<AllUsers> GetByRole(String role) {
		
		return userRepo.findByrole(role);
	}
	
	public List<AllUsers> getAllUsers() {
		return userRepo.findAll();
	}

	public List<AllUsers> addMultipleUsers(List<AllUsers> users) {

		for(AllUsers user:users) {
		if(user.getRole().equalsIgnoreCase("manager")) 
		{
			AllUsers SavedUser=userRepo.save(user);
			Manager manager=new Manager(); 
			manager.setMID(SavedUser.getEID());  
			managerService.save(manager);	
		}
		
		else if(user.getRole().equalsIgnoreCase("teamlead")) 
		{
			
			AllUsers SavedUser=userRepo.save(user);
			SalesUser SU=new SalesUser();
			SU.setSUID(SavedUser.getEID());
			SUservice.saveTL(SU);
		}
		
		
		
		
		}
		return userRepo.saveAll(users);
	}
	
	public AllUsers findByuname(String username) {
		return userRepo.findByuname(username);
	}
	
	
	//---------------
	
	public SalesUser allocateSUtoManager(Long Mid,Long SuID) { // assign single user into manager
		Manager obj=managerService.getByID(Mid);		
		SalesUser SUobj=SUservice.getByID(SuID);
		SUobj.setManagerRef(obj);
		return SUservice.saveTL(SUobj);
		
	}
	
	public List<SalesUser> allocateSUtoManager(Long Mid,List<Long> SuIDs) { // assign multiple user into manager
		
		List<SalesUser> salesUsers=new ArrayList<>();
		Manager obj=managerService.getByID(Mid);
		
		SuIDs.forEach(SuID->{		
		SalesUser SUobj=SUservice.getByID(SuID);
		SUobj.setManagerRef(obj);
		
		salesUsers.add(SUobj);
		});

		
		return SUservice.saveAll(salesUsers);
		
	}
	
	//-----------------

	public List<AllUsers> getById(List<Long> salesUsersBelongtoManagerIds) {
		
		return userRepo.findAllById(salesUsersBelongtoManagerIds);
	}

	
	public AllUsers getOneById(Long EID)
	{
		return userRepo.findById(EID).get();
	}
	
}
