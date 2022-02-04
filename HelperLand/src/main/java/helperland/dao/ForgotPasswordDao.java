package helperland.dao;

import helperland.model.User;

public interface ForgotPasswordDao {
	
	public int updateForgotUser(User user);
	public String getForgotUser(User user);
}
