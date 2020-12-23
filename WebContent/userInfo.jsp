<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	User infoUser = (User)session.getAttribute("customerUser"); 
	Map<String, User> mapListUsers = UserDAO.mapKhachHang;
	
	Map<String, Order> listOrdersOfUser = OrderDAO.getOrderOfUser(infoUser.getId());
%>
<%!
	public String formatMoney(float a) {
		String result = String.format("%,.0f", a);
     	return result;
  	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="css/userInfo.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<div class="info-user">
		<div class="container">
			<div class="left-box">
				<nav>
					<a onclick="tabs(0)" class="tab active"> <i class="fa fa-user"></i> </a> 
					<a onclick="tabs(1)" class="tab"> <i class="fa fa-map-marker"></i> </a> 
					<a onclick="tabs(2)" class="tab"> <i class="fa fa-shopping-cart"></i> </a> 
				</nav>
			</div>

			<div class="right-box">
				<div class="tab-show profile">
					<form action="UserServlet?userId=<%=infoUser.getId() %>&action=edit" method="post">
						<h1>Thông tin người dùng</h1>
						<h2>Tên</h2>
						<input type="text" name="userName" class="input" value="<%=infoUser.getName() %>" />
						<h2>Số điện thoại</h2>
						<input type="text" name="userPhone" class="input" value="<%=infoUser.getPhone() %>" />
						<h2>Email</h2>
						<input type="text" name="userEmail" class="input" value="<%=infoUser.getEmail() %>" />

						<button type="submit" class="btn">Cập nhập</button>
					</form>
				</div>

				<div class="tab-show payment">
					<h1>Địa chỉ</h1>
					<h2>Tỉnh/Thành phố</h2>
					<input type="text" class="input" value="Thành phố Hà Nội" />
					<h2>Quận/Huyện</h2>
					<input type="text" class="input" value="Quận Ba Đình" />
					<h2>Phường/Xã</h2>
					<input type="text" class="input" value="Phường Điện Biên" />
					<h2>Địa chỉ cụ thể</h2>
					<input type="text" class="input" value="<%=infoUser.getAddress() %>" />

					<button class="btn">Cập nhập</button>
				</div>

				<div class="tab-show subscription">
					<h1>Đơn hàng</h1>
					<div class="container-order">
						<% for(Order ord: listOrdersOfUser.values()) { %>
						<div class="order">
							<div class="date-order">
								<p>Ngày đặt</p>
								<p><%=ord.getOrder_date() %></p>
							</div>
							<div class="status-order">
								<p>Trạng thái đơn</p>
								<p><%=ord.getStatus() %></p>
							</div>
							<div class="total-money-order">
								<p>Tổng tiền</p>
								<p><%=formatMoney(ord.getTotal())%> ₫</p>
							</div>
							<a href="#"><i class="fa fa-info" aria-hidden="true"></i></a>
						</div>
						<% } %>
					</div>				
				</div>
			</div>
		</div>


		<script src="js/jquery.min.js"></script>
		<script>
			const tabBtn = document.querySelectorAll(".tab");
			const tab = document.querySelectorAll(".tab-show");
			function tabs(panelIndex) {
				console.log('as');
				tab.forEach(function (node) {
					node.style.display = "none";
				});
				tab[panelIndex].style.display = "block";
			}
			tabs(0);
		</script>
		<script>
			$(".tab").click(function() {
				$(this).addClass("active").siblings().removeClass("active");
			})
		</script>
	</div>
</body>
</html>