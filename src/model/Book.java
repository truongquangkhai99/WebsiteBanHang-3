package model;

public class Book {
	String id;
	String title;
	String price;
	String sale_price;
	String publish_year;
	String picture;
	String page_number;
	String quantity;
	String quotes_about;
	String author_id;
	String publisher_id;
	String category_id;
	String _new;
	
	public Book(String id, String title, String price, String sale_price, String publish_year, String picture,
			String page_number, String quantity, String quotes_about, String author_id, String publisher_id,
			String category_id, String _new) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.sale_price = sale_price;
		this.publish_year = publish_year;
		this.picture = picture;
		this.page_number = page_number;
		this.quantity = quantity;
		this.quotes_about = quotes_about;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.category_id = category_id;
		this._new = _new;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSale_price() {
		return sale_price;
	}
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}
	public String getPublish_year() {
		return publish_year;
	}
	public void setPublish_year(String publish_year) {
		this.publish_year = publish_year;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPage_number() {
		return page_number;
	}
	public void setPage_number(String page_number) {
		this.page_number = page_number;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getQuotes_about() {
		return quotes_about;
	}
	public void setQuotes_about(String quotes_about) {
		this.quotes_about = quotes_about;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public String getPublisher_id() {
		return publisher_id;
	}
	public void setPublisher_id(String publisher_id) {
		this.publisher_id = publisher_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String get_new() {
		return _new;
	}
	public void set_new(String _new) {
		this._new = _new;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", price=" + price + ", sale_price=" + sale_price
				+ ", publish_year=" + publish_year + ", picture=" + picture + ", page_number=" + page_number
				+ ", quantity=" + quantity + ", quotes_about=" + quotes_about + ", author_id=" + author_id
				+ ", publisher_id=" + publisher_id + ", category_id=" + category_id + ", _new=" + _new + "]";
	}
	
}
