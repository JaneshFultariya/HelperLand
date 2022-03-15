package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="rating")
@Table(name="rating")
public class Rating {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int rating_id;
	
	private int service_req_id;
	
	private int rating_from;
	
	private int rating_to;
	
	private int ratings;
	
	private String comments;
	
	private String rating_date;
	
	private String is_approved;
	
	private String visible_on_home_screen;
	
	private int on_time_arrival;
	
	private int friendly;
	
	private int quality_of_service;

	public int getRating_id() {
		return rating_id;
	}

	public void setRating_id(int rating_id) {
		this.rating_id = rating_id;
	}

	public int getService_req_id() {
		return service_req_id;
	}

	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}

	public int getRating_from() {
		return rating_from;
	}

	public void setRating_from(int rating_from) {
		this.rating_from = rating_from;
	}

	public int getRating_to() {
		return rating_to;
	}

	public void setRating_to(int rating_to) {
		this.rating_to = rating_to;
	}

	public int getRatings() {
		return ratings;
	}

	public void setRatings(int ratings) {
		this.ratings = ratings;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRating_date() {
		return rating_date;
	}

	public void setRating_date(String rating_date) {
		this.rating_date = rating_date;
	}

	public String getIs_approved() {
		return is_approved;
	}

	public void setIs_approved(String is_approved) {
		this.is_approved = is_approved;
	}

	public String getVisible_on_home_screen() {
		return visible_on_home_screen;
	}

	public void setVisible_on_home_screen(String visible_on_home_screen) {
		this.visible_on_home_screen = visible_on_home_screen;
	}

	public int getOn_time_arrival() {
		return on_time_arrival;
	}

	public void setOn_time_arrival(int on_time_arrival) {
		this.on_time_arrival = on_time_arrival;
	}

	public int getFriendly() {
		return friendly;
	}

	public void setFriendly(int friendly) {
		this.friendly = friendly;
	}

	public int getQuality_of_service() {
		return quality_of_service;
	}

	public void setQuality_of_service(int quality_of_service) {
		this.quality_of_service = quality_of_service;
	}

	@Override
	public String toString() {
		return "rating [rating_id=" + rating_id + ", service_req_id=" + service_req_id + ", rating_from=" + rating_from
				+ ", rating_to=" + rating_to + ", ratings=" + ratings + ", comments=" + comments + ", rating_date="
				+ rating_date + ", is_approved=" + is_approved + ", visible_on_home_screen=" + visible_on_home_screen
				+ ", on_time_arrival=" + on_time_arrival + ", friendly=" + friendly + ", quality_of_service="
				+ quality_of_service + "]";
	}
	
	
}
