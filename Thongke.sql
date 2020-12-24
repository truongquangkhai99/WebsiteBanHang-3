

-- thống kê số lượng đơn hàng trong 10 ngày gần đây nhất (đếm count của từng ngày một) (line chart)
SELECT count(*) as [Số đơn] FROM orders WHERE order_date = DATEFROMPARTS(2020, 12, 19)

SELECT count(*) as [Số đơn] FROM orders WHERE order_date = CONVERT(DATETIME,'19-12-2020', 103)

-- thống kê 10 sách bán chạy nhất trong tháng (pie chart)
SELECT top 10 book_id, SUM(quantity) as [quantity]
FROM orders, order_details 
WHERE MONTH(order_date) = 12 and orders.id = order_details.order_id and YEAR(order_date) = YEAR(GETDATE())
GROUP BY book_id

-- thống kê tổng doanh thu tháng so với tháng trước (double line)
SELECT Sum(orders.total) as [Doanh thu] 
FROM orders 
WHERE MONTH(order_date) = 12 and YEAR(order_date) = YEAR(GETDATE())

-- thống kê doanh thu theo từng tháng (12 tháng gần đây nhất)(bar chart)
select year(order_date) as year_order from orders group by year(order_date)

DECLARE @month INT = 1;
DECLARE @result TABLE
( thoigian varchar(20), 
 doanhthu float)
WHILE @month < 13
BEGIN
   Insert into @result values(@month,(select Sum(orders.total) as [Doanh thu] FROM orders WHERE MONTH(order_date) = @month and YEAR(order_date) = 2020))
   SET @month = @month + 1;
END;
select * from @result

SELECT Sum(orders.total) as [Doanh thu] FROM orders WHERE MONTH(order_date) = 12 and YEAR(order_date) = 2020
go
CREATE FUNCTION getRevenueOnceMonth (@yearInp INT)
RETURNS @result TABLE
	( thoigian varchar(20), 
	 doanhthu float)
AS BEGIN
	DECLARE @year INT;
	SET @year = @yearInp;
	DECLARE @month INT = 1;
	WHILE @month < 13
	BEGIN
	   Insert into @result values(@month,(select Sum(orders.total) FROM orders WHERE MONTH(order_date) = @month and YEAR(order_date) = YEAR(GETDATE())))
	   SET @month = @month + 1;
	END;
	RETURN
END

GO 
SELECT * FROM getRevenueOnceMonth(1);

-- thống kê đơn hàng theo khoảng ngày (edit lại chỗ drop down ở showorder)
select * from orders where order_date between DATEFROMPARTS(2020, 12, 18) and DATEFROMPARTS(2020, 12, 20)

-- thống kê số lượng sản phẩm còn lại dưới 50 sản phẩm (table) 
select * from books where quantity < 50