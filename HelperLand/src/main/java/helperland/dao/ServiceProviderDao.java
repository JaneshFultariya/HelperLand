package helperland.dao;

import java.util.HashMap;
import java.util.List;

import helperland.model.ServiceRequest;

public interface ServiceProviderDao {

	public List<ServiceRequest> getAllServiceRequest();
	
	
	public int acceptService(ServiceRequest serviceRequest);
	
	public HashMap<String, Object> getAllCustomerServiceDetails(int servicerequestid);
	
	public List<ServiceRequest> getAllUpcomingServices(int uid);
	
	public int cancelspServiceRequest(ServiceRequest serviceRequest);
	
	public List<ServiceRequest> getAllspservicehistory(int uid);
	
	public int completespServiceRequest(ServiceRequest serviceRequest);
}
