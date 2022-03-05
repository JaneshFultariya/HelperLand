package helperland.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ServiceProviderDao;
import helperland.model.ServiceRequest;

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

}
