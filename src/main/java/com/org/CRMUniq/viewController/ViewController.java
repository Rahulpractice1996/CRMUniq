package com.org.CRMUniq.viewController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.model.Leads;
import com.org.CRMUniq.model.SalesUser;
import com.org.CRMUniq.model.Transactions;
import com.org.CRMUniq.model.DAO.ManagerAndSalesUserCollab;
import com.org.CRMUniq.service.AllUserService;
import com.org.CRMUniq.service.LeadService;
import com.org.CRMUniq.service.ManagerService;
import com.org.CRMUniq.service.SalesUserService;
import com.org.CRMUniq.service.TransactionService;
import com.org.CRMUniq.service.CommunicationService.EmailSenderService;
import com.org.CRMUniq.service.CommunicationService.SendEmail;

@Controller
public class ViewController {

	@Autowired
	AllUserService allUserSevice;
	@Autowired
	ManagerService managerService;
	@Autowired
	SalesUserService SUservice;
	@Autowired
	LeadService leadService;
	@Autowired
	TransactionService TransService;

	@GetMapping("/")
	public String login(Model model) {
		return "login";
	}

	@GetMapping("/AdminHome")
	public String adminHome(Model model) {
		return "AdminHome";
	}

	@GetMapping("/AddHumanResource")
	public String AddHumanResource(Model model) {
		return "AddHumanResource";
	}

	@PostMapping("/addHumanResource")
	public String addHumanResource(@ModelAttribute("user") AllUsers user, RedirectAttributes redirectAttributes) {

		allUserSevice.addusers(user); // Crm Rest controlle

		redirectAttributes.addFlashAttribute("message", user.getUname() + " - New Resource added successfully!");
		return "redirect:/AdminHome"; // Redirects to the same form after successful submission
	}

	@GetMapping("/ShowManagers")
	public String ShowManagers(Model model) {

		List<AllUsers> managers = allUserSevice.GetByRole("Manager");

		List<Long> UnassignedMid = managerService.GetAllManagers().stream().filter(a -> a.getSalesUser().isEmpty())
				.map(b -> b.getMID()).collect(Collectors.toList());

		List<Long> assignedMid = managerService.GetAllManagers().stream().filter(a -> !a.getSalesUser().isEmpty())
				.map(b -> b.getMID()).collect(Collectors.toList());
		System.out.println(assignedMid);
		// System.out.println(UnassignedMid);
		List<AllUsers> UnassignedManagers = new ArrayList<>();
		List<AllUsers> assignedManagers = new ArrayList<>();

		UnassignedMid.forEach(id -> {
			managers.forEach(b -> {
				if (b.getEID() == id) {
					UnassignedManagers.add(b);
				}
			});

		});

		assignedMid.forEach(id -> {
			managers.forEach(b -> {
				if (b.getEID() == id) {
					assignedManagers.add(b);
				}
			});

		});

		model.addAttribute("managers", UnassignedManagers);
		model.addAttribute("assignedManagers", assignedManagers);

		return "ShowManagers";
	}

	@GetMapping("/ViewSalesUsers")
	private String ViewSalesUsersById(@RequestParam Long managerId, Model model) {
		AllUsers manager = allUserSevice.getOneById(managerId);

		List<Long> salesUsersBelongtoManagerIds = managerService.getByID(managerId).getSalesUser().stream()
				.map(a -> a.getSUID()).collect(Collectors.toList());
		List<AllUsers> salesUsersBelongtoManager = allUserSevice.getById(salesUsersBelongtoManagerIds);

		model.addAttribute("salesusers", salesUsersBelongtoManager);
		model.addAttribute("manager", manager);

		return "ViewSalesUsers";
	}

