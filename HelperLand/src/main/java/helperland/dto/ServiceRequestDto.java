package helperland.dto;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class ServiceRequestDto implements Serializable {


	private int service_req_id;
	
	private String service_start_date;
	
	private float service_hours;
	
	private float total_cost;
	private String comments;
	
	private String service_start_time;
	
	private String has_pets;
	
	public String AddressLine1;
	public String AddressLine2;
	public String Mobile;
	public String Email;

	private String service_extra;

	public int getService_req_id() {
		return service_req_id;
	}

	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}



	public String getService_start_date() {
		return service_start_date;
	}

	public void setService_start_date(String service_start_date) {
		this.service_start_date = service_start_date;
	}

	public float getService_hours() {
		return service_hours;
	}

	public void setService_hours(float service_hours) {
		this.service_hours = service_hours;
	}

	public float getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(float total_cost) {
		this.total_cost = total_cost;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getService_start_time() {
		return service_start_time;
	}

	public void setService_start_time(String service_start_time) {
		this.service_start_time = service_start_time;
	}

	public String getHas_pets() {
		return has_pets;
	}

	public void setHas_pets(String has_pets) {
		this.has_pets = has_pets;
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

	public String getService_extra() {
		return service_extra;
	}

	public void setService_extra(String service_extra) {
		this.service_extra = service_extra;
	}

	@Override
	public String toString() {
		return "ServiceRequestDto [service_req_id=" + service_req_id + ", service_start_date=" + service_start_date
				+ ", service_hours=" + service_hours + ", total_cost=" + total_cost + ", comments=" + comments
				+ ", service_start_time=" + service_start_time + ", has_pets=" + has_pets + ", AddressLine1="
				+ AddressLine1 + ", AddressLine2=" + AddressLine2 + ", Mobile=" + Mobile + ", Email=" + Email
				+ ", service_extra=" + service_extra + "]";
	}

	
	
	
}
