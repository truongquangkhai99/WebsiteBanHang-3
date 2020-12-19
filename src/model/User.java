package model;

public class User {
	String id;
	String name;
	String username;
	String password;
	String address;
	String phone;
	String email;
	String picture;
	String province_code;
	String district_code;
	String ward_code;
	Boolean is_admin;
	
	public Boolean getRole() {
		return is_admin;
	}

	public void setRole(Boolean role) {
		this.is_admin = role;
	}

	public User() {
		
	}
	
	public User(String username, String pass) {
		super();
		setUsername(username);
		setPassword(pass);
		setRole(false);
	}
	
	public User(String id, String name, String username, String password, String address, String phone, String email,
			String picture, String province_code, String district_code, String ward_code, Boolean role) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.picture = picture;
		this.province_code = province_code;
		this.district_code = district_code;
		this.ward_code = ward_code;
		this.is_admin = role;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getProvince_code() {
		return province_code;
	}
	public void setProvince_code(String province_code) {
		this.province_code = province_code;
	}
	public String getDistrict_code() {
		return district_code;
	}
	public void setDistrict_code(String district_code) {
		this.district_code = district_code;
	}
	public String getWard_code() {
		return ward_code;
	}
	public void setWard_code(String ward_code) {
		this.ward_code = ward_code;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", username=" + username + ", password=" + password + ", address="
				+ address + ", phone=" + phone + ", email=" + email + ", picture=" + picture + ", province_code="
				+ province_code + ", district_code=" + district_code + ", ward_code=" + ward_code + ", is_admin=" + is_admin
				+ "]";
	}
	
}
