package helperland.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize
@Entity(name="servicerequest")
@Table(name="servicerequest")
public class ServiceRequest {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_req_id;
	
	private int user_id;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_id;
	
	private String service_start_date;
	

	private int postal_code;
	
	private int service_frequency;
	
	private float service_hourly_rate;
	
	private float service_hours;
	private float extra_hours;
	
	private float sub_total;
	private float discount;
	
	private float total_cost;
	private String comments;
	private String payment_transaction_ref_no;
	
	private float payment_due;
	private String job_status;
	private float service_start_time;
	
	private int service_provider_id;
	private String sp_accepted_date;
	
	private String has_pets;
	private String status;
	

	private String created_date;
	
	private  String modified_date;
	private int modified_by;
	private float refunded_amount;

	
	private float distance;
	private int has_issue;
	private int payment_done;
	private String record_version;
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
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
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
	public int getService_frequency() {
		return service_frequency;
	}
	public void setService_frequency(int service_frequency) {
		this.service_frequency = service_frequency;
	}
	public float getService_hourly_rate() {
		return service_hourly_rate;
	}
	public void setService_hourly_rate(float service_hourly_rate) {
		this.service_hourly_rate = service_hourly_rate;
	}
	public float getService_hours() {
		return service_hours;
	}
	public void setService_hours(float service_hours) {
		this.service_hours = service_hours;
	}
	public float getExtra_hours() {
		return extra_hours;
	}
	public void setExtra_hours(float extra_hours) {
		this.extra_hours = extra_hours;
	}
	public float getSub_total() {
		return sub_total;
	}
	public void setSub_total(float sub_total) {
		this.sub_total = sub_total;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
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
	public String getPayment_transaction_ref_no() {
		return payment_transaction_ref_no;
	}
	public void setPayment_transaction_ref_no(String payment_transaction_ref_no) {
		this.payment_transaction_ref_no = payment_transaction_ref_no;
	}
	public float getPayment_due() {
		return payment_due;
	}
	public void setPayment_due(float payment_due) {
		this.payment_due = payment_due;
	}
	public String getJob_status() {
		return job_status;
	}
	public void setJob_status(String job_status) {
		this.job_status = job_status;
	}
	public int getService_provider_id() {
		return service_provider_id;
	}
	public void setService_provider_id(int service_provider_id) {
		this.service_provider_id = service_provider_id;
	}
	public String getSp_accepted_date() {
		return sp_accepted_date;
	}
	public void setSp_accepted_date(String sp_accepted_date) {
		this.sp_accepted_date = sp_accepted_date;
	}
	public String getHas_pets() {
		return has_pets;
	}
	public void setHas_pets(String has_pets) {
		this.has_pets = has_pets;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getModified_date() {
		return modified_date;
	}
	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	public float getRefunded_amount() {
		return refunded_amount;
	}
	public void setRefunded_amount(float refunded_amount) {
		this.refunded_amount = refunded_amount;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public int getHas_issue() {
		return has_issue;
	}
	public void setHas_issue(int has_issue) {
		this.has_issue = has_issue;
	}
	public int getPayment_done() {
		return payment_done;
	}
	public void setPayment_done(int payment_done) {
		this.payment_done = payment_done;
	}
	public String getRecord_version() {
		return record_version;
	}
	public void setRecord_version(String record_version) {
		this.record_version = record_version;
	}
	
	
	public float getService_start_time() {
		return service_start_time;
	}
	public void setService_start_time(float service_start_time) {
		this.service_start_time = service_start_time;
	}
	
	
	@Override
	public String toString() {
		return "ServiceRequest [service_req_id=" + service_req_id + ", user_id=" + user_id + ", service_id="
				+ service_id + ", service_start_date=" + service_start_date + ", postal_code=" + postal_code
				+ ", service_frequency=" + service_frequency + ", service_hourly_rate=" + service_hourly_rate
				+ ", service_hours=" + service_hours + ", extra_hours=" + extra_hours + ", sub_total=" + sub_total
				+ ", discount=" + discount + ", total_cost=" + total_cost + ", comments=" + comments
				+ ", payment_transaction_ref_no=" + payment_transaction_ref_no + ", payment_due=" + payment_due
				+ ", job_status=" + job_status + ", service_start_time=" + service_start_time + ", service_provider_id="
				+ service_provider_id + ", sp_accepted_date=" + sp_accepted_date + ", has_pets=" + has_pets
				+ ", status=" + status + ", created_date=" + created_date + ", modified_date=" + modified_date
				+ ", modified_by=" + modified_by + ", refunded_amount=" + refunded_amount + ", distance=" + distance
				+ ", has_issue=" + has_issue + ", payment_done=" + payment_done + ", record_version=" + record_version
				+ "]";
	}
}
