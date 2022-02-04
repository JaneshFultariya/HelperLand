package helperland.service;

import helperland.model.User;

public interface ForgotpasswordService {

	public int updateForgotUser(User user);
	
	public String getForgotUser(User user);
}
