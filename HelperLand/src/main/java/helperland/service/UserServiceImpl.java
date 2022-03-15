package helperland.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.BookaServiceDao;
import helperland.dao.UserDao;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
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

	public List<ServiceRequest> getAllService(int uid) {
		return userDao.getAllService(uid);
	}

	public HashMap<String, Object> getAllServiceDetails(int servicerequestid) {
		return userDao.getAllServiceDetails(servicerequestid);
		
	}

	public int cancelServiceRequest(ServiceRequest serviceRequest) {
		return userDao.cancelServiceRequest(serviceRequest);
	}

	public int rescheduleServiceRequest(ServiceRequest serviceRequest) {
		return userDao.rescheduleServiceRequest(serviceRequest);
	}

	public List<ServiceRequest> getAllServiceHistory(int uid) {
		return userDao.getAllServiceHistory(uid);
	}

	public int ratingService(Rating rating) {
		return userDao.ratingService(rating);
	}

	public Object[] getSErviceDetailsForCancel(ServiceRequest serviceRequest) {
		return userDao.getServiceDetailsForCancel(serviceRequest);
	}

	public ServiceRequest getSErviceDetailsForReschedule(ServiceRequest serviceRequest) {
		return userDao.getSErviceDetailsForReschedule(serviceRequest);
	}

	public List<ServiceRequest> getSPDetails(int service_provider_id) {
		return userDao.getSPDetails(service_provider_id);
	}

	public int rescheduleServiceRequestifSpNotFree(ServiceRequest serviceRequest) {
		return userDao.rescheduleServiceRequestifSpNotFree(serviceRequest);
	}

	public double getavgsprating(String spid) {
		return userDao.getavgsprating(spid);
	}

}
