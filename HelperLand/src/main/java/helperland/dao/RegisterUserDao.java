package helperland.dao;

import helperland.model.Contactus;
import helperland.model.Rating;
import helperland.model.User;
import helperland.model.UserAddress;

public interface RegisterUserDao {
public int saveRegisterUser(User user);
	


public User getAllEmail(String email);

public int createRegisterUserAddress(UserAddress userAddress);

public int createRatingUser(Rating rating);
}
