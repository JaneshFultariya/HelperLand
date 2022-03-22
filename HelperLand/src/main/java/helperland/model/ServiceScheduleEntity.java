package helperland.model;

import java.io.Serializable;

public class ServiceScheduleEntity implements Serializable{

	private int id;
	private String title;
	private String start;
	private String end;
	private String color;
	private String textColor;
	
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "ServiceScheduleEntity [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}
