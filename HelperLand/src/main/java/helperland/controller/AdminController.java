package helperland.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.User;
import helperland.service.AdminService;
import helperland.service.UserService;

@RestController
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/usermanagement",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<User> ajaxdisplayusermanagement(HttpServletRequest request) throws Exception {
		
//		HttpSession session = request.getSession();
//		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
//		String temp = "" + session.getAttribute("loginUser");
//		int uid = Integer.parseInt(temp);
		
		List<User> users = this.adminService.getAllUsers();
		
		System.out.println(users.toString()+"adminnnnnn");
		
		return users;
	}
	
	@RequestMapping(value = "/adminchangestatus/{uid},{activestatus}",method = RequestMethod.GET)
	public @ResponseBody int ajaxadminchangestatus(
			@PathVariable("uid") int uid,
			@PathVariable("activestatus") int activestatus,
			@ModelAttribute User user, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception{
		
		user.setUser_id(uid);
		
		
		if(activestatus == 1) {
			user.setIs_active(0);
		}
		else {
			user.setIs_active(1);
		}
		
		int status = this.adminService.adminstatus(user);
		
		return status;
	}
	
	@RequestMapping(value = "/adminapproval/{uid}",method = RequestMethod.GET)
	public @ResponseBody int ajaxadminapproval(
			@PathVariable("uid") int uid,
			@ModelAttribute User user, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception{
		
		user.setUser_id(uid);
		
		user.setIs_approved(1);
		
		int status = this.adminService.adminapproval(user);
		
		return status;
	}
	
	@RequestMapping(value = "/adminuserdelete/{uid}",method = RequestMethod.GET)
	public @ResponseBody int ajaxadminuserdelete(
			@PathVariable("uid") int uid,
			@ModelAttribute User user, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception{
		
		user.setUser_id(uid);
		
		user.setIs_deleted(1);
		
		int status = this.adminService.adminuserdelete(user);
		
		return status;
	}
	
	@RequestMapping(value="/servicerequests",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxdisplayservicerequests(HttpServletRequest request) throws Exception {
		
//		HttpSession session = request.getSession();
//		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
//		String temp = "" + session.getAttribute("loginUser");
//		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> serviceRequests = this.adminService.getAllServiceRequest();
		
		System.out.println(serviceRequests.toString()+"adminnnnnn");
		
		return serviceRequests;
	}
	@RequestMapping(value="/editserviceRequest/{srId},{service_start_date},{startTime},{AddressLine1},{AddressLine2},{Postal_Code},{City}",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public void ajaxeditserviceRequest(@PathVariable("srId") int srId,
			@PathVariable("service_start_date") String service_start_date,
			@PathVariable("startTime") String startTime,
			@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2,
			@PathVariable("Postal_Code") int Postal_Code,
			@PathVariable("City") String City,
			@ModelAttribute ServiceRequest serviceRequest,
			@ModelAttribute ServiceRequestAddress serviceRequestAddress,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(srId);
		serviceRequest.setService_start_date(service_start_date);
		serviceRequest.setService_start_time(startTime);

		serviceRequestAddress.setServiceRequestId(srId);
		serviceRequestAddress.setAddressLine1(AddressLine1);
		serviceRequestAddress.setAddressLine2(AddressLine2);
		serviceRequestAddress.setPostalCode(Postal_Code);
		serviceRequestAddress.setCity(City);
		
		ServiceRequest servicedata = this.userService.getSErviceDetailsForReschedule(serviceRequest);

		
		if(servicedata.getService_provider_id() == 0) {
			this.adminService.editServiceRequest(serviceRequest);
			this.adminService.editServiceRequestAddress(serviceRequestAddress);
		}
		
		else {
			List<ServiceRequest> spDetails = this.userService.getSPDetails(servicedata.getService_provider_id());
			
			Iterator<ServiceRequest> iterator = spDetails.iterator();
			
			while(iterator.hasNext()) {
				if(service_start_date.equals(iterator.next().getService_start_date())){
					this.adminService.editServiceRequestifSpNotFree(serviceRequest);
					this.adminService.editServiceRequestAddress(serviceRequestAddress);
					break;
				}
				else {
					this.adminService.editServiceRequest(serviceRequest);
					this.adminService.editServiceRequestAddress(serviceRequestAddress);
				}
			}
		}
	}
}
