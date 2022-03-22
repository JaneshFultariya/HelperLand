package helperland.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import helperland.dto.ServiceRequestDto;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;
import helperland.service.BookaService;
import helperland.service.UserService;

@RestController
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	BookaService bookaService;
	
	@RequestMapping(value="/mydetails/{edtfirstname},{edtlastname},{edtmobile},{edtbdate},{edtbmonth},{edtbyear},{edtlanguage}",method = RequestMethod.GET)
	public @ResponseBody void ajaxEdtUser(@PathVariable("edtfirstname") String edtfirstname,
			@PathVariable("edtlastname") String edtlastname,
			@PathVariable("edtmobile") String edtmobile,
			@PathVariable("edtbdate") String edtbdate,
			@PathVariable("edtbmonth") String edtbmonth,
			@PathVariable("edtbyear") String edtbyear,
			@PathVariable("edtlanguage") String edtlanguage,
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
			
		}
		else {
			
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			
			
			
			String dob = edtbdate + "-" + edtbmonth + "-" + edtbyear; 
			
			HttpSession session = request.getSession();
			String temp = "" + session.getAttribute("loginUser");
			int uid = Integer.parseInt(temp);
		
			user.setDate_of_birth(dob);
			user.setUser_id(uid);
			user.setFirst_name(edtfirstname);
			user.setLast_name(edtlastname);
			user.setMobile(edtmobile);
			user.setLanguage(edtlanguage);
			
			this.userService.edtUserDetails(user);
			
		}
	}
	
	@RequestMapping(value="/updtpassword/{old_password},{updtpassword}",method = RequestMethod.GET)
	public @ResponseBody int ajaxUpdtPassword(@PathVariable("old_password") String old_password,
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
	
	@RequestMapping(value="/addaddresssettings/{AddressLine1},{AddressLine2},{postalcode},{City},{Mobile}",method = RequestMethod.GET)
	public @ResponseBody void ajaxaddaddresssettings(@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2,
			@PathVariable("postalcode") String postalcode,
			@PathVariable("City") String City,
			@PathVariable("Mobile") String Mobile,
			@ModelAttribute UserAddress userAddress, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		userAddress.setUserid(uid);
		String uemail = session.getAttribute("useremail") + "" ;
		userAddress.setEmail(uemail);
		int pin = this.bookaService.addAddress(userAddress);

	}
	
	@RequestMapping(value="/showaddresssettings",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<UserAddress> ajaxshowaddresssettings(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<UserAddress> userAddress2 = this.bookaService.getUserallAddress(uid);
		
		return userAddress2;
	}
	
	@RequestMapping(value="/updateaddresssettings/{AddressLine1},{AddressLine2},{postalcode},{City},{Mobile},{user_address_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxupdateaddresssettings(@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2,
			@PathVariable("postalcode") String postalcode,
			@PathVariable("City") String City,
			@PathVariable("Mobile") String Mobile,
			@PathVariable("user_address_id") String user_address_id,
			@ModelAttribute UserAddress userAddress, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		userAddress.setUserid(uid);
		String uemail = session.getAttribute("useremail") + "" ;
		userAddress.setEmail(uemail);
		
		int adressId = Integer.parseInt(user_address_id);
		userAddress.setUser_address_id(adressId);
		
		
		this.userService.updateAddress(userAddress);

	}
	
	
	@RequestMapping(value="/deleteaddresssettings/{user_address_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxdeleteaddresssettings(
			@PathVariable("user_address_id") String user_address_id,
			@ModelAttribute UserAddress userAddress, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		userAddress.setUserid(uid);
		
		int adressId = Integer.parseInt(user_address_id);
		userAddress.setUser_address_id(adressId);
		
		
		this.userService.deleteAddress(userAddress);

	}
	
	@RequestMapping(value="/displaydashboard",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxdisplaydashboard(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> serviceRequest2 = this.userService.getAllService(uid);
		
		return serviceRequest2;
	}
	
	@RequestMapping(value="/ratingsavg/{spid}",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public double ajaxratingsavg(HttpServletRequest request,
			@PathVariable("spid") String spid) throws Exception {
		
		
		 double avgrating = this.userService.getavgsprating(spid);

		
		return avgrating;
	}
	
	@RequestMapping(value="/displaydashboardmodal/{servicerequestid}",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Object> ajaxdisplaydashboardmodal(
			@PathVariable("servicerequestid") int servicerequestid,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		HashMap<String, Object> finalData= this.userService.getAllServiceDetails(servicerequestid);
		
		
		return finalData;
	}
	
	@RequestMapping(value="/cancelbtndashboard/{service_req_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxcancelbtndashboard(
			@PathVariable("service_req_id") int service_req_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(service_req_id);
		serviceRequest.setPayment_done("cancel");
		
		this.userService.cancelServiceRequest(serviceRequest);
		
		Object[] emailObj = this.userService.getSErviceDetailsForCancel(serviceRequest);
		
		ServiceRequest serviceRequest2 = (ServiceRequest) emailObj[0];
		
		User user = (User) emailObj[1];
		
		if(serviceRequest2.getService_provider_id() != 0) {
			
			String message = "";
			String from = "helperland.janesh@gmail.com";
			String subject = "";
			String to = user.getEmail();
			
			sendEmail(message, subject, to, from);
		}
	}
	
	@RequestMapping(value="/reschedulebtndashboard/{service_req_id},{service_start_date},{startTime}",method = RequestMethod.GET)
	public @ResponseBody void ajaxreschedulebtndashboard(
			@PathVariable("service_req_id") int service_req_id,
			@PathVariable("service_start_date") String service_start_date,
			@PathVariable("startTime") String startTime,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		serviceRequest.setService_req_id(service_req_id);
		serviceRequest.setService_start_date(service_start_date);
		serviceRequest.setService_start_time(startTime);
		
		
		ServiceRequest servicedata = this.userService.getSErviceDetailsForReschedule(serviceRequest);
		
		if(servicedata.getService_provider_id() == 0) {
			this.userService.rescheduleServiceRequest(serviceRequest);
			String subject = "New Service Request";
			String from = "helperland.janesh@gmail.com";
			String message = "service Request Id = " + service_req_id +"is reschedule";
			int uid=0;
			List<User> emaillist = this.bookaService.getAllEmail(uid);
			String to = emaillist.stream().map(User::getEmail).collect(Collectors.joining(","));
			sendEmail(message, subject, to, from);
			
			
		}
		
		else {
			List<ServiceRequest> spDetails = this.userService.getSPDetails(servicedata.getService_provider_id());
			
			Iterator<ServiceRequest> iterator = spDetails.iterator();
			
			while(iterator.hasNext()) {
				if(service_start_date.equals(iterator.next().getService_start_date())){
					this.userService.rescheduleServiceRequestifSpNotFree(serviceRequest);

						String subject = "New Service Request";
						String from = "helperland.janesh@gmail.com";
						String message = "service Request Id = 35" + service_req_id +"is reschedule";
						int uid=0;
						List<User> emaillist = this.bookaService.getAllEmail(uid);
						String to = emaillist.stream().map(User::getEmail).collect(Collectors.joining(","));
						sendEmail(message, subject, to, from);
					break;
				}
				else {
					this.userService.rescheduleServiceRequest(serviceRequest);
					String subject = "New Service Request";
					String from = "helperland.janesh@gmail.com";
					String message = "service Request Id = " + service_req_id +"is reschedule";
					int uid=0;
					List<User> emaillist = this.bookaService.getAllEmail(uid);
					String to = emaillist.stream().map(User::getEmail).collect(Collectors.joining(","));
					sendEmail(message, subject, to, from);
				}
			}
		}
		

	}
	
	@RequestMapping(value="/showserviceHistory",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<ServiceRequest> ajaxshowserviceHistory(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<ServiceRequest> serviceRequest2 = this.userService.getAllServiceHistory(uid);
		
		return serviceRequest2;
	}
	
	@RequestMapping(value="/ratingserviceurl/{sp_id},{on_time_arriaval},{friendly},{quality_of_service},{sr_id}",method = RequestMethod.GET)
	public @ResponseBody void ajaxratingservice(
			@PathVariable("sp_id") int sp_id,
			@PathVariable("on_time_arriaval") int on_time_arriaval,
			@PathVariable("friendly") int friendly,
			@PathVariable("quality_of_service") int quality_of_service,
			@PathVariable("sr_id") int sr_id,
			@ModelAttribute ServiceRequest serviceRequest, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		
		
		float avg_rating = (on_time_arriaval + friendly + quality_of_service) /3;
		
		int ratings = Math.round(avg_rating);
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		Rating rating = new Rating();
		rating.setRating_from(uid);
		rating.setRating_to(sp_id);
		rating.setOn_time_arrival(on_time_arriaval);
		rating.setFriendly(friendly);
		rating.setQuality_of_service(quality_of_service);
		rating.setRating_date(dtf.format(date));
		rating.setRatings(ratings);
		rating.setService_req_id(sr_id);
		
		this.userService.ratingService(rating);

	}
	
	public void sendEmail(String message, String subject, String to, String from) {

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
