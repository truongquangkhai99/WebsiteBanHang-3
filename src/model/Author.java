package model;

public class Author {
    String id;
	String name;
	String info;
	String picture;
	
	public Author(String id, String name, String info, String picture) {
		super();
		this.id = id;
		this.name = name;
		this.info = info;
		this.picture = picture;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Author [id=" + id + ", name=" + name + ", info=" + info + ", picture=" + picture + "]";
	}
	
	
}
