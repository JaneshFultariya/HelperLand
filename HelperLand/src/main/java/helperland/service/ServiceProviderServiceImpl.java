package helperland.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ServiceProviderDao;
import helperland.dto.ServiceRequestDto;
import helperland.model.Favoriteandblocked;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceScheduleEntity;
import helperland.model.User;
import helperland.model.UserAddress;

@Service
public class ServiceProviderServiceImpl implements ServiceProviderService {

	@Autowired
	ServiceProviderDao serviceProviderDao;
	
	public List<ServiceRequest> getAllServiceRequest() {
		return serviceProviderDao.getAllServiceRequest();
	}

	public int acceptService(ServiceRequest serviceRequest) {
		return serviceProviderDao.acceptService(serviceRequest);
	}

	public HashMap<String, Object> getAllCustomerServiceDetails(int servicerequestid) {
		return serviceProviderDao.getAllCustomerServiceDetails(servicerequestid);
	}

	public List<ServiceRequest> getAllUpcomingServices(int uid) {
//		List<ServiceRequest> serviceRequestList =
				return serviceProviderDao.getAllUpcomingServices(uid);
		
//		for(Object object:serviceRequestList) {
//			List<Object> objects1 = new ArrayList<Object>(); 
//			objects1.add(object);
//			
//			for(Object object2:objects1) {
//				System.out.println(object2);
//			}
//			
//		}
	}

	public int cancelspServiceRequest(ServiceRequest serviceRequest) {
		return serviceProviderDao.cancelspServiceRequest(serviceRequest);
	}

	public List<ServiceRequest> getAllspservicehistory(int uid) {
		return serviceProviderDao.getAllspservicehistory(uid);
	}

	public int completespServiceRequest(ServiceRequest serviceRequest) {
		return serviceProviderDao.completespServiceRequest(serviceRequest);
	}

	public List<User> getUserEmail(int service_req_id) {
		return serviceProviderDao.getUserEmail(service_req_id);
	}

	public int updtspDetails(User user,UserAddress userAddress) {
		return serviceProviderDao.updtspDetails(user,userAddress);
	}

	public UserAddress getAddress(int uid) {
		return serviceProviderDao.getAddress(uid);
	}

	public String getOneEmail(int service_req_id) {
		return serviceProviderDao.getOneEmail(service_req_id);
	}

	public List<Rating> getAllspRatings(int uid) {
		return serviceProviderDao.getAllspRatings(uid);
	}

	public List<ServiceScheduleEntity> getServiceSchedule(int uid) {
		return serviceProviderDao.getServiceSchedule(uid);
	}

	public List<User> getUserList(int uid) {
		return serviceProviderDao.getUserList(uid);
	}

	public Favoriteandblocked getBlockCustomerList(int uid, int spid) {
		return serviceProviderDao.getBlockCustomerList(uid, spid);
	}

	public int insertBlockCustomer(Favoriteandblocked favoriteandblocked) {
		return serviceProviderDao.insertBlockCustomer(favoriteandblocked);
	}

	public int updateBlockCustomer(Favoriteandblocked favoriteandblocked) {
		return serviceProviderDao.updateBlockCustomer(favoriteandblocked);
	}

}
