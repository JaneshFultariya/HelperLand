package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.BookaServiceDao;
import helperland.dao.UserDao;
import helperland.model.User;
import helperland.model.UserAddress;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	public int edtUserDetails(User user) {
		
		return userDao.edtUserDetails(user); 
	}

	public int updtPasswordDetails(String old_password, String updtpassword, int uid) {
		
		return userDao.updtPasswordDetails(old_password,updtpassword,uid); 
	}

	public int updateAddress(UserAddress userAddress) {
		return userDao.updateAddress(userAddress);
	}

	public int deleteAddress(UserAddress userAddress) {
		return userDao.deleteAddress(userAddress);
	}

}
