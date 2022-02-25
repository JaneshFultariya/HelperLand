package helperland.controller;

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
			System.out.println("errors");
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
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		System.out.println(uid);
		userAddress.setUserid(uid);
		String uemail = session.getAttribute("useremail") + "" ;
		userAddress.setEmail(uemail);
		int pin = this.bookaService.addAddress(userAddress);

	}
	
	@RequestMapping(value="/showaddresssettings",method = RequestMethod.GET,  produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	public List<UserAddress> ajaxshowaddresssettings(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		
		List<UserAddress> userAddress2 = this.bookaService.getUserallAddress(uid);
		
		System.out.println(userAddress2.getClass().getSimpleName());
		
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
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		System.out.println(uid);
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
		System.out.println(session.getAttribute("loginUser").getClass().getSimpleName());
		String temp = "" + session.getAttribute("loginUser");
		int uid = Integer.parseInt(temp);
		System.out.println(uid);
		userAddress.setUserid(uid);
		
		int adressId = Integer.parseInt(user_address_id);
		userAddress.setUser_address_id(adressId);
		
		
		this.userService.deleteAddress(userAddress);

	}
	
}
