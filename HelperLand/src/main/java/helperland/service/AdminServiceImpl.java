package helperland.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.AdminDao;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.User;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;

	public List<User> getAllUsers() {
		return this.adminDao.getAllUsers();
	}

	public int adminstatus(User user) {
		return this.adminDao.adminstatus(user);
	}

	public int adminapproval(User user) {
		return this.adminDao.adminapproval(user);
	}

	public int adminuserdelete(User user) {
		return this.adminDao.adminuserdelete(user);
	}

	public List<ServiceRequest> getAllServiceRequest() {
		return this.adminDao.getAllServiceRequest();
	}

	public int editServiceRequest(ServiceRequest serviceRequest) {
		return this.adminDao.editServiceRequest(serviceRequest);
	}

	public int editServiceRequestifSpNotFree(ServiceRequest serviceRequest) {
		return this.adminDao.editServiceRequestifSpNotFree(serviceRequest);
	}

	public int editServiceRequestAddress(ServiceRequestAddress serviceRequestAddress) {
		return this.adminDao.editServiceRequestAddress(serviceRequestAddress);
	}

	public ServiceRequestAddress getServiceRequestAddress(int srId) {
		return this.adminDao.getServiceRequestAddress(srId);
	}

	public String getUserEmail(int uid) {
		return this.adminDao.getUserEmail(uid);
	}

}
