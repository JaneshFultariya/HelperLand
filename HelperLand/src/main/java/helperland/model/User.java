package helperland.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="user")
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int user_id;
	
	
	private int user_type_id;

	private String first_name;
	private String last_name;	
	
	private String email;
	
	private String mobile;
	
	private String password;
	
	private int is_registered_user;
	private int works_with_pet;
	private int modified_by;
	private int is_approved;
	private int is_active;
	private int is_deleted;
	private int is_online;
	private String created_date;
	private String modified_date;
	
	private String nationality;
	
	private String date_of_birth;
	
	private String language;
	
	private String user_profile_pic;
	
	private String gender;
	
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getModified_date() {
		return modified_date;
	}

	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getUser_type_id() {
		return user_type_id;
	}
	public void setUser_type_id(int user_type_id) {
		this.user_type_id = user_type_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIs_registered_user() {
		return is_registered_user;
	}
	public void setIs_registered_user(int is_registered_user) {
		this.is_registered_user = is_registered_user;
	}
	public int getWorks_with_pet() {
		return works_with_pet;
	}
	public void setWorks_with_pet(int works_with_pet) {
		this.works_with_pet = works_with_pet;
	}
	
	

	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	public int getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getIs_online() {
		return is_online;
	}
	public void setIs_online(int is_online) {
		this.is_online = is_online;
	}
	
	

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	

	public String getUser_profile_pic() {
		return user_profile_pic;
	}

	public void setUser_profile_pic(String user_profile_pic) {
		this.user_profile_pic = user_profile_pic;
	}
	
	

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_type_id=" + user_type_id + ", first_name=" + first_name
				+ ", last_name=" + last_name + ", email=" + email + ", mobile=" + mobile + ", password=" + password
				+ ", is_registered_user=" + is_registered_user + ", works_with_pet=" + works_with_pet + ", modified_by="
				+ modified_by + ", is_approved=" + is_approved + ", is_active=" + is_active + ", is_deleted="
				+ is_deleted + ", is_online=" + is_online + ", created_date=" + created_date + ", modified_date="
				+ modified_date + ", nationality=" + nationality + ", date_of_birth=" + date_of_birth + ", language="
				+ language + ", user_profile_pic=" + user_profile_pic + ", gender=" + gender + "]";
	}

	

	

}
