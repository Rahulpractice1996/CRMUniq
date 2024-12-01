package com.org.CRMUniq.model.DAO;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class CountLeadsByStatus {

	int TotalLeads=0;
	int NewLeads=0;
	int enrolled=0;
	int in_progress=0;
	int ready_to_join=0;
	int rejected=0;
	
	public CountLeadsByStatus(int TotalLeads, int NewLeads, int enrolled, int in_progress, int ready_to_join, int rejected) {
		this.TotalLeads = TotalLeads;
		this.NewLeads = NewLeads;
		this.enrolled = enrolled;
		this.in_progress = in_progress;
		this.ready_to_join = ready_to_join;
		this.rejected = rejected;
	}
	
}
