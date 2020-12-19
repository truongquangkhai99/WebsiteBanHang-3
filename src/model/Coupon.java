package model;

import java.sql.Date;

public class Coupon {
	String id;
	String code;
	String description;
	Float discount;
	Float max_value;
	Date valid_from;
	Date valid_until;
	Integer count;
	Boolean is_enable;
	
	public Coupon(String id, String code, String description, Float discount, Float max_value, Date valid_from,
			Date valid_until, Integer count, Boolean is_enable) {
		super();
		this.id = id;
		this.code = code;
		this.description = description;
		this.discount = discount;
		this.max_value = max_value;
		this.valid_from = valid_from;
		this.valid_until = valid_until;
		this.count = count;
		this.is_enable = is_enable;
	}
	public Date getValid_from() {
		return valid_from;
	}
	public void setValid_from(Date valid_from) {
		this.valid_from = valid_from;
	}
	public Date getValid_until() {
		return valid_until;
	}
	public void setValid_until(Date valid_until) {
		this.valid_until = valid_until;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getDiscount() {
		return discount;
	}
	public void setDiscount(Float discount) {
		this.discount = discount;
	}
	public Float getMax_value() {
		return max_value;
	}
	public void setMax_value(Float max_value) {
		this.max_value = max_value;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Boolean getIs_enable() {
		return is_enable;
	}
	public void setIs_enable(Boolean is_enable) {
		this.is_enable = is_enable;
	}
	@Override
	public String toString() {
		return "Coupon [id=" + id + ", code=" + code + ", description=" + description + ", discount=" + discount
				+ ", max_value=" + max_value + ", valid_from=" + valid_from + ", valid_until=" + valid_until
				+ ", count=" + count + ", is_enable=" + is_enable + "]";
	}
	
	
	
}
