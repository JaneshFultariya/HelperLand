package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperland.model.User;

@Repository
public class LoginDaoimpl implements LoginDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public User getUser(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where (email =:userEmail AND password =:userPassword and is_approved =:is_approved and is_deleted=:is_deleted)",User.class);
			  query.setParameter("userEmail", user.getEmail());
			  query.setParameter("userPassword", user.getPassword());
			  query.setParameter("is_approved", 1);
			  query.setParameter("is_deleted", 0);
			  User loginuser = new User();
			  loginuser = query.getSingleResult();
			  int login_type = loginuser.getUser_type_id();
			  return loginuser;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
