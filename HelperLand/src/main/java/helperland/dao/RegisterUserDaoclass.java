package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import helperland.model.Contactus;
import helperland.model.User;
import helperland.model.UserAddress;

@Repository
public class RegisterUserDaoclass implements RegisterUserDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;

	@Transactional
	public int saveRegisterUser(User user) {
		int id = (Integer) this.hibernateTemplate.save(user);
		return id;
	}

	@Transactional
	public int createRegisterUserAddress(UserAddress userAddress) {
		int id1 = (Integer) this.hibernateTemplate.save(userAddress);
		return id1;
	}

	@Transactional
	public User getAllEmail(String email) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where email =:userEmail",User.class);
			  query.setParameter("userEmail", email);
			  User loginuser = new User();
			  loginuser = query.getSingleResult();
			  return loginuser;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
