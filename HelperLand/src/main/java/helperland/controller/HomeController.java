package helperland.controller;

import java.awt.Window;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import antlr.collections.List;
import helperland.dao.ContactusDao;
import helperland.dao.ForgotPasswordDao;
import helperland.model.Contactus;
import helperland.model.ServiceRequest;
import helperland.model.User;
import helperland.model.UserAddress;
import helperland.service.ContactusService;
import helperland.service.ContactusServiceclass;
import helperland.service.ForgotpasswordServiceimpl;
import helperland.service.LoginService;
import helperland.service.LoginServiceimpl;
import helperland.service.RegisterUserServiceclass;
import helperland.service.ServiceProviderService;
import helperland.service.UserService;
import net.bytebuddy.agent.builder.AgentBuilder.FallbackStrategy.Simple;

@Controller
@ComponentScan(basePackages = { "helperland.dao,helperland.models,helperland.service,helperland.interceptors" })
public class HomeController {

//	@Autowired
//	private ContactusDao contactusDao;

	@Autowired
	private ContactusServiceclass contactUsService;

	@Autowired
	private RegisterUserServiceclass registerUserService;

	@Autowired
	private LoginServiceimpl loginService;

	@Autowired
	private ForgotpasswordServiceimpl forgotpasswordService;

	@Autowired
	ServiceProviderService serviceProviderService;

