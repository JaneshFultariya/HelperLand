package helperland.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.jpa.internal.util.LogHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;
import helperland.service.BookaService;

@RestController
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class BookaServiceController{

	@Autowired
	BookaService bookaService;
	
	@RequestMapping(value="/postalcode/{pincode}",method = RequestMethod.GET)
	public @ResponseBody String ajaxSearch(@PathVariable("pincode") String pincode) {
		Boolean pin = this.bookaService.getUserAddress(pincode);
		return pin.toString();
	}
	
	@RequestMapping(value="/addaddress/{AddressLine1},{AddressLine2},{postalcode},{City},{Mobile}",method = RequestMethod.GET)
	public @ResponseBody void ajaxAddAddress(@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2,
			@PathVariable("postalcode") String postalcode,
			@PathVariable("City") String City,
			@PathVariable("Mobile") String Mobile,
			@ModelAttribute helperland.model.UserAddress userAddress, 
			BindingResult br , Model model,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		System.out.println(uid);
		userAddress.setUserid(uid);
		int pin = this.bookaService.addAddress(userAddress);
		
//		return pin;
	}
	
	@RequestMapping(value="/showaddress",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<UserAddress> ajaxshowAddress(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<UserAddress> userAddress2 = this.bookaService.getUserallAddress(uid);
		
		System.out.println(userAddress2.getClass().getSimpleName());
		
		return userAddress2;
	}
	
	@RequestMapping(value="/finalsave/{address_id},{total_cost},{sub_total},{comments},{extratime},{postalcode},{service_start_date},{petcheck},{listArray}",method = RequestMethod.GET)
	public @ResponseBody String ajaxsaverequest(HttpServletRequest request,
			@PathVariable("address_id") int address_id,
			@PathVariable("total_cost") float total_cost,
			@PathVariable("sub_total") float sub_total,
			@PathVariable("comments") String comments,
			@PathVariable("extratime") float extratime,
			@PathVariable("postalcode") int postalcode,
			@PathVariable("service_start_date") String service_start_date,
			@PathVariable("petcheck") String petcheck,
			@PathVariable("listArray") String listArray) throws Exception {
		
		
		System.out.println(petcheck);
		System.out.println(petcheck.getClass().getSimpleName());
		
		String[] extraService = listArray.split(" ",0); 
		
		for(int i=0;i<extraService.length;i++) {
			System.out.println(extraService[i]);
		}
		
		
		
		HttpSession session = request.getSession();
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		ServiceRequest serviceRequest = new ServiceRequest();
		serviceRequest.setTotal_cost(total_cost);
		serviceRequest.setSub_total(sub_total);
		serviceRequest.setComments(comments);
		serviceRequest.setExtra_hours(extratime);
		serviceRequest.setPostal_code(postalcode);
		serviceRequest.setService_start_date(service_start_date);
		serviceRequest.setCreated_date(dtf.format(date));
		serviceRequest.setHas_pets(petcheck);
		serviceRequest.setPayment_transaction_ref_no("0");
		serviceRequest.setUser_id(uid);
		int temp1 = this.bookaService.saveServiceRequest(serviceRequest);
		
		System.out.println(temp1 + "hiiii");
		
		UserAddress seleteduseraddress = this.bookaService.getSelectedAddress(address_id);
		
		ServiceRequestAddress serviceRequestAddress = new ServiceRequestAddress();
		serviceRequestAddress.setAddressLine1(seleteduseraddress.getAddressLine1());
		serviceRequestAddress.setAddressLine2(seleteduseraddress.getAddressLine2());
		serviceRequestAddress.setCity(seleteduseraddress.getCity());
		serviceRequestAddress.setEmail(seleteduseraddress.getEmail());
		serviceRequestAddress.setMobile(seleteduseraddress.getMobile());
		serviceRequestAddress.setPostalCode(seleteduseraddress.getPostalcode());
		serviceRequestAddress.setState(seleteduseraddress.getState());
		
		this.bookaService.saveSelectedAddress(serviceRequestAddress);

		List<ServiceRequestExtra> serviceRequestExtraslist = new ArrayList<ServiceRequestExtra>();
		for(int i=0;i<extraService.length;i++) {
			ServiceRequestExtra serviceRequestExtra = new ServiceRequestExtra();
			
			serviceRequestExtra.setService_req_id(temp1);
			serviceRequestExtra.setService_extra_(extraService[i]);
			
			serviceRequestExtraslist.add(serviceRequestExtra);
		}
		
		
		this.bookaService.saveExtraService(serviceRequestExtraslist);
		
		return "user";
	}
	
}
