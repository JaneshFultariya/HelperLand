package helperland.dao;

import helperland.model.Contactus;
import helperland.model.User;
import helperland.model.UserAddress;

public interface RegisterUserDao {
public int saveRegisterUser(User user);
	


public int createRegisterUserAddress(UserAddress userAddress);
}
