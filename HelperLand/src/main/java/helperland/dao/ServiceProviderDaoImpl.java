package helperland.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperland.dto.ServiceRequestDto;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;

@Repository
public class ServiceProviderDaoImpl implements ServiceProviderDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;	
	
	@Transactional
	public List<ServiceRequest> getAllServiceRequest() {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from servicerequest as sp inner join servicerequestaddress as spa on sp.service_req_id=spa.ServiceRequestId inner join user as u on sp.user_id=u.user_id where sp.service_provider_id=:service_provider_id and sp.status=:status");
			  query.setParameter("service_provider_id", 0);
			  query.setParameter("status", "new");
			  
			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();	  
			  System.out.println(servicerequestList.toString());
			  return servicerequestList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@Transactional
	public int acceptService(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set service_provider_id=:service_provider_id, "+"sp_accepted_date=:sp_accepted_date, "+"status=:status "+"where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("service_provider_id", serviceRequest.getService_provider_id());
			  query.setParameter("sp_accepted_date", serviceRequest.getSp_accepted_date());
			  query.setParameter("status", "Accepted");
			  
			  int state = query.executeUpdate();
			  System.out.println(state);
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public HashMap<String, Object> getAllCustomerServiceDetails(int servicerequestid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<ServiceRequestAddress> query = session.createQuery("from servicerequestaddress where ServiceRequestId=:ServiceRequestId",ServiceRequestAddress.class);
			  query.setParameter("ServiceRequestId", servicerequestid);
			  
			  ServiceRequestAddress serviceRequestAddress = new ServiceRequestAddress();
			  serviceRequestAddress = query.getSingleResult();
			  
			  Query<ServiceRequestExtra> query1 = session.createQuery("from service_request_extra where service_req_id=:service_req_id",ServiceRequestExtra.class);
			  query1.setParameter("service_req_id", servicerequestid);
			  
			  
			  List<ServiceRequestExtra> serviceRequestExtrasList = query1.getResultList();
			  String allExtras = "";
			  Iterator<ServiceRequestExtra> iterator = serviceRequestExtrasList.iterator();
			  while(iterator.hasNext()) {
				  allExtras += iterator.next().getService_extra_() + ",";
			  }
			  
			  Query<ServiceRequest> query2 = session.createQuery("from servicerequest where service_req_id=:service_req_id",ServiceRequest.class);
			  query2.setParameter("service_req_id", servicerequestid);
			  
			  ServiceRequest serviceRequestfinal = new ServiceRequest();
			  serviceRequestfinal = query2.getSingleResult();
			  
			  System.out.println(serviceRequestAddress.toString()+"---------"+allExtras);
			  
//			  ServiceRequest serviceRequest = new ServiceRequest();
//			  List<ServiceRequest> servicerequestList = query.getResultList();	  
//			  System.out.println(servicerequestList.toString());
//			  ServiceRequestAddress requestAddress;
//			  List temppp = query.getResultList();
//			  Iterator iterator = temppp.iterator();
//				while(iterator.hasNext()) {
//					Object object[] = (Object[]) iterator.next();
//					requestAddress = (ServiceRequestAddress) object[0];
//				}
			  
			  
			  HashMap<String, Object> serviceRequestData = new HashMap<String, Object>();
			  serviceRequestData.put("serviceRequestAddress", serviceRequestAddress);
			  serviceRequestData.put("allExtras", allExtras);
			  serviceRequestData.put("servicereqfinal", serviceRequestfinal);
			  
			  
			  return serviceRequestData;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public List<ServiceRequest> getAllUpcomingServices(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from servicerequest as sp join servicerequestaddress as spa on sp.service_req_id=spa.ServiceRequestId join user as u on sp.user_id=u.user_id where sp.service_provider_id=:service_provider_id and sp.status=:status");
//			 String sql = "select first_name,AddressLine1,service_req_id from servicerequest inner join servicerequestaddress on service_req_id=ServiceRequestId inner join user on servicerequest.user_id=user.user_id where status='new' and service_provider_id=0";
			
			  query.setParameter("service_provider_id", uid);
			  query.setParameter("status", "Accepted");
		  
//			 List<ServiceRequestDto> employees = (List<ServiceRequestDto>) session.createSQLQuery(sql).getResultList();
			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();	  
//			  System.out.println(employees);
			  return servicerequestList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int cancelspServiceRequest(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set status=:status, "+"service_provider_id=:service_provider_id "+ "where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("status", "new");
			  query.setParameter("service_provider_id", 0);
			  
			  int state = query.executeUpdate();
			  System.out.println(state);
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public List<ServiceRequest> getAllspservicehistory(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from servicerequest as sp join servicerequestaddress as spa on sp.service_req_id=spa.ServiceRequestId join user as u on sp.user_id=u.user_id where sp.service_provider_id=:service_provider_id and sp.status=:status");
//			 String sql = "select first_name,AddressLine1,service_req_id from servicerequest inner join servicerequestaddress on service_req_id=ServiceRequestId inner join user on servicerequest.user_id=user.user_id where status='new' and service_provider_id=0";
			
			  query.setParameter("service_provider_id", uid);
			  query.setParameter("status", "Completed");
		  
//			 List<ServiceRequestDto> employees = (List<ServiceRequestDto>) session.createSQLQuery(sql).getResultList();
			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();	  
//			  System.out.println(employees);
			  return servicerequestList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int completespServiceRequest(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set status=:status where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("status", "Completed");
			  
			  int state = query.executeUpdate();
			  System.out.println(state);
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

}
