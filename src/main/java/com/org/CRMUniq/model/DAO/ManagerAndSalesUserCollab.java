package com.org.CRMUniq.model.DAO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Data @NoArgsConstructor
public class ManagerAndSalesUserCollab {

	private Long salesUserID;
	private String salesUserName;

	private Long managerID;
	private String managerName;


	
}
