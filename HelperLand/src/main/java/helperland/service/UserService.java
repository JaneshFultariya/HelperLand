package helperland.service;

import java.util.HashMap;
import java.util.List;

import helperland.dto.ServiceRequestDto;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.User;
import helperland.model.UserAddress;

public interface UserService {

	public int edtUserDetails(User user);

	public int updtPasswordDetails(String old_password, String updtpassword, int uid);

	public int updateAddress(UserAddress userAddress);

	public int deleteAddress(UserAddress userAddress);

	public List<ServiceRequest> getAllService(int uid);

	public HashMap<String, Object> getAllServiceDetails(int servicerequestid);

	public int cancelServiceRequest(ServiceRequest serviceRequest);

	public int rescheduleServiceRequest(ServiceRequest serviceRequest);

	public List<ServiceRequest> getAllServiceHistory(int uid);

	public int ratingService(Rating rating);

	public Object[] getSErviceDetailsForCancel(ServiceRequest serviceRequest);

	public ServiceRequest getSErviceDetailsForReschedule(ServiceRequest serviceRequest);

	public List<ServiceRequest> getSPDetails(int service_provider_id);

	public int rescheduleServiceRequestifSpNotFree(ServiceRequest serviceRequest);

	public double getavgsprating(String spid);



}
