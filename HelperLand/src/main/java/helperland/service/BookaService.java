package helperland.service;

import java.util.List;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

public interface BookaService {

	public boolean getUserAddress(String pincode);
	
	public int addAddress(UserAddress userAddress);
	
	public List<UserAddress> getUserallAddress(int uid);
	
	public UserAddress getSelectedAddress(int user_address_id);
	
	public int saveSelectedAddress(ServiceRequestAddress serviceRequestAddress);
	
	public int saveServiceRequest(ServiceRequest serviceRequest);

	public int saveExtraService(List<ServiceRequestExtra> serviceRequestExtraslist);

	public List<User> getAllEmail(int uid);
	
}
