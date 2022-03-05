package helperland.dao;

import java.util.HashMap;
import java.util.List;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

public interface UserDao {

	public int edtUserDetails(User user);
	
	public int updtPasswordDetails(String old_password, String updtpassword, int uid);
	
	public int updateAddress(UserAddress userAddress);
	
	public int deleteAddress(UserAddress userAddress);
	
	public List<ServiceRequest> getAllService(int uid);
	
	
	public HashMap<String, Object> getAllServiceDetails(int servicerequestid);
	
	
	public int cancelServiceRequest(ServiceRequest serviceRequest);
	
	public int rescheduleServiceRequest(ServiceRequest serviceRequest);
	
	public List<ServiceRequest> getAllServiceHistory(int uid);
}
