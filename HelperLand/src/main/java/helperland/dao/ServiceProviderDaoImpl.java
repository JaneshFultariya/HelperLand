package helperland.dao;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperland.dto.ServiceRequestDto;
import helperland.model.Favoriteandblocked;
import helperland.model.Rating;
import helperland.model.ServiceRequest;
import helperland.model.ServiceRequestAddress;
import helperland.model.ServiceRequestExtra;
import helperland.model.ServiceScheduleEntity;
import helperland.model.User;
import helperland.model.UserAddress;

@Repository
public class ServiceProviderDaoImpl implements ServiceProviderDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;	
	
	@Transactional
	public List<ServiceRequest> getAllServiceRequest(int uid, int postal) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from servicerequest as sp inner join servicerequestaddress as spa on sp.service_req_id=spa.ServiceRequestId inner join user as u on sp.user_id=u.user_id left join favoriteandblocked as fab on sp.user_id=fab.TargetUserId and fab.UserId is not null and fab.UserId=:service_provider_id1 where sp.service_provider_id=:service_provider_id and sp.status=:status and (fab.IsBlocked=:IsBlocked or fab.IsBlocked is null) and spa.PostalCode=:PostalCode");
			  query.setParameter("service_provider_id", 0);
			  query.setParameter("IsBlocked", 0);
			  query.setParameter("status", "new");
			  query.setParameter("service_provider_id1", uid);
			  query.setParameter("PostalCode", postal);
			  
			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();	  
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

			  query.setParameter("service_provider_id", uid);
			  query.setParameter("status", "Accepted");

			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();	  
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
			  query.setParameter("service_provider_id", uid);
			  query.setParameter("status", "Completed");
			  ServiceRequest serviceRequest = new ServiceRequest();
			  List<ServiceRequest> servicerequestList = query.getResultList();
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
			  Query query = session.createQuery("update servicerequest set status=:status, "+"payment_done=:payment_done "+"where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("status", "Completed");
			  query.setParameter("payment_done", "Completed");
			  
			  int state = query.executeUpdate();
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
			  return useraddress;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@Transactional
	public String getOneEmail(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
			  String query = (String) session.createSQLQuery("select email from user as u inner join servicerequest as sr on sr.user_id=u.user_id where service_req_id="+service_req_id+"").getSingleResult();

			  return query;
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
			  query.setParameter("rating_to", uid);
			  Rating rating = new Rating();
			  List<Rating> ratingList = query.getResultList();
			  return ratingList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}


	public List<ServiceScheduleEntity> getServiceSchedule(int uid) {
		List<ServiceScheduleEntity> list = null;
		Session session = null;
		Transaction transaction = null;
		
//		Session session = factory.getCurrentSession();
		try {
//			  List<ServiceRequest> query = session.createSQLQuery("select service_req_id as id, service_start_date as start, status as status from servicerequest where status in ('Completed','Accepted') and service_provider_id="+uid+"").getResultList();
//			  Query<ServiceRequest> query = session.createQuery("from servicerequest where status in :status and service_provider_id=:service_provider_id",ServiceRequest.class);
//			  query.setParameter("service_provider_id", uid);
//			  query.setParameter("status", Arrays.asList("Completed","Accepted"));
//			  
//			  List<ServiceRequest> lisServiceRequests = query.getResultList();
			
			session = factory.openSession();
			transaction = session.beginTransaction();
			
			list = session.createQuery("select sr.service_req_id as id, "
					+ "CONCAT(REPLACE(sr.service_start_time, '.', ':'), ' And Total Time:-', REPLACE(sr.service_hours,'.',':')) as title, "
					+ "sr.service_start_date as start, "
					+ "sr.service_start_date as end, "
					+ "(CASE WHEN sr.status = 'Completed' THEN '#1d7a8c' ELSE '#efefef' END) as color, "
					+ "(CASE WHEN sr.status = 'Completed' THEN 'white' ELSE 'black' END) as textColor "
					+ "from servicerequest sr "
					+ "where status in ('Completed','Accepted') and service_provider_id="+uid+"")
					.setResultTransformer(
							Transformers.aliasToBean(ServiceScheduleEntity.class))
					.list();
			
			transaction.commit();
			
			}
		catch(Exception e) {
			System.out.println(e.getMessage());

			list = null;
			
			if(transaction != null) {
				transaction.rollback();
			}
		}
		finally {
			session.close();
		}
		return list;
		
	}

	@Transactional
	public List<User> getUserList(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from user as u inner join servicerequest as sr on sr.user_id = u.user_id left join favoriteandblocked as fab on sr.user_id = fab.TargetUserId where sr.service_provider_id=:service_provider_id and sr.status=:status group by (u.user_id)");
			  query.setParameter("service_provider_id", uid);
			  query.setParameter("status", "Completed");
			  User user = new User();
			  List<User> userList = query.getResultList();
			  return userList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public Favoriteandblocked getBlockCustomerList(int uid, int spid) {
		Session session = factory.getCurrentSession();
		try {
			Query<Favoriteandblocked> query = session.createQuery("from favoriteandblocked where UserId=:UserId and TargetUserId=:TargetUserId",Favoriteandblocked.class);
			query.setParameter("UserId", spid);
			query.setParameter("TargetUserId", uid);
			
			Favoriteandblocked favoriteandblocked = query.getSingleResult();
			
			return favoriteandblocked;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int insertBlockCustomer(Favoriteandblocked favoriteandblocked) {
		int id = (Integer) this.hibernateTemplate.save(favoriteandblocked);
		return id;
	}

	@Transactional
	public int updateBlockCustomer(Favoriteandblocked favoriteandblocked) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update favoriteandblocked set IsBlocked=:IsBlocked where UserId=:UserId and TargetUserId=:TargetUserId");
			  query.setParameter("UserId", favoriteandblocked.getUserId());
			  query.setParameter("TargetUserId", favoriteandblocked.getTargetUserId());
			  query.setParameter("IsBlocked", favoriteandblocked.getIsBlocked());
			  
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int getUserStatus(int uid) {
		Session session = factory.getCurrentSession();
		try {
			Query<User> query = session.createQuery("from user where user_id=:user_id",User.class);
			query.setParameter("user_id", uid);
			
			int user = query.getSingleResult().getIs_active();
			
			return user;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public ServiceRequest servicestartDate(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
			   

			   Query<ServiceRequest> query = session.createQuery("from servicerequest where service_req_id=:service_req_id",ServiceRequest.class);
				query.setParameter("service_req_id", service_req_id);
				
				ServiceRequest serviceRequest = query.getSingleResult();
			   
			  return serviceRequest;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int getState(String service_start_date, String service_start_time, int uid, float f) {
		System.out.println(service_start_time+ service_start_date+ f+ uid);
		Session session = factory.getCurrentSession();
		try {
			 Object query =  session.createSQLQuery("select count((service_start_time+service_hours)-"+service_start_time+") as AcceptTime from servicerequest where Status='Accepted' and service_provider_id="+uid+" and service_start_date='"+service_start_date+"' and (((service_start_time+service_hours)-"+service_start_time+")>1)").getSingleResult();
			
			System.out.println(query+".............................................");

			Object query1 = session.createSQLQuery("select count(("+service_start_time+"+"+f+"+1)>service_start_time) as AcceptTime from servicerequest where Status='Accepted' and service_provider_id="+uid+" and service_start_date='"+service_start_date+"'  and (("+service_start_time+"+"+f+"+1)>service_start_time)").getSingleResult();
			
			System.out.println(query1+"______________________________");
			
			if(Integer.parseInt(query.toString())!=0 && Integer.parseInt(query1.toString())!=0) {
				return 1;
			}
			else {
				return 0;
			}
			
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
//		int inicount = 0;
//		Session session = null;
//		Transaction transaction = null;
//		try {
//
//			
//			session = factory.openSession();
//			transaction = session.beginTransaction();
//			
//			inicount = (int) session.createQuery("select count((service_start_time+service_hours)-"+service_start_time+") from servicerequest where status='Accepted' and service_provider_id="+uid+" and service_start_date="+service_start_date+" and ((service_start_time+service_hours)-"+service_start_time+")>1")
//					.setResultTransformer(
//							Transformers.aliasToBean(ServiceRequest.class))
//					.getSingleResult();
//			
//			transaction.commit();
//			
//			System.out.println(inicount);
//			
//			}
//		catch(Exception e) {
//			System.out.println(e.getMessage());
//
//			inicount = 0;
//			
//			if(transaction != null) {
//				transaction.rollback();
//			}
//		}
//		finally {
//			session.close();
//		}
//		return inicount;
	}

//	@Transactional
//	public String getServiceDate(ServiceRequest serviceRequest) {
//		Session session = factory.getCurrentSession();
//		try {
//			   
//
//			   Query<ServiceRequest> query = session.createQuery("from servicerequest where service_req_id=:service_req_id",ServiceRequest.class);
//				query.setParameter("service_req_id", serviceRequest.getService_req_id());
//				
//				String Service_start_date = query.getSingleResult().getService_start_date();
//			   
//			  return Service_start_date;
//			}
//		catch(Exception e) {
//			System.out.println(e.getMessage());
//			return null;
//		}
//	}
//
//	@Transactional
//	public List<ServiceRequest> getState(String service_start_date, String service_start_time, int uid) {
//		Session session = factory.getCurrentSession();
//		try {
//			List<ServiceRequest> query = (List<ServiceRequest>) session.createSQLQuery("select replace(service_hours,'.5','.3') + service_start_time from servicerequest where service_start_date="+service_start_date+"").getResultList();
//
//			  return query;
//			}
//		catch(Exception e) {
//			System.out.println(e.getMessage());
//			return null;
//		}
//	}
//
//	@Transactional
//	public float getServiceTime(ServiceRequest serviceRequest) {
//		Session session = factory.getCurrentSession();
//		try {
//			float query = (float) session.createSQLQuery("select service_start_time from servicerequest where service_req_id="+serviceRequest.getService_req_id()+"").getSingleResult();
//
//			  return query;
//			}
//		catch(Exception e) {
//			System.out.println(e.getMessage());
//			return 0;
//		}
//	}
	
	

}
