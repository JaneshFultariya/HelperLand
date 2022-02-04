package helperland.controller;

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
import org.springframework.web.servlet.view.RedirectView;

import antlr.collections.List;
import helperland.dao.ContactusDao;
import helperland.dao.ForgotPasswordDao;
import helperland.model.Contactus;
import helperland.model.User;
import helperland.service.ContactusService;
import helperland.service.ContactusServiceclass;
import helperland.service.ForgotpasswordServiceimpl;
import helperland.service.LoginService;
import helperland.service.LoginServiceimpl;
import helperland.service.RegisterUserServiceclass;
import net.bytebuddy.agent.builder.AgentBuilder.FallbackStrategy.Simple;

@Controller
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
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
	

	@RequestMapping({"/homepage","/"})
	public String homepage() {
		System.out.println("url");
		return "homepage";
	}
	
	@RequestMapping("/aboutus")
	public String aboutus() {
		System.out.println("url");
		return "aboutus";
	}
	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public String contactUs() {
		System.out.println("url");
		return "contactUs";
	}
	
	@RequestMapping(value  = "/contactUs" , method=RequestMethod.POST)
	public String handleContactUs(@ModelAttribute helperland.model.Contactus contactUs , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "contactUs";
		}
		else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			contactUs.setName(contactUs.getFirstname() , contactUs.getLastname());
			contactUs.setCreated_by(this.contactUsService.getContactUsUser(contactUs));
			contactUs.setCreated_on(dtf.format(date));
			this.contactUsService.createContactUs(contactUs);
			return "contactUs";
		}
	}
	
	@RequestMapping(value  = "/registerUser" , method=RequestMethod.POST)
	public String handleRegisterUser(@ModelAttribute helperland.model.User user , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "homepage";
		}
		else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			user.setCreated_date(dtf.format(date));
			user.setModified_date(dtf.format(date));
			user.setUser_type_id(3);
			this.registerUserService.createRegisterUser(user);
			
//			contactUs.setName(contactUs.getFirstname() , contactUs.getLastname());
//			contactUs.setCreated_by(this.contactUsService.getContactUsUser(contactUs));
//			contactUs.setCreated_on(dtf.format(date));
//			this.contactUsService.createContactUs(contactUs);
			return "homepage";
		}
	}
	
	@RequestMapping(value  = "/registerServiceProvider" , method=RequestMethod.POST)
	public String handleRegisterServiceProvider(@ModelAttribute helperland.model.User user , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "homepage";
		}
		else {
			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			user.setCreated_date(dtf.format(date));
			user.setModified_date(dtf.format(date));
			user.setUser_type_id(2);
			this.registerUserService.createRegisterUser(user);

			return "homepage";
		}
	}
	
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute helperland.model.User user , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "homepage";
		}
		else {
			
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			
//			contactUs.setName(contactUs.getFirstname() , contactUs.getLastname());
//			contactUs.setCreated_by(this.contactUsService.getContactUsUser(contactUs));
//			contactUs.setCreated_on(dtf.format(date));
//			this.contactUsService.createContactUs(contactUs);
			
			int login_type = this.loginService.getUser(user);
			
			System.out.println(login_type);
			
			
			if(login_type == 1) {
				return "admin";
			}
			
			else if(login_type == 2) {
				return "serviceprovider";
			}
			
			else if(login_type == 3) {
				return "user";
				
			}
			
			else {
				return "homepage";
			}
			
			
		}
		
		
	} 
	
	@RequestMapping(value="/forgetpassword",method = RequestMethod.POST)
	public String handleForgetpassword(@ModelAttribute helperland.model.User user , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			java.util.List<FieldError> errors = br.getFieldErrors();
		    for (FieldError error : errors ) {
		        System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
		    }
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "homepage";
		}
		else {
			
			System.out.println(user.getEmail());

			
			String forgotpasswordService = this.forgotpasswordService.getForgotUser(user);
			
			System.out.println(forgotpasswordService);
			
			if(user.getEmail().trim().equals( forgotpasswordService.trim())) {
				
				String newPass = randomPasswordGenerator();
				
				sendEmail(forgotpasswordService,newPass);
				return "aboutus";
			}
			else {
				return "faq";
			}
			
		}
		
		
	} 
	
//	@RequestMapping(value="/handle-contact", method = RequestMethod.POST)
//	public RedirectView handleContact(@ModelAttribute Contactus contactus, HttpServletRequest request) {
//		System.out.println(contactus);
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl(request.getContextPath()+"/");
//		return redirectView;
//	}
	
	
	public void sendEmail(String email, String pass) {

		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
//		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.mailtrap.io");
		prop.put("mail.smtp.port", "2525");
		prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
		
		
		Session session = Session.getInstance(prop, new Authenticator() {
		    @Override
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication("f773758cd3ae4c", "4bef7c8b37b133");
		    }
		});
		
		session.setDebug(true);
		
		
		try {
			String recieverEmail = email;
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("helperland@gmail.com"));
			message.setRecipients(
					  Message.RecipientType.TO, InternetAddress.parse(recieverEmail));
					message.setSubject("Mail Subject");

					String msg = "Your new Password:-" + pass;
//					message.setText(msg);
					MimeBodyPart mimeBodyPart = new MimeBodyPart();
					mimeBodyPart.setContent(msg, "text/html; charset=utf-8");

					Multipart multipart = new MimeMultipart();
					multipart.addBodyPart(mimeBodyPart);

					message.setContent(multipart);

					Transport.send(message);
					
					System.out.println("Success");
					
					User updateUser = new User();
					updateUser.setEmail(email);
					updateUser.setPassword(pass);
					
					int update_status = this.forgotpasswordService.updateForgotUser(updateUser);
					
					System.out.println(update_status);
					
					
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String randomPasswordGenerator() {
		
		int len = 14;
		
		char passwordScope[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
								'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
								'@','#','/','$','0','1','2','3','4','5','6','7','8','9'};
		
		Random random = new Random();
		
		StringBuilder password = new StringBuilder();
		
		for(int i=0;i<len;i++) {
			int temp = random.nextInt(66);
			password.append(passwordScope[temp]);
		}
		
		return password.toString();
	}
	
	@RequestMapping("/faq")
	public String faq() {
		System.out.println("url");
		return "faq";
	}
	@RequestMapping("/price")
	public String price() {
		System.out.println("url");
		return "price";
	}
	@RequestMapping("/becomeapro")
	public String becomeapro() {
		System.out.println("url");
		return "becomeapro";
	}
	@RequestMapping("/bookservice")
	public String bookservice() {
		System.out.println("url");
		return "bookservice";
	}
	
	
	
	
//	@RequestMapping("/admin")
//	public String admin() {
//		System.out.println("url");
//		return "admin";
//	}
//	
//	@RequestMapping("/user")
//	public String user() {
//		System.out.println("url");
//		return "user";
//	}
//
//	@RequestMapping("/aboutus")
//	public String aboutus() {
//		System.out.println("url");
//		return "aboutus";
//	}
}
