package helperland.dao;

import java.util.List;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

public interface BookaServiceDao {

	public boolean getUserAddress(String pincode);
	
	
	public int saveaddress(UserAddress userAddress);
	
	
	public List<UserAddress> getUserallAddress(int uid);


	public UserAddress getSelectedAddress(int user_address_id);


	public int saveSelectedAddress(ServiceRequestAddress serviceRequestAddress);


	public int saveServiceRequest(ServiceRequest serviceRequest);

	public int saveExtraService(List<ServiceRequestExtra> serviceRequestExtraslist);
	

	
}
