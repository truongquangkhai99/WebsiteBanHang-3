package model;

public class Order_detail {
    String id;
    Integer quantity;
    Float price;
    String order_id;
    String book_id;
	public Order_detail(String id, Integer quantity, Float price, String order_id, String book_id) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.price = price;
		this.order_id = order_id;
		this.book_id = book_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	@Override
	public String toString() {
		return "Order_detail [id=" + id + ", quantity=" + quantity + ", price=" + price + ", order_id=" + order_id
				+ ", book_id=" + book_id + "]";
	}
}
