package helperland.controller;

import java.awt.Dialog.ModalExclusionType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import helperland.model.Rating;
import helperland.model.ServiceRequest;
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
	
	@RequestMapping(value="/displayspdashboard",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxdisplayspdashboard(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		java.util.List<ServiceRequest> serviceRequest2 = this.serviceProviderService.getAllServiceRequest();
		
		return serviceRequest2;
	}
	
	@RequestMapping(value = "/acceptbtndashboardform/{service_req_id}",method = RequestMethod.GET)
	public @ResponseBody int ajaxcancelbtndashboard(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception{
		serviceRequest.setService_req_id(service_req_id);
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser"));
		
		int uid = Integer.parseInt(session.getAttribute("loginUser")+"");
		
		serviceRequest.setService_provider_id(uid);
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		serviceRequest.setSp_accepted_date(dtf.format(date));
		
		int accept_state = this.serviceProviderService.acceptService(serviceRequest);
		
		if(accept_state == 1) {
			List<User> email = this.serviceProviderService.getUserEmail(service_req_id);
			
			String message = "Your Request has been accepted by " + session.getAttribute("username") + session.getAttribute("userlastname") + "\n"+"Your service provider's contact informations are as below:\n" + "Email: " + session.getAttribute("useremail") + "Mobile Number: " + session.getAttribute("usermobile") +"\nFor more information visit your Dashboard.";
			String subject = "Your Service Request Accepted";
			String from = "helperland.janesh@gmail.com";
			
			Iterator<User> iterator = email.iterator();
			while (iterator.hasNext()) {
				String to = iterator.next().getEmail();
				sendServiceRequestEmail(message, subject, to, from);
			}
			
			
			this.serviceProviderService.getOneEmail(service_req_id);
			
//			String useremail = email.getEmail();
			
//			sendServiceRequestEmail(message, subject, email, from);
		}
		
		return accept_state;
	}
	
	@RequestMapping(value="/displayspdashboardmodal/{servicerequestid}",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public HashMap<String,Object> ajaxdisplaydashboardmodal(
			@PathVariable("servicerequestid") int servicerequestid,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		HashMap<String, Object> finalData= this.serviceProviderService.getAllCustomerServiceDetails(servicerequestid);
		
		
		System.out.println(finalData);
		
		
//		System.out.println(serviceRequest2.getClass().getSimpleName());
		
		return finalData;
	}
	
	
	@RequestMapping(value="/upcomingservicce",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxupcomingservicce(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> upcomingservicceData= this.serviceProviderService.getAllUpcomingServices(uid);
		
		
		System.out.println(upcomingservicceData);
		
		
//		System.out.println(serviceRequest2.getClass().getSimpleName());
		
		return upcomingservicceData;
	}
	
	
	@RequestMapping(value="/cancelbtnupcomingservice/{service_req_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxcancelbtnupcomingservice(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(service_req_id);
		
		
		this.serviceProviderService.cancelspServiceRequest(serviceRequest);

	}
	
	@RequestMapping(value="/completebtnupcomingservice/{service_req_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxcompletebtnupcomingservice(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(service_req_id);
		
		
		this.serviceProviderService.completespServiceRequest(serviceRequest);

	}
	
	
	@RequestMapping(value="/spservicehistory",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxspservicehistory(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> upcomingservicceData= this.serviceProviderService.getAllspservicehistory(uid);
		
		
		System.out.println(upcomingservicceData);
		
		
//		System.out.println(serviceRequest2.getClass().getSimpleName());
		
		return upcomingservicceData;
	}
	
	@RequestMapping(value="/spratingsdetails",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Rating> ajaxspratingsdetails(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<Rating> upcomingservicceData= this.serviceProviderService.getAllspRatings(uid);
		
		
		System.out.println(upcomingservicceData);
		
		
//		System.out.println(serviceRequest2.getClass().getSimpleName());
		
		return upcomingservicceData;
	}
	
	
	@RequestMapping(value="/updtsppassword/{old_password},{updtpassword}",method = RequestMethod.GET)
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
			System.out.println("errors");
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
	
	@RequestMapping(value="/updtspdetails/{FirstName},{LastName},{Mobile},{Day},{Month},{Year},{Nationality},{Gender},{Avatar},{AddressLine1},{AddressLine2},{PostalCode},{City}",method = RequestMethod.GET)
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
			System.out.println("errors");
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
	
	
	
	
	
	
	
	
	
	
	public void sendServiceRequestEmail(String message, String subject, String to, String from) {

		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();
		System.out.println("PROPERTIES " + properties);

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

			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			m.setSubject(subject);

			m.setText(message);

			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
