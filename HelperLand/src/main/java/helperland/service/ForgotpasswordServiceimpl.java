package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ForgotPasswordDao;
import helperland.dao.LoginDao;
import helperland.model.User;

@Service
public class ForgotpasswordServiceimpl implements ForgotpasswordService {

	@Autowired
	private ForgotPasswordDao forgotPasswordDao;
	
	
	public String getForgotUser(User user) {
		return this.forgotPasswordDao.getForgotUser(user);
	}


	public int updateForgotUser(User user) {
		return this.forgotPasswordDao.updateForgotUser(user);
	}

}
