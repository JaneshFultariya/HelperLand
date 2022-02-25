package helperland.dao;

import java.util.List;

import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

public interface UserDao {

	public int edtUserDetails(User user);
	
	public int updtPasswordDetails(String old_password, String updtpassword, int uid);
	
	public int updateAddress(UserAddress userAddress);
	
	public int deleteAddress(UserAddress userAddress);
}
