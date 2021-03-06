package helperland.dao;

import java.util.Arrays;
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
import helperland.model.User;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;	
	
	@Transactional
	public List<User> getAllUsers() {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user as u left join useraddress as ua on u.user_id=ua.userid and u.user_type_id=2 where u.is_deleted=:is_deleted");
			  query.setParameter("is_deleted", 0);
			 
			  
			  User User = new User();
			  List<User> userList = query.getResultList();
			  return userList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int adminstatus(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set is_active=:is_active where user_id=:user_id");
			  query.setParameter("user_id", user.getUser_id());
			  query.setParameter("is_active", user.getIs_active());
			  
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int adminapproval(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set is_approved=:is_approved where user_id=:user_id");
			  query.setParameter("user_id", user.getUser_id());
			  query.setParameter("is_approved", user.getIs_approved());
			  
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int adminuserdelete(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set is_deleted=:is_deleted, "+"is_approved=:is_approved, "+"is_active=:is_active "+"where user_id=:user_id");
			  query.setParameter("user_id", user.getUser_id());
			  query.setParameter("is_deleted", user.getIs_deleted());
			  query.setParameter("is_approved", 0);
			  query.setParameter("is_active", 0);
			  
			  
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public List<ServiceRequest> getAllServiceRequest() {
		Session session = factory.getCurrentSession();
		try {
			  List<ServiceRequest> query = session.createSQLQuery("select sr.service_req_id, sr.service_start_date,sr.service_start_time,sr.service_hours,u1.first_name as UserFirstName,u1.last_name as UserLastName,"
			  		+ " avg(rt.ratings) as avgrating, u.first_name,u.last_name,u.user_profile_pic,ua.AddressLine1,ua.AddressLine2,ua.City,ua.PostalCode,sr.total_cost,sr.status,sr.payment_done, sr.service_provider_id"
			  		+ " from servicerequest as sr left join user as u1 on sr.user_id = u1.user_id left join user as u on sr.service_provider_id = u.user_id left join servicerequestaddress as ua on sr.service_req_id = ua.ServiceRequestId left join rating as rt on sr.service_provider_id=rt.rating_to "
			  		+ "group by(sr.service_req_id)").getResultList();
			  return query;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int editServiceRequest(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set "+"service_start_date=:service_start_date, "+"service_start_time=:service_start_time "+"where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("service_start_date", serviceRequest.getService_start_date());
			  query.setParameter("service_start_time", serviceRequest.getService_start_time());
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int editServiceRequestifSpNotFree(ServiceRequest serviceRequest) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequest set "+"service_start_date=:service_start_date, "+"service_start_time=:service_start_time, "+"status=:status, "+"service_provider_id=:service_provider_id, "+"sp_accepted_date=:sp_accepted_date "+"where service_req_id=:service_req_id");
			  query.setParameter("service_req_id", serviceRequest.getService_req_id());
			  query.setParameter("service_start_date", serviceRequest.getService_start_date());
			  query.setParameter("service_start_time", serviceRequest.getService_start_time());
			  query.setParameter("service_provider_id", 0);
			  query.setParameter("status", "new");
			  query.setParameter("sp_accepted_date", null);
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public int editServiceRequestAddress(ServiceRequestAddress serviceRequestAddress) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update servicerequestaddress set "+"AddressLine1=:AddressLine1, "+"AddressLine2=:AddressLine2, "+"City=:City, "+"PostalCode=:PostalCode "+"where ServiceRequestId=:ServiceRequestId");
			  query.setParameter("ServiceRequestId", serviceRequestAddress.getServiceRequestId());
			  query.setParameter("AddressLine1", serviceRequestAddress.getAddressLine1());
			  query.setParameter("AddressLine2", serviceRequestAddress.getAddressLine2());
			  query.setParameter("City", serviceRequestAddress.getCity());
			  query.setParameter("PostalCode", serviceRequestAddress.getPostalCode());
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Transactional
	public ServiceRequestAddress getServiceRequestAddress(int srId) {
		Session session = factory.getCurrentSession();
		try {
			  Query<ServiceRequestAddress> query = session.createQuery("from servicerequestaddress where ServiceRequestId=:ServiceRequestId");
			  query.setParameter("ServiceRequestId", srId);
			 
			  
			  ServiceRequestAddress serviceRequestAddress = new ServiceRequestAddress();
			  ServiceRequestAddress serviceRequestAddress1 = query.getSingleResult();	  
			  return serviceRequestAddress1;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public String getUserEmail(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where user_id=:user_id",User.class);
			  query.setParameter("user_id", uid);
			 
			  String email = query.getSingleResult().getEmail();	  
			  return email;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
