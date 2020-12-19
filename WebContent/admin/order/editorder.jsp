<%@page import="java.util.Map"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.KhachHangDAO"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%	String id = request.getParameter("id");
			Order od = OrderDAO.mapOrder.get(id);
		%>
<!DOCTYPE html>
<html>
<head>
<title>Sửa sản phẩm</title>
<meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="../img/icon2.jpg" />
<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<style type="text/css">
		p{
			padding-top: 6px;
		}
		hr{
			width: 90%;
		}
		.form-center{
			margin-left: 200px;
		}
	</style>	
	<!-- validation form -->
	<script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">

		$(document).ready(function(){
			function validatePhone(txtPhone) {
				var filter = /^[0-9-+]+$/;
				if (filter.test(txtPhone+"") && txtPhone.length>=10 && txtPhone.length<12 ) {
					return true;
				}
				else {
					return false;
				}
			}
			function validateEmail(sEmail) {
				var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if (filter.test(sEmail) ) {
					return true;
				}
				else {
					return false;
				}
			}
			$('#editorderID').bind({
				'submit':function(){
					if($('#name').val()==''){
						$('#name').css('box-shadow','0px 0px 2px 2px red');
						$('#error-name').html('Bạn không được bỏ trống trường này!');
						$('#icon-name').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#account').val()==''){
						$('#account').css('box-shadow','0px 0px 2px 2px red');
						$('#error-account').html('Bạn không được bỏ trống trường này!');
						$('#icon-account').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#date').val()==''){
						$('#date').css('box-shadow','0px 0px 2px 2px red');
						$('#error-date').html('Bạn không được bỏ trống trường này!');
						$('#icon-date').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#cost').val()==''){
						$('#cost').css('box-shadow','0px 0px 2px 2px red');
						$('#error-cost').html(' Bạn phải nhập giá tiền ');
						$('#icon-cost').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					return true;	
				},
				'keydown':function(){
					if($('#name').val().length>0){
						$('#name').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-name').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-name').html(' ');
					}
					if($('#account').val().length>0){
						$('#account').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-account').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-account').html(' ');
					}
					if($('#date').val().length>0){
						$('#date').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-date').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-date').html(' ');
					}
					if($('#cost').val().length>0){
						$('#cost').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-cost').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-cost').html(' ');
					}
				},
			}
			);
		});
	
	</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<h2><strong>Sửa đơn hàng</strong>
				<a href="../showorder.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
			</h2>
			<hr>
		</div>
		<div class="">
		</div>
		  <div class="form-center">
		          <form  class="form-horizontal" action="../Order?chucNang=Edit&masp=<%=od.getOrderID()%> " method="post" id="editorderID">
		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span> Tên sản phẩm:</label>
		              <div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<input type="text"  list="listProduct" class="form-control"  value="<%=od.getProductID()%>" name="pdName" placeholder="Tên sản phẩm" id="name">
								<datalist id="listProduct">
									<%Map<String, Product> mapListProduct = ProductDAO.mapProduct ;
									for (Product kh : mapListProduct.values()) { %>
										<option value="<%=kh.getProductID()%>"><%=kh.getProductName() %></option>
									<%} %>
								</datalist>
							
							</div>
							<div class="col-sm-2">
								<p id="icon-name"></p>
							</div>
						</div>
						<div class="row">
							<p style="color: red" id="error-name"></p>	
						</div>
					</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span> Tên khách hàng:</label>
		              <div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								 <input type="text" list="listcustomer" class="form-control"  value="<%=od.getCustomerID()%>" name="name" placeholder="Nhập tên khách hàng" id="account">
							
									<datalist id="listcustomer">
								    <%Map<String, KhachHang> mapListCustomer = KhachHangDAO.mapKhachHang; %>
								<%	for (KhachHang kh : mapListCustomer.values()) { %>
										<option value="<%=kh.getMaKH()%>"><%=kh.getTenKH() %></option>
									<%} %>
									</datalist>
							</div>
							<div class="col-sm-2">
								<p id="icon-account"></p>
							</div>
						</div>
						<div class="row">
							<p style="color: red" id="error-account"></p>	
						</div>
					</div>
		            </div> 

		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span> Ngày đặt hàng:</label>
		              <div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<input type="date" class="form-control"  value="<%=od.getDate()%>" name="date" placeholder="Chọn ngày đặt hàng" id="date">
							</div>
							<div class="col-sm-2">
								<p id="icon-date"></p>
							</div>
						</div>
						<div class="row">
							<p style="color: red" id="error-date"></p>	
						</div>
					</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span>Tổng giá tiền:</label>
		              <div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<input type="text" class="form-control"  value="<%=od.getTotalPrice()%>" name="price" placeholder="Nhập giá tiền" id="cost">
							</div>
							<div class="col-sm-2">
								<p id="icon-cost"></p>
							</div>
						</div>
						<div class="row">
							<p style="color: red" id="error-cost"></p>		
						</div>
					</div>
		            </div>  
		            <div class="form-group">        
					      <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-edit"></span> Sửa</button>
					      </div>
					    </div>
		          </form>
			</div>		
		</div>
</body>

<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>

<!-- Script modal -->

</html>