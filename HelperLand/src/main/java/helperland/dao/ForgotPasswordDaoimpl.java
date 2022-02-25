package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperland.model.User;

@Repository
public class ForgotPasswordDaoimpl implements ForgotPasswordDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public String getForgotUser(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where email =:userEmail",User.class);
			  query.setParameter("userEmail", user.getEmail());
			  User forgotuser = new User();
			  forgotuser = query.getSingleResult();
			  String forgotemail = forgotuser.getEmail();
			  System.out.println(forgotuser.getEmail());
			  return forgotemail;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Transactional
	public int updateForgotUser(User user) {
		Session session = factory.getCurrentSession();
		try {
			  Query query = session.createQuery("update user set password=:userPassword where email=:userEmail");
			  query.setParameter("userEmail", user.getEmail());
			  query.setParameter("userPassword", user.getPassword());
			  int state = query.executeUpdate();
			  return state;
			}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}
}
