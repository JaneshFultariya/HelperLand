package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ContactusDao;
import helperland.dao.LoginDao;
import helperland.model.User;

@Service
public class LoginServiceimpl implements LoginService {

	@Autowired
	private LoginDao loginDao;

	public User getUser(User user) {
		return this.loginDao.getUser(user);
	}

}
