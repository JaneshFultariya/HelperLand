package helperland.model;

import javax.persistence.Entity;


public class Tempclass {
	public int Id;
	public String AddressLine1;
	public String AddressLine2;
	public String City;
	public String Email;
	public String Mobile;
	public int PostalCode;
	public int ServiceRequestId;
	public String State;
	public int service_req_extra_id;
	public String service_extra_;
	public int service_req_id;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
	public int getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(int postalCode) {
		PostalCode = postalCode;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public int getService_req_extra_id() {
		return service_req_extra_id;
	}
	public void setService_req_extra_id(int service_req_extra_id) {
		this.service_req_extra_id = service_req_extra_id;
	}
	public String getService_extra_() {
		return service_extra_;
	}
	public void setService_extra_(String service_extra_) {
		this.service_extra_ = service_extra_;
	}
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	@Override
	public String toString() {
		return "Tempclass [Id=" + Id + ", AddressLine1=" + AddressLine1 + ", AddressLine2=" + AddressLine2
				+ ", City=" + City + ", Email=" + Email + ", Mobile=" + Mobile + ", PostalCode=" + PostalCode
				+ ", ServiceRequestId=" + ServiceRequestId + ", State=" + State + ", service_req_extra_id="
				+ service_req_extra_id + ", service_extra_=" + service_extra_ + ", service_req_id=" + service_req_id
				+ "]";
	}
}
