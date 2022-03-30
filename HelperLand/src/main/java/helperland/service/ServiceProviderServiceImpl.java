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
	
	public List<ServiceRequest> getAllServiceRequest(int uid,int postal) {
		return serviceProviderDao.getAllServiceRequest(uid,postal);
	}

	public int acceptService(ServiceRequest serviceRequest) {
		return serviceProviderDao.acceptService(serviceRequest);
	}

	public HashMap<String, Object> getAllCustomerServiceDetails(int servicerequestid) {
		return serviceProviderDao.getAllCustomerServiceDetails(servicerequestid);
	}

	public List<ServiceRequest> getAllUpcomingServices(int uid) {
				return serviceProviderDao.getAllUpcomingServices(uid);
		
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

	public int getUserStatus(int uid) {
		return serviceProviderDao.getUserStatus(uid);
	}

	public ServiceRequest servicestartDate(int service_req_id) {
		return serviceProviderDao.servicestartDate(service_req_id);
	}

	public int getState(String service_start_date, String service_start_time,int uid, float f) {
		return serviceProviderDao.getState(service_start_date,service_start_time,uid, f);
	}


}
