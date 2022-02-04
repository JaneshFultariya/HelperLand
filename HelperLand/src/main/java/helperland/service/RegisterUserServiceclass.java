package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ContactusDao;
import helperland.dao.RegisterUserDao;
import helperland.model.User;

@Service
public class RegisterUserServiceclass implements RegisterUserService{

	
	@Autowired
	private RegisterUserDao registerUserDao;
	
	
	public int createRegisterUser(User user) {
		return this.registerUserDao.saveRegisterUser(user);
	}

}
