package model;

import java.time.LocalDateTime;

public class Review {
    String id;
    LocalDateTime post_date;
    Integer star;
    String comment;
    String user_id;
    String book_id;
	public Review(String id, LocalDateTime post_date, Integer star, String comment, String user_id, String book_id) {
		super();
		this.id = id;
		this.post_date = post_date;
		this.star = star;
		this.comment = comment;
		this.user_id = user_id;
		this.book_id = book_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public LocalDateTime getPost_date() {
		return post_date;
	}
	public void setPost_date(LocalDateTime post_date) {
		this.post_date = post_date;
	}
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	@Override
	public String toString() {
		return "Review [id=" + id + ", post_date=" + post_date + ", star=" + star + ", comment=" + comment
				+ ", user_id=" + user_id + ", book_id=" + book_id + "]";
	}
}
