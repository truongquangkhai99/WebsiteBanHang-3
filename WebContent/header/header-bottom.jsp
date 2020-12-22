<%@page import="java.util.List"%>
<%@page import="model.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<CartItem> listBooks = (List) session.getAttribute("orderCart");   
%>
<%!
	public float mulNum(String a, int b) {
		float x = Float.parseFloat(a);  

     	return x*b;
  	}
%>
<%!
	public String formatMoney(String a) {
		float x = Float.parseFloat(a);  
		String result = String.format("%,.0f", x);
     	return result;
  	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header-bottom">
		<div class="top-nav">
			<ul class="megamenu skyblue">
				<li class="active grid"><a href="index.jsp">Sách</a></li>
				<li><a class="pink" href="index.jsp">Sách giảm giá</a></li>
			</ul>
		</div>
		<div class="cart icon1 sub-icon1">
			<%
				int count = 0;
             	float sum = 0;
             	if(listBooks != null ) {
					for (CartItem sp : listBooks) {
						count++;
						sum += mulNum(sp.getBook().getSale_price(), sp.getQuantity());
					}
             	}
			%>
			<h6>
				Giỏ hàng: <span class="item"><%=count %> sản phẩm</span> <span class="rate"><% out.print(formatMoney(Float.toString(sum))); %> VNĐ</span>
				<li><a href="#" class="round"> </a>
					<ul class="sub-icon1 list">
						<h3>Sản phẩm đã thêm (<%=count %>)</h3>
						<div class="shopping_cart">
						<%
             				if(listBooks != null ) {
								for (CartItem sp : listBooks) {
						%>
							<div class="cart_box">
								<div class="message">
									<div class="list_img">
										<img src="<%=sp.getBook().getPicture() %>"  style="width: 60px;"  class="img-responsive" alt="<%=sp.getBook().getTitle() %>">
									</div>
									<div class="list_desc">
										<h4>
											<a href="Book?id=<%=sp.getBook().getId()%>&func=Detail"><%=sp.getBook().getTitle() %></a>
										</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						<%
								}
             				}
						%>
						</div>
						<div class="check_button">
							<a href="cart.jsp">Xem giỏ hàng</a>
						</div>
						<div class="clearfix"></div>
					</ul></li>
			</h6>

		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>