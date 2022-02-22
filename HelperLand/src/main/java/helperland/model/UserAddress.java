package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="useraddress")
@Table(name="useraddress")
public class UserAddress {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int user_address_id;
	private int userid;
	private int postalcode;
	private String AddressLine1;
	private String AddressLine2;
	private String City;
	private String Email;
	private String Mobile;
	private String State;
	private boolean IsDefault;
	private boolean IsDeleted;
	
	

	public int getUser_address_id() {
		return user_address_id;
	}



	public void setUser_address_id(int user_address_id) {
		this.user_address_id = user_address_id;
	}



	public int getUserid() {
		return userid;
	}



	public void setUserid(int userid) {
		this.userid = userid;
	}



	public int getPostalcode() {
		return postalcode;
	}



	public void setPostalcode(int postalcode) {
		this.postalcode = postalcode;
	}



	public String getAddressLine1() {
		return AddressLine1;
	}



	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}



	public String getAddressLine2() {
		return AddressLine2;
	}



	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}



	public String getCity() {
		return City;
	}



	public void setCity(String city) {
		City = city;
	}



	public String getEmail() {
		return Email;
	}



	public void setEmail(String email) {
		Email = email;
	}



	public String getMobile() {
		return Mobile;
	}



	public void setMobile(String mobile) {
		Mobile = mobile;
	}



	public String getState() {
		return State;
	}



	public void setState(String state) {
		State = state;
	}



	public boolean isIsDefault() {
		return IsDefault;
	}



	public void setIsDefault(boolean isDefault) {
		IsDefault = isDefault;
	}



	public boolean isIsDeleted() {
		return IsDeleted;
	}



	public void setIsDeleted(boolean isDeleted) {
		IsDeleted = isDeleted;
	}



	@Override
	public String toString() {
		return "UserAddress [user_address_id=" + user_address_id + ", AddressLine1=" + AddressLine1 + ", AddressLine2="
				+ AddressLine2 + ", City=" + City + ", Email=" + Email + ", Mobile=" + Mobile + ", State=" + State
				+ ", IsDefault=" + IsDefault + ", IsDeleted=" + IsDeleted + ", userid=" + userid + ", postalcode="
				+ postalcode + "]";
	}

	


}
