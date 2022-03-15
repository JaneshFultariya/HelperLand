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
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.User;
import helperland.model.UserAddress;

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

	@Transactional
	public List<User> getUserEmail(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where user_type_id =:user_type_id",User.class);
			  query.setParameter("user_type_id", 2);
			  
			  User user = new User();
			  List<User> useremaillist = query.getResultList();
			  String[] allemailaddress = {};
			  System.out.println(allemailaddress);
			  return useremaillist;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int updtspDetails(User user,UserAddress userAddress) {
		Session session = factory.getCurrentSession();
		System.out.println(user.getFirst_name()+"-------------"+user.getUser_id());
		try {
			  Query query = session.createQuery("update user set first_name=:first_name,"+ "last_name=:last_name, "+"mobile=:mobile, "+"date_of_birth=:date_of_birth, "+"nationality=:nationality, "+"user_profile_pic=:user_profile_pic, "+"gender=:gender " +"where user_id=:user_id");
			  query.setParameter("user_id", user.getUser_id());
			  query.setParameter("first_name", user.getFirst_name());
			  query.setParameter("last_name", user.getLast_name());
			  query.setParameter("mobile", user.getMobile());
			  query.setParameter("date_of_birth", user.getDate_of_birth());
			  query.setParameter("nationality", user.getNationality());
			  query.setParameter("user_profile_pic", user.getUser_profile_pic());
			  query.setParameter("gender", user.getGender());
			  
			  int state = query.executeUpdate();
			  System.out.println(state);
			  
			  Query query1 = session.createQuery("update useraddress set "+"AddressLine1=:AddressLine1, "+"AddressLine2=:AddressLine2, "+"postalcode=:postalcode, "+"City=:City, "+"Mobile=:Mobile "+"where userid=:userid");
			  query1.setParameter("AddressLine1", userAddress.getAddressLine1());
			  query1.setParameter("AddressLine2", userAddress.getAddressLine2());
			  query1.setParameter("postalcode", userAddress.getPostalcode());
			  query1.setParameter("City", userAddress.getCity());
			  query1.setParameter("Mobile", user.getMobile());
			  query1.setParameter("userid", user.getUser_id());
			  
			  int state1 = query1.executeUpdate();
			  
			  if(state == 1 && state1 == 1) {
				  int finalstate = 1;
				  return finalstate;
			  }
			  else {
				  int finalstate = 0;
				  return finalstate;
			  }
			  
			  
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
		
	}

	@Transactional
	public UserAddress getAddress(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<UserAddress> query = session.createQuery("from useraddress where userid =:userid",UserAddress.class);
			  query.setParameter("userid", uid);
			  
			  UserAddress userAddress = new UserAddress();
			  UserAddress useraddress = query.getSingleResult();
			  System.out.println(useraddress.toString()+"---------------------------------");
			  return useraddress;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@Transactional
	public User getOneEmail(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user as u inner join servicerequest as sp on u.user_id=sp.user_id where service_req_id =:service_req_id",User.class);
			  query.setParameter("service_req_id", service_req_id);
			  
			  UserAddress userAddress = new UserAddress();
			  String user = query.getSingleResult().getEmail();
			  System.out.println(user+"------");
			  return null;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@Transactional
	public List<Rating> getAllspRatings(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from rating as r inner join user as u on r.rating_from=u.user_id inner join servicerequest sr on r.service_req_id=sr.service_req_id where r.rating_to=:rating_to");
//			 String sql = "select first_name,AddressLine1,service_req_id from servicerequest inner join servicerequestaddress on service_req_id=ServiceRequestId inner join user on servicerequest.user_id=user.user_id where status='new' and service_provider_id=0";
			
			  query.setParameter("rating_to", uid);
		  
//			 List<ServiceRequestDto> employees = (List<ServiceRequestDto>) session.createSQLQuery(sql).getResultList();
			  Rating rating = new Rating();
			  List<Rating> ratingList = query.getResultList();	  
//			  System.out.println(employees);
			  return ratingList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
