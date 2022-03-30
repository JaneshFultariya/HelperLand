package helperland.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorPage {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String ErrorPages() {

		return "errorpage";
		
	}
	
}
