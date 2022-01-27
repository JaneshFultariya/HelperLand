package helperland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
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
	@RequestMapping("/contactUs")
	public String contactUs() {
		System.out.println("url");
		return "contactUs";
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
}
