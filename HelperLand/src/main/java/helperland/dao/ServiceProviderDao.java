package helperland.dao;

import java.util.HashMap;
import java.util.List;

import helperland.dto.ServiceRequestDto;
import helperland.model.Favoriteandblocked;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceScheduleEntity;
import helperland.model.User;
import helperland.model.UserAddress;

public interface ServiceProviderDao {

	public List<ServiceRequest> getAllServiceRequest(int uid, int postal);
	
	
	public int acceptService(ServiceRequest serviceRequest);
	
	public HashMap<String, Object> getAllCustomerServiceDetails(int servicerequestid);
	
	public List<ServiceRequest> getAllUpcomingServices(int uid);
	
	public int cancelspServiceRequest(ServiceRequest serviceRequest);
	
	public List<ServiceRequest> getAllspservicehistory(int uid);
	
	public int completespServiceRequest(ServiceRequest serviceRequest);
	
	public List<User> getUserEmail(int service_req_id);
	
	public int updtspDetails(User user, UserAddress userAddress);
	
	
	public UserAddress getAddress(int uid);
	
	
	public String getOneEmail(int service_req_id);
	
	
	public List<Rating> getAllspRatings(int uid);
	
	public List<ServiceScheduleEntity> getServiceSchedule(int uid);
	
	
	public List<User> getUserList(int uid);
	
	
	public Favoriteandblocked getBlockCustomerList(int uid, int spid);
	
	
	public int insertBlockCustomer(Favoriteandblocked favoriteandblocked);
	
	
	public int updateBlockCustomer(Favoriteandblocked favoriteandblocked);
	
	
	public int getUserStatus(int uid);


	public ServiceRequest servicestartDate(int service_req_id);


	public int getState(String service_start_date, String service_start_time, int uid, float f);
	
	
//	public String getServiceDate(ServiceRequest serviceRequest);
//
//
//	public List<Float> getServiceTotalTimeList(String serviceDate);
//
//
//	public float getServiceTime(ServiceRequest serviceRequest);
}