	@GetMapping("/AddSalesUsers")
	private String AddSalesUsers(@RequestParam Long managerId, @RequestParam String managerName, Model model) {

		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		List<Long> UnassignedSuid = SUservice.getAllSu().stream().filter(a -> a.getManagerRef() == null)
				.map(b -> b.getSUID()).collect(Collectors.toList());

		// System.out.println(UnassignedSuid);

		List<Long> assignedSuid = SUservice.getAllSu().stream().filter(a -> a.getManagerRef() != null)
				.map(b -> b.getSUID()).collect(Collectors.toList());
		// System.out.println(assignedSuid);

		List<AllUsers> UnassignedSalesUsers = new ArrayList<>();
		List<AllUsers> assignedSalesUsers = new ArrayList<>();

		UnassignedSuid.forEach(id -> {
			SalesUsers.forEach(b -> {
				if (b.getEID() == id) {
					UnassignedSalesUsers.add(b);
				}
			});

		});

		assignedSuid.forEach(id -> {
			SalesUsers.forEach(b -> {
				if (b.getEID() == id) {
					assignedSalesUsers.add(b);
				}
			});

		});

		//-----------------merging managers and Sales user by Additional DAO
		List<SalesUser> TeamSalesUser = SUservice.getAllSuByIds(assignedSuid);
		List<ManagerAndSalesUserCollab> DAO = new ArrayList<>();
		
		TeamSalesUser.forEach(SalesUser -> {
			ManagerAndSalesUserCollab obj = new ManagerAndSalesUserCollab();
			Long SUID = SalesUser.getSUID();
			Long MID = SalesUser.getManagerRef().getMID();
			obj.setSalesUserID(SUID);
			obj.setManagerID(MID);
			DAO.add(obj);

		});

		//-----------------merging managers and Sales user by Additional DAO
		List<AllUsers> AllUsers = allUserSevice.getAllUsers();
		AllUsers.forEach(AllUser -> {
			DAO.forEach(D -> {

				if (D.getManagerID() == AllUser.getEID()) {
					D.setManagerName(AllUser.getUname());
				} else if (D.getSalesUserID() == AllUser.getEID()) {
					D.setSalesUserName(AllUser.getUname());
				}
			});

		});

		model.addAttribute("UnassignedSalesUsers", UnassignedSalesUsers);
		model.addAttribute("assignedSalesUsers", assignedSalesUsers);
		
		model.addAttribute("DAO", DAO);
		model.addAttribute("managerName", managerName);
		model.addAttribute("managerId", managerId);

		return "AddSalesUsers";
	}

	@PostMapping("/buildteam")
	public String buildTeam(@RequestParam Long managerId, @RequestParam String managerName,
			@RequestParam List<Long> salesUserIds, Model model) {

		allUserSevice.allocateSUtoManager(managerId, salesUserIds);

		return "redirect:/AddSalesUsers?managerId=" + managerId + "&managerName=" + managerName;
	}

	@GetMapping("/SalesUser")
	public String SalesUser(Model model) {
		
		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		List<Long> UnassignedSuid = SUservice.getAllSu().stream().filter(a -> a.getManagerRef() == null)
				.map(b -> b.getSUID()).collect(Collectors.toList());

		// System.out.println(UnassignedSuid);

		List<Long> assignedSuid = SUservice.getAllSu().stream().filter(a -> a.getManagerRef() != null)
				.map(b -> b.getSUID()).collect(Collectors.toList());
		
		List<AllUsers> UnassignedSalesUsers = new ArrayList<>();
		List<AllUsers> assignedSalesUsers = new ArrayList<>();

		UnassignedSuid.forEach(id -> {
			SalesUsers.forEach(b -> {
				if (b.getEID() == id) {
					UnassignedSalesUsers.add(b);
				}
			});

		});

		assignedSuid.forEach(id -> {
			SalesUsers.forEach(b -> {
				if (b.getEID() == id) {
					assignedSalesUsers.add(b);
				}
			});

		});

		//-----------------merging managers and Sales user by Additional DAO
				List<SalesUser> TeamSalesUser = SUservice.getAllSuByIds(assignedSuid);
				List<ManagerAndSalesUserCollab> DAO = new ArrayList<>();
				
				TeamSalesUser.forEach(SalesUser -> {
					ManagerAndSalesUserCollab obj = new ManagerAndSalesUserCollab();
					Long SUID = SalesUser.getSUID();
					Long MID = SalesUser.getManagerRef().getMID();
					obj.setSalesUserID(SUID);
					obj.setManagerID(MID);
					DAO.add(obj);

				});

				//-----------------merging managers and Sales user by Additional DAO
				List<AllUsers> AllUsers = allUserSevice.getAllUsers();
				AllUsers.forEach(AllUser -> {
					DAO.forEach(D -> {

						if (D.getManagerID() == AllUser.getEID()) {
							D.setManagerName(AllUser.getUname());
						} else if (D.getSalesUserID() == AllUser.getEID()) {
							D.setSalesUserName(AllUser.getUname());
						}
					});

				});

		
		
		model.addAttribute("SalesUsersUnasigned",UnassignedSalesUsers);
		model.addAttribute("SalesUsersAsigned",assignedSalesUsers);
		model.addAttribute("DAO", DAO);
		List<AllUsers> allmanagers = allUserSevice.GetByRole("Manager");
		model.addAttribute("allmanagers", allmanagers);

		return "SalesUser";
	}
	
