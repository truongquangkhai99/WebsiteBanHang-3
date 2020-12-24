create proc add_order(@total float, @userId int, @couponCode varchar(10))
as
begin
	INSERT INTO orders(order_date, status, total, user_id, coupon_code) 
	values (GETDATE(), N'Đặt hàng', @total, @userId, @couponCode)
end 

exec add_order 556000, 2, 'phamcho'

SELECT COUNT(id) FROM orders
select * from orders
select * from order_details
select * from coupons

go

create proc add_order_detail(@quantity int, @price float, @order_id int, @book_id int)
as
begin
	INSERT INTO order_details(quantity, price, order_id, book_id) 
	values (@quantity, @price, @order_id, @book_id) 
end

exec add_order 556000, 2, 'phamcho'
go

select * from orders where user_id=2