package helperland.dao;

import java.util.List;

import helperland.model.ServiceRequest;
import helperland.model.User;

public interface AdminDao {
	
	public List<User> getAllUsers();
	
	public int adminstatus(User user);
	
	public int adminapproval(User user);
	
	public int adminuserdelete(User user);
	
	public List<ServiceRequest> getAllServiceRequest();
}
