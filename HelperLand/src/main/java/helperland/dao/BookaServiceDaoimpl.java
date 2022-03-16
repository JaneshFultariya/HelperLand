package helperland.dao;

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
public class BookaServiceDaoimpl implements BookaServiceDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;
	
	
	@Transactional
	public boolean getUserAddress(String pincode) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("from useraddress inner join user on user_id=userid where postalcode =:userPostalCode and user_type_id=:user_type_id");
			  query.setParameter("userPostalCode", Integer.parseInt(pincode));
			  query.setParameter("user_type_id", 2);
			  return query.list().size() > 0;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	@Transactional
	public int saveaddress(UserAddress userAddress) {
		int id = (Integer) this.hibernateTemplate.save(userAddress);
		return id;
	}

	@Transactional
	public List<UserAddress> getUserallAddress(int uid) {
		Session session = factory.getCurrentSession();
		try {
			  Query<UserAddress> query = session.createQuery("from useraddress where userid =:userid",UserAddress.class);
			  query.setParameter("userid", uid);
			  
			  UserAddress useraddress = new UserAddress();
			  List<UserAddress> useraddList = query.getResultList();
			  return useraddList;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public UserAddress getSelectedAddress(int user_address_id) {
		
		Session session = factory.getCurrentSession();
		try {
			  Query<UserAddress> query = session.createQuery("from useraddress where user_address_id =:user_address_id",UserAddress.class);
			  query.setParameter("user_address_id", user_address_id);
			  
			  UserAddress reqstedaddress = new UserAddress();
			  reqstedaddress = query.getSingleResult();
			  return reqstedaddress;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int saveSelectedAddress(ServiceRequestAddress serviceRequestAddress) {
		int requestaddress = (Integer) this.hibernateTemplate.save(serviceRequestAddress);
		return requestaddress;
	}

	@Transactional
	public int saveServiceRequest(ServiceRequest serviceRequest) {
		int servicerequest = (Integer) this.hibernateTemplate.save(serviceRequest);
		return servicerequest;
	}

	@Transactional
	public int saveExtraService(List<ServiceRequestExtra> serviceRequestExtraslist) {
		Iterator<ServiceRequestExtra> iterator = serviceRequestExtraslist.iterator();
		while(iterator.hasNext()) {
			int servicerequestextra = (Integer) this.hibernateTemplate.save(iterator.next());
		}
		
		return 1;
	}

	
	@Transactional
	public List<User> getAllEmail(int uid) {
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

}
