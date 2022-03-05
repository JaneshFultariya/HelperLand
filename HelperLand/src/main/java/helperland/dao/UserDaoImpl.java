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

import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;	
	
	@Transactional
	public int edtUserDetails(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set "+"first_name=:first_name, "+"last_name=:last_name, "+"mobile=:mobile, "+"date_of_birth=:date_of_birth,"+"language=:language "+"where user_id=:user_id");
			  query.setParameter("user_id", user.getUser_id());
			  query.setParameter("first_name", user.getFirst_name());
			  query.setParameter("last_name", user.getLast_name());
			  query.setParameter("mobile", user.getMobile());
			  query.setParameter("date_of_birth", user.getDate_of_birth());
			  query.setParameter("language", user.getLanguage());
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int updtPasswordDetails(String old_password, String updtpassword, int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set password=:password where user_id=:user_id and password=:old_password");
			  query.setParameter("old_password", old_password);
			  query.setParameter("password", updtpassword);
			  query.setParameter("user_id", uid);
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
	public int updateAddress(UserAddress userAddress) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update useraddress set "+"AddressLine1=:AddressLine1, "+"AddressLine2=:AddressLine2, "+"postalcode=:postalcode, "+"City=:City, "+"Mobile=:Mobile "+"where user_address_id=:user_address_id");
			  query.setParameter("AddressLine1", userAddress.getAddressLine1());
			  query.setParameter("AddressLine2", userAddress.getAddressLine2());
			  query.setParameter("postalcode", userAddress.getPostalcode());
			  query.setParameter("City", userAddress.getCity());
			  query.setParameter("Mobile", userAddress.getMobile());
			  query.setParameter("user_address_id", userAddress.getUser_address_id());
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
	public int deleteAddress(UserAddress userAddress) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("delete from useraddress where user_address_id=:user_address_id AND userid=:userid");
			  query.setParameter("userid", userAddress.getUserid());
			  query.setParameter("user_address_id", userAddress.getUser_address_id());
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
	public List<ServiceRequest> getAllService(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<ServiceRequest> query = session.createQuery("from servicerequest where user_id=:user_id and status=:status",ServiceRequest.class);
			  query.setParameter("user_id", uid);
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
	public HashMap<String, Object> getAllServiceDetails(int servicerequestid) {
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
	public int cancelServiceRequest(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set status=:status where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("status", "cancel");
			  
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
	public int rescheduleServiceRequest(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set "+"service_start_date=:service_start_date, "+"service_start_time=:service_start_time "+"where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("service_start_date", serviceRequest.getService_start_date());
			  query.setParameter("service_start_time", serviceRequest.getService_start_time());
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
	public List<ServiceRequest> getAllServiceHistory(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<ServiceRequest> query = session.createQuery("from servicerequest where user_id=:user_id and status=:status",ServiceRequest.class);
			  query.setParameter("user_id", uid);
			  query.setParameter("status", "cancel");
			  
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

}
