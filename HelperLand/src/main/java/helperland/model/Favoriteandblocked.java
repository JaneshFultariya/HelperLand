package helperland.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="favoriteandblocked")
@Table(name="favoriteandblocked")
public class Favoriteandblocked {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private int UserId;
	
	private int TargetUserId;
	
	private int IsFavorite;
	
	private int IsBlocked;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public int getTargetUserId() {
		return TargetUserId;
	}

	public void setTargetUserId(int targetUserId) {
		TargetUserId = targetUserId;
	}

	public int getIsFavorite() {
		return IsFavorite;
	}

	public void setIsFavorite(int isFavorite) {
		IsFavorite = isFavorite;
	}

	public int getIsBlocked() {
		return IsBlocked;
	}

	public void setIsBlocked(int isBlocked) {
		IsBlocked = isBlocked;
	}

	@Override
	public String toString() {
		return "Favoriteandblocked [id=" + id + ", UserId=" + UserId + ", TargetUserId=" + TargetUserId
				+ ", IsFavorite=" + IsFavorite + ", IsBlocked=" + IsBlocked + "]";
	}
	
	
}
