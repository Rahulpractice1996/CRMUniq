package com.org.CRMUniq.model.DAO;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class CountLeadsByStatus {


	int assigned=0;
	int enrolled=0;
	int in_progress=0;
	int ready_to_join=0;
	int rejected=0;
	
	public CountLeadsByStatus(int assigned, int enrolled, int in_progress, int ready_to_join, int rejected) {
		this.assigned = assigned;
		this.enrolled = enrolled;
		this.in_progress = in_progress;
		this.ready_to_join = ready_to_join;
		this.rejected = rejected;
	}
	
}
