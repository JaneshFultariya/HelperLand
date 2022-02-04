package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ContactusDao;
import helperland.model.Contactus;

@Service
public class ContactusServiceclass implements ContactusService{

	@Autowired
	private ContactusDao contactusDao;
	
	

	public int createContactUs(Contactus contactus) {
		return this.contactusDao.saveContactUs(contactus);
	}

	public int getContactUsUser(Contactus contactusUser) {
		return this.contactusDao.getContactUsUser(contactusUser);
	}
	
	
}
