<%@page import="dao.OrderDAO"%>
<%@page import="dao.ProducerDAO"%>
<%@page import="model.Book"%>
<%@page import="java.util.Map"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.ProductOrder"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
  <%
  	User kh =(User)session.getAttribute("KhachHang");
    		BookDao.mapProduct=ProductDAO.getLoadProductDTB();
    		OrderDAO.mapOrder =OrderDAO.getLoadOrderDTB();
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Đặt hàng online</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="shortcut icon" href="img/icon2.jpg" />
	<!-- Bootstrap -->
	<link href="vendors/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
	<!-- Font Awesome -->
	<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

	<!-- Datatables -->
	<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
	<link
	href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
	<link
	href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
	<link
	href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
	<link
	href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
	<style type="text/css">
		th {
			text-align: center;
		}
		
	</style>
</head>
<body>
<header>
	<jsp:include page="menu/menu.jsp"></jsp:include>
</header>
	<div class="container">
		<div class="content">
			<div class="row">
				<h3>Đặt hàng online:</h3>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="row">
						<label><strong><span class="glyphicon glyphicon-user"></span>  Nhập tên khách hàng:</strong></label>
						<jsp:include page="search/searchcustomer.jsp"></jsp:include>
					</div>
					<%if(kh!=null){ %>
					<div class="row">
						<P>Mã khách hàng:<%out.print(kh.getId()); %></P>
						<p>Tên tài khoản:<%out.print(kh.getUsername()); %></p>
						<p>Tên khách hàng:<%out.print(kh.getName()); %></p>
						<p>Số điện thoại:<%out.print(kh.getPhone()); %></p>
					</div>
					<div class="row">
						<a href="Search?chucNang=changeCustomer"><button class="btn btn-sm btn-danger"><i class="fa fa-users" aria-hidden="true"></i>  Đổi khách hàng</button></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-12">
							<jsp:include page="search/searchproducer.jsp"></jsp:include>
						</div>
						
					</div>
						<br>
						<br>		
						 <%
							Map<String, Product> mapProductOrder = ProductDAO.mapProductOrder;
						 %>			
					<div class="row">
						<div class="col-dm-12">
							<table id="datatable-buttons" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>STT</th>
										<th>Mã sản phẩm</th>
										<th>Tên sản phẩm</th>
										<th>Nhà sản xuất</th>
										<th>Giá tiền</th>
										<th>Xóa</th>
										<th>Thông tin</th>
									</tr>
								</thead>

								<tbody>
									<%
									int count = 0;
								for (Product sp : mapProductOrder.values()) {
									count++;
									%>
									<tr>
										<td><%=count%></td>
										<td><%=sp.getProductID()%></td>
										<td><%=sp.getProductName()%></td>
										<td><%out.print(new ProducerDAO().getProducerName(sp.getProducerID()));%></td>
										<td><%=sp.getPrice()%></td>
										<td><a href="Search?chucNang=delProduct&id=<%=sp.getProductID()%>">
											<button type="button" class="btn btn-sm btn-danger" id=""
											aria-label="Right Align">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										</button>
									</a></td>
								<td>	<a href="product/product.jsp?id=<%=sp.getProductID()%>&chucNang=Info"><button type="button" class="btn  btn-sm btn-primary"
									aria-label="Right Align">
									<span class="glyphicon glyphicon-info-sign" ></span>
								</button></a>
							</td>

						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<center><a href="Search?chucNang=OutOrder"><button class="btn btn-sm btn-primary"><i class="fa fa-truck" aria-hidden="true"></i>  Xuất đơn hàng</button></a></center>
		</div>
	</div>
	<%} %>
</div>
</div>
</div>	
	
</body>
<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Datatables -->
<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script
src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>



</html>