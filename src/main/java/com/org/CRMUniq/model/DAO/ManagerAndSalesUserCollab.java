package com.org.CRMUniq.model.DAO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Data @NoArgsConstructor
public class ManagerAndSalesUserCollab {

	private Long salesUserID;
	private String salesUserName;
	private Long salesUserleadsCount;


	private Long managerID;
	private String managerName;
	private Long managerleadsCount;



	
}
