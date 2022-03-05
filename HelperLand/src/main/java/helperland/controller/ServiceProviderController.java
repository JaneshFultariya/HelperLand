package helperland.controller;

import java.awt.Dialog.ModalExclusionType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

import helperland.model.ServiceRequest;
import helperland.model.User;
import helperland.service.ServiceProviderService;
import helperland.service.UserService;

@RestController
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class ServiceProviderController {

	@Autowired
	ServiceProviderService serviceProviderService;
	
	@Autowired 
	UserService userService;
	
	
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
		
		return this.serviceProviderService.acceptService(serviceRequest);
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
}