	@RequestMapping({ "/homepage", "/" })
	public String homepage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("loginUsertype"));
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "homepage";
	}

	@RequestMapping("/aboutus")
	public String aboutus(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "aboutus";
	}

	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public String contactUs(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "contactUs";
	}

	@RequestMapping(value = "/contactUs", method = RequestMethod.POST)
	public String handleContactUs(@ModelAttribute Contactus contactUs, BindingResult br, Model model) {

		if (br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
			}
			System.out.println("errors");
			model.addAttribute("error", "please enter all fields to submit form");
			model.addAttribute("displayError", "style='display: block !important;'");
			return "contactUs";
		} else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success", "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			contactUs.setName(contactUs.getFirstname(), contactUs.getLastname());
			contactUs.setCreated_by(this.contactUsService.getContactUsUser(contactUs));
			contactUs.setCreated_on(dtf.format(date));
			this.contactUsService.createContactUs(contactUs);
			return "contactUs";
		}
	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String handleRegisterUser(@ModelAttribute User user, BindingResult br, Model model) {

		if (br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
			}
			System.out.println("errors");
			model.addAttribute("error", "please enter all fields to submit form");
			model.addAttribute("displayError", "style='display: block !important;'");
			return "homepage";
		} else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success", "You Registered successfully.... Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			user.setCreated_date(dtf.format(date));
			user.setModified_date(dtf.format(date));
			user.setUser_type_id(3);
			user.setIs_approved(1);
			this.registerUserService.createRegisterUser(user);

			return "homepage";
		}
	}

	@RequestMapping(value = "/registerServiceProvider", method = RequestMethod.POST)
	public String handleRegisterServiceProvider(@ModelAttribute User user, @ModelAttribute UserAddress userAddress,
			BindingResult br, Model model) {

		if (br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
			}
			System.out.println("errors");
			model.addAttribute("error", "please enter all fields to submit form");
			model.addAttribute("displayError", "style='display: block !important;'");
			return "homepage";
		} else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success", "You Registered successfully.... Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			user.setCreated_date(dtf.format(date));
			user.setModified_date(dtf.format(date));
			user.setUser_type_id(2);
			user.setUser_profile_pic("car");
			user.setIs_approved(0);
			userAddress.setAddressLine1(null);
			userAddress.setAddressLine2(null);
			userAddress.setCity(null);
			userAddress.setEmail(null);
			int uid = this.registerUserService.createRegisterUser(user);
			userAddress.setUserid(uid);
			userAddress.setMobile(null);
			this.registerUserService.createRegisterUserAddress(userAddress);
			return "homepage";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute User user, BindingResult br, Model model, HttpServletRequest request) {

		if (br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
			}
			System.out.println("errors");
			model.addAttribute("error", "please enter all fields to submit form");
			model.addAttribute("displayError", "style='display: block !important;'");
			return "homepage";
		} else {

			/*
			 * model.addAttribute("success" , "You Login successfully. Thank you!");
			 * model.addAttribute("displaySuccess" , "style='display: block !important;'");
			 */

			User login_user = this.loginService.getUser(user);

			

			if (login_user != null) {
				String temp = "" + login_user.getUser_type_id();
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", login_user.getUser_id());
				session.setAttribute("loginUsertype", temp);
				session.setAttribute("username", login_user.getFirst_name());
				session.setAttribute("useremail", login_user.getEmail());
				session.setAttribute("userlastname", login_user.getLast_name());
				session.setAttribute("usermobile", login_user.getMobile());
				session.setAttribute("userAvatar", login_user.getUser_profile_pic());

				session.setMaxInactiveInterval(10 * 60);

				if (login_user.getUser_type_id() == 1) {
					return "redirect:admin";
				}

				else if (login_user.getUser_type_id() == 2) {
//					java.util.List<ServiceRequest> serviceRequest2 = this.serviceProviderService.getAllServiceRequest();
//
//					System.out.println(serviceRequest2.toString());
//
//					model.addAttribute("serviceDetails", serviceRequest2);
					return "redirect:serviceprovider";
				}

				else if (login_user.getUser_type_id() == 3) {

					return "redirect:user";
					

				}

				else {
					return "homepage";
				}
			} else {
				return "homepage";
			}

		}

	}

	@RequestMapping(value = "/forgetpassword", method = RequestMethod.POST)
	public String handleForgetpassword(@ModelAttribute User user, BindingResult br, Model model) {

		if (br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println(error.getObjectName() + " - " + error.getDefaultMessage());
			}
			System.out.println("errors");
			model.addAttribute("error", "please enter all fields to submit form");
			model.addAttribute("displayError", "style='display: block !important;'");
			return "homepage";
		} else {

			System.out.println(user.getEmail());

			System.out.println("preparing to send message ...");

			String subject = "Reset Password";
			String from = "helperland.janesh@gmail.com";

			String forgotpasswordService = this.forgotpasswordService.getForgotUser(user);

			System.out.println(forgotpasswordService);

			if (user.getEmail().trim().equals(forgotpasswordService.trim())) {

				String newPass = randomPasswordGenerator();

				sendEmail(newPass, subject, forgotpasswordService, from);
				return "aboutus";
			} else {
				return "faq";
			}

		}

	}

	public void sendEmail(String pass, String subject, String to, String from) {

		String message = "Your new password is: " + pass;

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

			User updateUser = new User();
			updateUser.setEmail(to);
			updateUser.setPassword(pass);

			int update_status = this.forgotpasswordService.updateForgotUser(updateUser);

			System.out.println(update_status);

			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//	public void sendEmail(String email, String pass) {
//
//		Properties prop = new Properties();
//		prop.put("mail.smtp.auth", true);
//		prop.put("mail.smtp.host", "smtp.mailtrap.io");
//		prop.put("mail.smtp.port", "2525");
//		prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
//		
//		
//		Session session = Session.getInstance(prop, new Authenticator() {
//		    @Override
//		    protected PasswordAuthentication getPasswordAuthentication() {
//		        return new PasswordAuthentication("f773758cd3ae4c", "4bef7c8b37b133");
//		    }
//		});
//		
//		session.setDebug(true);
//		
//		
//		try {
//			String recieverEmail = email;
//			
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("helperland@gmail.com"));
//			message.setRecipients(
//					  Message.RecipientType.TO, InternetAddress.parse(recieverEmail));
//					message.setSubject("Mail Subject");
//
//					String msg = "Your new Password:-" + pass;
//					MimeBodyPart mimeBodyPart = new MimeBodyPart();
//					mimeBodyPart.setContent(msg, "text/html; charset=utf-8");
//
//					Multipart multipart = new MimeMultipart();
//					multipart.addBodyPart(mimeBodyPart);
//
//					message.setContent(multipart);
//
//					Transport.send(message);
//					
//					System.out.println("Success");
//					
//					User updateUser = new User();
//					updateUser.setEmail(email);
//					updateUser.setPassword(pass);
//					
//					int update_status = this.forgotpasswordService.updateForgotUser(updateUser);
//					
//					System.out.println(update_status);
//					
//					
//		} catch (AddressException e) {
//			e.printStackTrace();
//		} catch (MessagingException e) {
//			e.printStackTrace();
//		}
//	}

	public String randomPasswordGenerator() {

		int len = 14;

		char passwordScope[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
				'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
				'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '@', '#', '/', '$', '0', '1', '2',
				'3', '4', '5', '6', '7', '8', '9' };

		Random random = new Random();

		StringBuilder password = new StringBuilder();

		for (int i = 0; i < len; i++) {
			int temp = random.nextInt(66);
			password.append(passwordScope[temp]);
		}

		return password.toString();
	}

	@RequestMapping("/faq")
	public String faq(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "faq";
	}

	@RequestMapping("/price")
	public String price(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "price";
	}

	@RequestMapping("/becomeapro")
	public String becomeapro(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println("url");
		return "becomeapro";
	}

	@RequestMapping("/bookservice")
	public String bookservice(HttpServletRequest request) {

		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("loginUser"));
		System.out.println(session.getAttribute("loginUser"));

		if (session.getAttribute("loginUser") != null && session.getAttribute("loginUsertype").equals("3")) {
			System.out.println(session.getAttribute("loginUsertype").getClass().getSimpleName());
			System.out.println("url");
			return "bookservice";
		} else {

			request.setAttribute("notfoundalert", "alert");

			return "homepage";
		}

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "homepage";
	}

