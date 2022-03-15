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
			  System.out.println(userList.toString());
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
			  System.out.println(state);
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
			  System.out.println(state);
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
			  System.out.println(state);
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
			  Query<ServiceRequest> query = session.createQuery("from servicerequest as sr left join user as u1 on sr.user_id = u1.user_id left join user as u on sr.service_provider_id = u.user_id");			 
			  
			  User User = new User();
			  List<ServiceRequest> userList = query.getResultList();  
			  System.out.println(userList.toString());
			  return userList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
