package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="service_request_extra")
@Table(name="service_request_extra")
public class ServiceRequestExtra {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_req_extra_id;
	
	private int service_req_id;
	
	private String service_extra_;

	public int getService_req_extra_id() {
		return service_req_extra_id;
	}

	public void setService_req_extra_id(int service_req_extra_id) {
		this.service_req_extra_id = service_req_extra_id;
	}

	public int getService_req_id() {
		return service_req_id;
	}

	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}

	public String getService_extra_() {
		return service_extra_;
	}

	public void setService_extra_(String service_extra_) {
		this.service_extra_ = service_extra_;
	}

	@Override
	public String toString() {
		return "ServiceRequestExtra [service_req_extra_id=" + service_req_extra_id + ", service_req_id="
				+ service_req_id + ", service_extra_=" + service_extra_ + "]";
	}
	
}
