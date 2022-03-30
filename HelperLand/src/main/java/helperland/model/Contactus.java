package helperland.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contact_us")
public class Contactus {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int contact_us_id;
	
	private String firstname;
	private String lastname;
	
	private String email;
	private String subject_type;
	private String phone_number;
	private String message;
	private String created_on;
	private String name;
	private String file_name;
	private int created_by;
	
	public String getName() {
		return name;
	}
	public void setName(String fname , String lname) {
		this.name = fname +" "+ lname;
	}

	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public Contactus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getContact_us_id() {
		return contact_us_id;
	}
	public void setContact_us_id(int contact_us_id) {
		this.contact_us_id = contact_us_id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject_type() {
		return subject_type;
	}
	public void setSubject_type(String subject_type) {
		this.subject_type = subject_type;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	
	
	
	
}
