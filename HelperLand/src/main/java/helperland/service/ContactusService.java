package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;

import helperland.dao.ContactusDao;
import helperland.model.Contactus;

public interface ContactusService {


	public int createContactUs(Contactus contactus);
	public int getContactUsUser(Contactus contactusUser);
}
