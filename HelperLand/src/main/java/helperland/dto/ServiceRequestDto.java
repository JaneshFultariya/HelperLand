package helperland.dto;

public class ServiceRequestDto {

private int service_req_id;
	
	private int user_id;
	
private String service_start_date;
	

	private int postal_code;
	
	public String AddressLine1;
	public String AddressLine2;
	
	private String first_name;
	private String last_name;
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getService_start_date() {
		return service_start_date;
	}
	public void setService_start_date(String service_start_date) {
		this.service_start_date = service_start_date;
	}
	public int getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
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
	@Override
	public String toString() {
		return "ServiceRequestDto [service_req_id=" + service_req_id + ", user_id=" + user_id + ", service_start_date="
				+ service_start_date + ", postal_code=" + postal_code + ", AddressLine1=" + AddressLine1
				+ ", AddressLine2=" + AddressLine2 + ", first_name=" + first_name + ", last_name=" + last_name + "]";
	}	
	
}
