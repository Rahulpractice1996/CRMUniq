package com.org.CRMUniq.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Leads {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long LID;

	@Column(name = "lead_name", nullable = false)
	private String leadName;

	private String leadStatus;

	@Column(name = "email")
	private String email;

	private String contactNo;

	private String leadOwner; // Users in AllUser table (drop down)
	private Long leadOwnerId;
	private String leadOwnerRole;

	

	private String lookingFor; // Products Available

	private String leadSource; // Learned about us from

	private String preferedLocation; // Prefered Locations where the products are available

	private String notes;

	private String remainder; // Remainder to follow up or call the lead
	
	private Long leadAge; // Remainder to follow up or call the lead


	@Column(name = "begin_date")@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date beginDate;
	
	@Column(name = "end_date")@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date endDate;

	@OneToMany(mappedBy = "lead", cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonManagedReference
	private List<Transactions> transactions;

}
