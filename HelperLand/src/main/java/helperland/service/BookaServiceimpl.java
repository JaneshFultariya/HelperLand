package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.BookaServiceDao;
import helperland.dao.LoginDao;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.UserAddress;

@Service
public class BookaServiceimpl implements BookaService{

	@Autowired
	private BookaServiceDao bookaServiceDao;
	
	public boolean getUserAddress(String pincode) {
		return bookaServiceDao.getUserAddress(pincode);
	}

	public int addAddress(UserAddress userAddress) {
		return bookaServiceDao.saveaddress(userAddress);
	}

	public List<UserAddress> getUserallAddress(int uid) {
		return bookaServiceDao.getUserallAddress(uid);
	}

	public UserAddress getSelectedAddress(int user_address_id) {
		
		return bookaServiceDao.getSelectedAddress(user_address_id);
	}

	public int saveSelectedAddress(ServiceRequestAddress serviceRequestAddress) {
		return bookaServiceDao.saveSelectedAddress(serviceRequestAddress);
	}

	public int saveServiceRequest(ServiceRequest serviceRequest) {
		return bookaServiceDao.saveServiceRequest(serviceRequest);
	}

	public int saveExtraService(List<ServiceRequestExtra> serviceRequestExtraslist) {
		return bookaServiceDao.saveExtraService(serviceRequestExtraslist);
		
	}


}
