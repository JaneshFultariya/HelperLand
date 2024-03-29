package helperland.controller;

import java.awt.Dialog.ModalExclusionType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import helperland.dto.ServiceRequestDto;
import helperland.model.Favoriteandblocked;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceScheduleEntity;
import helperland.model.User;
import helperland.model.UserAddress;
import helperland.service.EmailService;
import helperland.service.ServiceProviderService;
import helperland.service.UserService;

@RestController
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class ServiceProviderController {

	@Autowired
	ServiceProviderService serviceProviderService;
	
	@Autowired 
	UserService userService;
	
	@GetMapping(value="/displayspdashboard", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxdisplayspdashboard(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		session.getAttribute("loginUser");
		int postal= Integer.parseInt(session.getAttribute("SpPostalCodeSession")+"");
		
		java.util.List<ServiceRequest> serviceRequest2 = this.serviceProviderService.getAllServiceRequest(uid,postal);
		
		return serviceRequest2;
	}
	
	@GetMapping(value = "/acceptbtndashboardform/{service_req_id}")
	public @ResponseBody int ajaxcancelbtndashboard(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception{
		serviceRequest.setService_req_id(service_req_id);
		
		HttpSession session = request.getSession();
		
		int uid = Integer.parseInt(session.getAttribute("loginUser")+"");
		
		serviceRequest.setService_provider_id(uid);
		
		
		ServiceRequest temp = this.serviceProviderService.servicestartDate(service_req_id);
		int temp1 = this.serviceProviderService.getState(temp.getService_start_date(),temp.getService_start_time(),uid,temp.getService_hours());

		if(temp1 == 0) {
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		serviceRequest.setSp_accepted_date(dtf.format(date));
		if(this.serviceProviderService.getUserStatus(uid)==1) {
		int accept_state = this.serviceProviderService.acceptService(serviceRequest);
		if(accept_state == 1) {
			List<User> email1 = this.serviceProviderService.getUserEmail(service_req_id);
			
			String message1 = "Service REquest with id =" +service_req_id+" is now accepted";
			String subject1 = "Your Service Request Accepted";
			String from1 = "helperland.janesh@gmail.com";
			
			String to = email1.stream().map(User::getEmail).collect(Collectors.joining(","));
			sendServiceRequestEmail(message1, subject1, to, from1);
			
			
			String message = "Your Request has been accepted by " + session.getAttribute("username") + session.getAttribute("userlastname") + "\n"+"Your service provider's contact informations are as below:\n" + "Email: " + session.getAttribute("useremail") + "Mobile Number: " + session.getAttribute("usermobile") +"\nFor more information visit your Dashboard.";
			String subject = "Your Service Request Accepted";
			String from = "helperland.janesh@gmail.com";
			 String useremail = this.serviceProviderService.getOneEmail(service_req_id);
			 sendServiceRequestEmail(message, subject, useremail, from);
		}
		
		return accept_state;
		}
		
		
		else {
			return 0;
		}
		}
		else {
			return 2;
		}
		
	}
	
	@GetMapping(value="/displayspdashboardmodal/{servicerequestid}", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public HashMap<String, Object> ajaxdisplaydashboardmodal(
			@PathVariable("servicerequestid") int servicerequestid,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		HashMap<String, Object> finalData= this.serviceProviderService.getAllCustomerServiceDetails(servicerequestid);
		
		return finalData;
	}
	
	
	@GetMapping(value="/upcomingservicce", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxupcomingservicce(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> upcomingservicceData= this.serviceProviderService.getAllUpcomingServices(uid);
		
		return upcomingservicceData;
	}
	
	
	@GetMapping(value="/cancelbtnupcomingservice/{service_req_id}")
	public @ResponseBody void ajaxcancelbtnupcomingservice(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		this.serviceProviderService.cancelspServiceRequest(serviceRequest);
		
		serviceRequest.setService_req_id(service_req_id);
		
		
		String message1 = "Service REquest with id =" +service_req_id+" is available again";
		String subject1 = "Your Service Request Accepted";
		String from1 = "helperland.janesh@gmail.com";
		
		List<User> email1 = this.serviceProviderService.getUserEmail(service_req_id);
		String to = email1.stream().map(User::getEmail).collect(Collectors.joining(","));
		sendServiceRequestEmail(message1, subject1, to, from1);
		
		
		String message = "Your Request has been canceled by you service provider !!!";
		String subject = "Your Service Request canceled";
		String from = "helperland.janesh@gmail.com";
		 String useremail = this.serviceProviderService.getOneEmail(service_req_id);
		 sendServiceRequestEmail(message, subject, useremail, from);
		
		

	}
	
	@GetMapping(value="/completebtnupcomingservice/{service_req_id}")
	public @ResponseBody void ajaxcompletebtnupcomingservice(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(service_req_id);
		serviceRequest.setPayment_done("Completed");
	
		this.serviceProviderService.completespServiceRequest(serviceRequest);

		String message = "Your Request has been Completed by you service provider !!!";
		String subject = "Your Service Request Completed";
		String from = "helperland.janesh@gmail.com";
		 String useremail = this.serviceProviderService.getOneEmail(service_req_id);
		 sendServiceRequestEmail(message, subject, useremail, from);
	}
	
	
	@GetMapping(value="/spservicehistory", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxspservicehistory(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> upcomingservicceData= this.serviceProviderService.getAllspservicehistory(uid);
		
		return upcomingservicceData;
	}
	
	@GetMapping(value="/spratingsdetails", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Rating> ajaxspratingsdetails(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<Rating> upcomingservicceData= this.serviceProviderService.getAllspRatings(uid);
		
		return upcomingservicceData;
	}
	
	
	@GetMapping(value="/updtsppassword/{old_password},{updtpassword}")
	public @ResponseBody int ajaxUpdtspPassword(@PathVariable("old_password") String old_password,
			@PathVariable("updtpassword") String updtpassword,
			@ModelAttribute User user, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			
			return 0;
		}
		else {
			
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");

			HttpSession session = request.getSession();
			String temp = "" + session.getAttribute("loginUser");
			int uid = Integer.parseInt(temp);
			
			int pass = this.userService.updtPasswordDetails(old_password,updtpassword,uid);
			
			return pass;
			
		}
		
	}
	
	@GetMapping(value="/updtspdetails/{FirstName},{LastName},{Mobile},{Day},{Month},{Year},{Nationality},{Gender},{Avatar},{AddressLine1},{AddressLine2},{PostalCode},{City}")
	public @ResponseBody void ajaxupdtspdetails(@PathVariable("FirstName") String FirstName,
			@PathVariable("LastName") String LastName,
			@PathVariable("Mobile") String Mobile, @PathVariable("Day") String Day, @PathVariable("Month") String Month,
			@PathVariable("Year") String Year, @PathVariable("Nationality") String Nationality,
			@PathVariable("Gender") String Gender,@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2, @PathVariable("PostalCode") String postalcode,
			@PathVariable("City") String City, @PathVariable("Avatar") String Avatar,
			@ModelAttribute User user, @ModelAttribute UserAddress userAddress,
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			
		}
		else {

			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");

			HttpSession session = request.getSession();
			String temp = "" + session.getAttribute("loginUser");
			int uid = Integer.parseInt(temp);
			
			String dob = Day + "-" + Month + "-" + Year; 
						
			session.setAttribute("username", FirstName);
			session.setAttribute("userlastname", LastName);
			session.setAttribute("usermobile", Mobile);
			session.setAttribute("userAvatar", Avatar);
			session.setAttribute("SpPostalCodeSession", postalcode);
			
			model.addAttribute("htmlusername", FirstName);
			model.addAttribute("htmllastname", LastName);
			model.addAttribute("htmlMobile", Mobile);
			model.addAttribute("htmluseremail", session.getAttribute("custemail"));
			model.addAttribute("htmladdline1", AddressLine1);
			model.addAttribute("htmladdline2", AddressLine2);
			model.addAttribute("htmlcity", City);
			model.addAttribute("htmlpostalcode", postalcode);
			model.addAttribute("htmlavatar", Avatar);
			
			
			
			
			user.setFirst_name(FirstName);
			user.setLast_name(LastName);
			user.setMobile(Mobile);
			user.setDate_of_birth(dob);
			user.setNationality(Nationality);
			user.setUser_profile_pic(Avatar);
			user.setUser_id(uid);
			user.setGender(Gender);
			userAddress.setAddressLine1(AddressLine1);
			userAddress.setAddressLine2(AddressLine2);
			userAddress.setPostalcode(Integer.parseInt(postalcode));
			userAddress.setCity(City);
			
			
			this.serviceProviderService.updtspDetails(user,userAddress);
			
			
		}
		
	}
	
	@GetMapping(value="/serviceSchedule", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public String ajaxshowserviceHistory(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceScheduleEntity> serviceRequest2 = this.serviceProviderService.getServiceSchedule(uid);
		
		Gson gson = new Gson();
		
		return gson.toJson(serviceRequest2);
	}
	
	@GetMapping(value="/blockCustomer", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<User> ajaxUserList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<User> userList = this.serviceProviderService.getUserList(uid);
		
		return userList;
	}
	
	@GetMapping(value="/blockCustomerAction/{uid}", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public void ajaxblockCustomerAction(HttpServletRequest request,
			@PathVariable("uid") int uid) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int spid = Integer.parseInt(temp);
		
		Favoriteandblocked blockcheck = this.serviceProviderService.getBlockCustomerList(uid , spid);
		
		if(blockcheck == null) {
			Favoriteandblocked favoriteandblocked = new Favoriteandblocked();
			favoriteandblocked.setUserId(spid);
			favoriteandblocked.setTargetUserId(uid);
			favoriteandblocked.setIsBlocked(1);
			this.serviceProviderService.insertBlockCustomer(favoriteandblocked);
		}
		else {
			if(blockcheck.getIsBlocked() == 0) {
				Favoriteandblocked favoriteandblocked = new Favoriteandblocked();
				favoriteandblocked.setUserId(spid);
				favoriteandblocked.setTargetUserId(uid);
				favoriteandblocked.setIsBlocked(1);
				this.serviceProviderService.updateBlockCustomer(favoriteandblocked);
			}
			else {
				Favoriteandblocked favoriteandblocked = new Favoriteandblocked();
				favoriteandblocked.setUserId(spid);
				favoriteandblocked.setTargetUserId(uid);
				favoriteandblocked.setIsBlocked(0);
				this.serviceProviderService.updateBlockCustomer(favoriteandblocked);
			}
		}
	}
	
	
	
	public void sendServiceRequestEmail(String message, String subject, String to, String from) {

		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("helperland.janesh@gmail.com", "SzaxTN2rudg9fbt");
			}

		});

		session.setDebug(true);

		MimeMessage m = new MimeMessage(session);

		try {

			m.setFrom(from);

			m.addRecipients(Message.RecipientType.TO, to);

			m.setSubject(subject);

			m.setText(message);

			Transport.send(m);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
