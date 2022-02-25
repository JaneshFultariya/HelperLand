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

@Repository
public class RegisterUserDaoclass implements RegisterUserDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public int saveRegisterUser(User user) {
		int id = (Integer) this.hibernateTemplate.save(user);
		return id;
	}
}
