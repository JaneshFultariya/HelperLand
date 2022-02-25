package helperland.service;

import helperland.model.User;
import helperland.model.UserAddress;

public interface UserService {

	public int edtUserDetails(User user);

	public int updtPasswordDetails(String old_password, String updtpassword, int uid);

	public int updateAddress(UserAddress userAddress);

	public int deleteAddress(UserAddress userAddress);

}
