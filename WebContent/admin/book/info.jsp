<%@page import="dao.ProducerDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.KhachHangDAO"%>
<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%	String id = request.getParameter("id");
			Product kh = ProductDAO.mapProduct.get(id);
		%>
<!DOCTYPE html>
<html>
<head>
<title>Thông tin sản phẩm</title>
<meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="img/icon2.jpg" />
<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<h2>
				<strong>Thông tin sản phẩm</strong>
				<a href="../showproduct.jsp" style="float: right"> <button class="btn btn-success btn-sm" ><i class="fa fa-undo" aria-hidden="true"></i> Trở về</button></a>
			</h2>
			<hr>
		</div>
		<div class="">
		</div>
		  		 <form class="form-horizontal" >
		          <div class="modal-body" >
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Mã sản phẩm:</label>
		               <div class="col-sm-8">
		                 <%out.print(kh.getProductID()); %>
		           		</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Tên sản phẩm:</label>
		               <div class="col-sm-8">
		                    <%out.print(kh.getProductName()); %>
		            	</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span>Giá tiền:</label>
		                  <div class="col-sm-8">
		                       <%out.print(kh.getPrice()); %>
		            </div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Hình ảnh:</label>
		               <div class="col-sm-8">
		                   <%out.print(kh.getImg()); %>
		            	</div>
		            </div>   
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Nhà sản xuất:</label>
		               <div class="col-sm-8">
		                   <%=kh.getProducerID() %>
		            	</div>
		            </div>   
		             
		        </div>
		        </form>
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