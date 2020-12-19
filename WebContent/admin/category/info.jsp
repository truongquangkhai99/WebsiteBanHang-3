<%@page import="dao.AuthorDAO"%>
<%@page import="model.Author"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
		String id = request.getParameter("id");
		Author tg = AuthorDAO.mapTacGia.get(id);
	%>
<!DOCTYPE html>
<html>
<head>
<title>Thông tin tác giả</title>
<meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="img/icon2.jpg" />
<!-- Bootstrap -->
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<h2>
				<strong>Thông tin tác giả</strong>
				<a href="showcustomer.jsp" style="float: right"> <button class="btn btn-success btn-sm" ><i class="fa fa-undo" aria-hidden="true"></i> Trở về</button></a>
			</h2>
			<hr>
		</div>
		<div class="">
		</div>
		  		 <form class="form-horizontal" >
		          <div class="modal-body" >
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Tên Tác giả:</label>
		               <div class="col-sm-8">
		                 <%out.print(tg.getName()); %>
		           		</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span>Thông tin:</label>
		               <div class="col-sm-8">
		                    <%out.print(tg.getInfo()); %>
		            	</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-4" for=""><span class=""></span> Hình ảnh:</label>
		                  <div class="col-sm-8">
		                  <img src="<%out.print(tg.getPicture()); %>" class="img-responsive" style="width: 150px; height: auto"/>
		                       
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