//	@RequestMapping("/admin")
//	public String admin() {
//		System.out.println("url");
//		return "admin";
//	}
//	
	@RequestMapping(value = "/user")
	public String user(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser"));

		if (session.getAttribute("loginUser") != null && session.getAttribute("loginUsertype").equals("3")) {
			model.addAttribute("htmluseremail", session.getAttribute("useremail"));
			model.addAttribute("htmlusername", session.getAttribute("username"));
			model.addAttribute("htmllastname", session.getAttribute("userlastname"));
			model.addAttribute("htmlMobile", session.getAttribute("usermobile"));
			model.addAttribute("UserType", session.getAttribute("loginUsertype"));
			model.addAttribute("success", "You Login successfully. Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			System.out.println(session.getAttribute("loginUsertype").getClass().getSimpleName());
			System.out.println("url");
			return "user";
		} else {

			request.setAttribute("notfoundalert", "alert");

			return "homepage";
		}
	}

	@RequestMapping(value = "/serviceprovider")
	public String serviceprovider(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser"));

		if (session.getAttribute("loginUser") != null && session.getAttribute("loginUsertype").equals("2")) {
			model.addAttribute("htmluseremail", session.getAttribute("useremail"));
			model.addAttribute("htmlusername", session.getAttribute("username"));
			model.addAttribute("htmllastname", session.getAttribute("userlastname"));
			model.addAttribute("htmlMobile", session.getAttribute("usermobile"));
			model.addAttribute("UserType", session.getAttribute("loginUsertype"));
			model.addAttribute("htmlavatar", session.getAttribute("userAvatar"));
			System.out.println(session.getAttribute("userAvatar") + "+++++++++++++++++++++++++");
			model.addAttribute("success", "You Login successfully. Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			System.out.println(session.getAttribute("loginUsertype").getClass().getSimpleName());
			System.out.println("url");

			UserAddress useraddress1 = this.serviceProviderService
					.getAddress(Integer.parseInt(session.getAttribute("loginUser") + ""));

			model.addAttribute("htmladdline1", useraddress1.getAddressLine1());
			model.addAttribute("htmladdline2", useraddress1.getAddressLine2());
			model.addAttribute("htmlcity", useraddress1.getCity());
			model.addAttribute("htmlpostalcode", useraddress1.getPostalcode());

//			java.util.List<ServiceRequest> serviceRequest2 = this.serviceProviderService.getAllServiceRequest();
//
//			System.out.println(serviceRequest2.toString());
//
//			model.addAttribute("serviceDetails", serviceRequest2);

			return "serviceprovider";
		} else {

			request.setAttribute("notfoundalert", "alert");

			return "homepage";
		}
	}
	
	@RequestMapping(value = "/admin")
	public String admin(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginUser"));

		if (session.getAttribute("loginUser") != null && session.getAttribute("loginUsertype").equals("1")) {
			model.addAttribute("htmluseremail", session.getAttribute("useremail"));
			model.addAttribute("htmlusername", session.getAttribute("username"));
			model.addAttribute("htmllastname", session.getAttribute("userlastname"));
			model.addAttribute("htmlMobile", session.getAttribute("usermobile"));
			model.addAttribute("UserType", session.getAttribute("loginUsertype"));
			model.addAttribute("success", "You Login successfully. Thank you!");
			model.addAttribute("displaySuccess", "style='display: block !important;'");
			System.out.println(session.getAttribute("loginUsertype").getClass().getSimpleName());
			System.out.println("url");
			return "admin";
		} else {

			request.setAttribute("notfoundalert", "alert");

			return "homepage";
		}
	}

}
