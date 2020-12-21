<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Book"%>
<%@page import="dao.BookDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String id = request.getParameter("id");
Book book = BookDAO.mapSanPham.get(id);
%>
<!DOCTYPE html>
<html>
<head>
<title>Thông tin sản phẩm</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<strong>Thông tin sản phẩm</strong> <a href="../showbook.jsp"
					style="float: right">
					<button class="btn btn-success btn-sm">
						<i class="fa fa-undo" aria-hidden="true"></i> Trở về
					</button>
				</a>
			</h2>
			<hr>
		</div>
		<div style="display: flex; flex-direction: row">
			<div>
				<img src="/WebsiteBanHang/<%=book.getPicture()%>"
					class="img-responsive" style="width: 150px; height: auto" />
			</div>
			<div>
				<form class="form-horizontal">

					<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span> Mã sản phẩm:</label>
							<div class="col-sm-8">
								<%
									out.print(book.getId());
								%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span> Tên sản phẩm:</label>
							<div class="col-sm-8">
								<%
									out.print(book.getTitle());
								%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span>Giá tiền:</label>
							<div class="col-sm-8">
								<%
								DecimalFormat formatter = new DecimalFormat("###,###,###");
								out.print(formatter.format(Float.parseFloat(book.getPrice())));%> VNĐ
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span> Nhà xuất bản:</label>
							<div class="col-sm-8">
								<%=book.getPublisher_id()%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span> Tác giả:</label>
							<div class="col-sm-8">
								<%=book.getAuthor_id()%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for=""><span
								class=""></span> Thể loại:</label>
							<div class="col-sm-8">
								<%=book.getCategory_id()%>
							</div>
						</div>

					</div>
				</form>
			</div>
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