	@PostMapping("/allocate")
	private String allo( @RequestParam Long MID , @RequestParam Long SuID) {
		allUserSevice.allocateSUtoManager(MID, SuID);
		return "redirect:SalesUser";
	}
	
	@GetMapping("/new-leads")
	private String AddNewLead(Model model) {
		return "AddNewLead";
	}
	
	@PostMapping("/addNewLead")
	public String addSingleLead(@ModelAttribute Leads lead, Model model) {
		lead.setBeginDate(new Date());
		leadService.AddLead(lead);
		model.addAttribute("message", "Lead added succesfully.!");
		return "AddNewLead";
	}
	
	@GetMapping("/leads")
	private String leads(Model model) {
		
		List<Leads> leads = leadService.getAllLeads(); 
		model.addAttribute("leads", leads);
		List<AllUsers> Managers = allUserSevice.GetByRole("Manager");
		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		model.addAttribute("Managers", Managers);
		model.addAttribute("SalesUsers", SalesUsers);
		return "leads";
	}
	@PostMapping("/AllocateLeads")
	public String AllocateLeads(@RequestParam Long managerId,@RequestParam Long salesUserId,
			@RequestParam List<Long> LeadID) { 
		Long EID;
		if(managerId>salesUserId){EID=managerId;}else {EID=salesUserId;}
		AllUsers user=allUserSevice.getOneById(EID);
		String username=user.getUname();
		String userRole=user.getRole();
		List<Leads> leads=leadService.getLeadsByIds(LeadID);
		leads.forEach(l->{
			l.setLeadOwner(username);
			l.setLeadOwnerId(EID);
			l.setLeadOwnerRole(userRole);
			l.setLeadStatus("Assigned");
			l.setEndDate(new Date());
			Transactions obj=new Transactions();
			obj.setDateTimeStamp(TransService.formatDateTime(new Date()));
			obj.setRemarks("Assigned to"+username+" "+userRole+"by Admin");
			obj.setLeadStatus("Assigned");
			obj.setLead(l);
			obj.setContactType("visibility");
			TransService.saveActivity(obj);
		});
		leadService.AddAllLead(leads);
		return "redirect:leads";
	}
	
	@GetMapping("/mysmartView")
	public String mysmartView(Model model) {
		
		List<Leads> leads = leadService.getAllLeads(); 
		model.addAttribute("leads", leads);
		List<AllUsers> Managers = allUserSevice.GetByRole("Manager");
		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		model.addAttribute("Managers", Managers);
		model.addAttribute("SalesUsers", SalesUsers);
		
		return "My Smart View";
	}
	
	@GetMapping("/LeadDetails")
	public String LeadDetails(@RequestParam Long LID,Model model) {
		
		Leads leads = leadService.getAllLeads().stream().filter(l->l.getLID()==LID).findFirst().get(); 
		model.addAttribute("leads", leads);
		List<AllUsers> Managers = allUserSevice.GetByRole("Manager");
		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		model.addAttribute("Managers", Managers);
		model.addAttribute("SalesUsers", SalesUsers);

		
		return "Lead Details";
	}
	
	@Autowired
	EmailSenderService emailSenderService;
	
	@PostMapping("/sendEmail")
	public String sendEmail(@ModelAttribute SendEmail sendEmail,@RequestParam Long LID) {
		emailSenderService.sendEmail(sendEmail);
		
		
		
		
		Leads leads = leadService.getAllLeads().stream().filter(l->l.getLID()==LID).findFirst().get(); 

		Transactions obj=new Transactions();
		obj.setDateTimeStamp(TransService.formatDateTime(new Date()));
		obj.setRemarks("Sent notification email with subject: "+sendEmail.getSubject() +"\n mail body: "+sendEmail.getBody());
		obj.setLeadStatus("Assigned");
		obj.setLead(leads);
		obj.setContactType("email");
		TransService.saveActivity(obj);
		
		return "redirect:LeadDetails?LID="+LID;
	}
	
	
}
