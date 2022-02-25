package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

}
