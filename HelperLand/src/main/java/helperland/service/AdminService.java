package helperland.service;

import java.util.List;

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.User;

public interface AdminService {

	public List<User> getAllUsers();

	public int adminstatus(User user);

	public int adminapproval(User user);

	public int adminuserdelete(User user);

	public List<ServiceRequest> getAllServiceRequest();

	public int editServiceRequest(ServiceRequest serviceRequest);

	public int editServiceRequestifSpNotFree(ServiceRequest serviceRequest);

	public int editServiceRequestAddress(ServiceRequestAddress serviceRequestAddress);

}
