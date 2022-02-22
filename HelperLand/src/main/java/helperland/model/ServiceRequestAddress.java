package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="ServiceRequestAddress")
@Table(name="ServiceRequestAddress")
public class ServiceRequestAddress {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int Id;
	private int ServiceRequestId;
	public String AddressLine1;
	public String AddressLine2;
	public String City;
	public String State;
	public String Mobile;
	public String Email;
	public int PostalCode;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
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
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	public int getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(int postalCode) {
		PostalCode = postalCode;
	}
	@Override
	public String toString() {
		return "ServiceRequestAddress [Id=" + Id + ", ServiceRequestId=" + ServiceRequestId + ", AddressLine1="
				+ AddressLine1 + ", AddressLine2=" + AddressLine2 + ", City=" + City + ", State=" + State + ", Mobile="
				+ Mobile + ", Email=" + Email + ", PostalCode=" + PostalCode + "]";
	}
	
}
