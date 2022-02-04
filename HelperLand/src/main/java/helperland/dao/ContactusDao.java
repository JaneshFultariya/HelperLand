package helperland.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import helperland.model.Contactus;

public interface ContactusDao {

public int saveContactUs(Contactus contactUs);
	
	public int getContactUsUser(Contactus contactUsUser);
	
}
