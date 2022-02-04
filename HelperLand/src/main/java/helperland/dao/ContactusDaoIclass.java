package helperland.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import helperland.model.Contactus;
import helperland.model.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

@Repository
public class ContactusDaoIclass implements ContactusDao {

	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public int saveContactUs(Contactus contactUs) {
		int id = (Integer) this.hibernateTemplate.save(contactUs);
		return id;
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public int getContactUsUser(Contactus contactUsUser) {
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where email =:userEmail",User.class);
			  query.setParameter("userEmail", contactUsUser.getEmail());
			  
			  User user = new User();
			  user = query.getSingleResult();
			  int userId = user.getUser_id();
			  
			  System.out.println(user.getUser_id());
			  
			  return userId;
			}
		catch(Exception e) {
			return 0;
		}
	}

}
