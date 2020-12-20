<%@page import="dao.BookDAO"%>
<%@page import="model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="dao.UndoDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="model.Publisher"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="model.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Map<String, Book> mapListProduct = BookDAO.mapSanPham;
	Map<String, Publisher> mapListPublisher = PublisherDAO.mapPublisher;
	Map<String, Category> mapListCategory = CategoryDAO.mapLoaiSanPham;
	Map<String, Author> mapListAuthor = AuthorDAO.mapTacGia;
	Set<String> setPublisher = BookDAO.getSetPublisher();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>Giữa kỳ</title>
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

<!-- Datatables -->
<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
th {
	text-align: center;
}

.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
<header>
	<jsp:include page="menu/menu.jsp"></jsp:include>
</header>
	<div class="container">
		<div class="row">
			<h2>
				<strong>Quản lý sản phẩm</strong>
			</h2>
		</div>
		<div class="row" style="margin-bottom:10px">
				<div class="dropdown" style="float: left">
				  <button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown">Chọn nhà xuất bản
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				  <%for(String publisher:setPublisher) {%>
				    <li><a href="Dropdown?chucNang=Product&id=<%=publisher%>"><%out.print(new PublisherDAO().getPublisherName(publisher ));%></a></li>
					<%} %>			 
	  				<li class="divider"></li>
				    <li><a href="Dropdown?chucNang=AllProduct">Tất cả</a></li>
				  </ul>
				</div>
		
				<a style="margin-left:10px" href="product/product.jsp?chucNang=Add"><button class="btn btn-sm btn-success" id="Them"><span class="glyphicon glyphicon-plus"></span>  Thêm sản phẩm</button></a>
				<a href="Product?chucNang=DelAll"><button class="btn btn-sm btn-success" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a>
				<%if(!BookDAO.mapSanPham.isEmpty()){ %>
					<a href="Product?chucNang=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
				<%} %>
				<%if(!UndoDAO.undoBook.isEmpty()){ %>
					<a href="Product?chucNang=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a>
				<%} %>
				<button  type="button" class="btn btn-info" data-toggle="collapse" data-target="#excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>   Import file excel</button>
					<div id="excel" class="collapse">
	         		   <jsp:include page="importExcel/importproduct.jsp"></jsp:include>
	              </div>
		</div>

		<div class="row">
			<table id="datatable-buttons"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên sản phẩm</th>
						<th>Ảnh bìa</th>
						<th>Giá sản phẩm</th>
						<th>Số lượng còn</th>
						<th>Nhà xuất bản</th>
						<th>Tác giả</th>
						<th>Thể loại</th>
						<th>Thông tin</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
				</thead>

				<tbody>
					<%
						int count = 0;
						for (Book sp : mapListProduct.values()) {
							count++;
					%>
					<tr>
						<td><%=count%></td>
						<td><%=sp.getTitle()%></td>
						<td><img src="../<%=sp.getPicture()%>" class="img-responsive" style="width: 150px; height: auto" /></td>
						<td><%=sp.getPrice()%></td>
						<td><%=sp.getQuantity()%></td>
						<td><%out.print(new PublisherDAO().getPublisherName(sp.getPublisher_id()));%></td>
						<td><%out.print(new PublisherDAO().getPublisherName(sp.getPublisher_id()));%></td>
						<td><%out.print(new PublisherDAO().getPublisherName(sp.getPublisher_id()));%></td>
						<td><a href="Product?chucNang=Delete&id=<%=sp.getId()%>">
								<button type="button" class="btn btn-sm btn-danger" id=""
									aria-label="Right Align">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
						</a></td>
						<td>	<a href="product/product.jsp?id=<%=sp.getId()%>&chucNang=Edit"><button type="button" class="btn  btn-sm btn-warning"
									aria-label="Right Align">
									<span class="glyphicon glyphicon-edit"></span>
								</button></a>
						</td>
						<td>	<a href="product/product.jsp?id=<%=sp.getId()%>&chucNang=Info"><button type="button" class="btn  btn-sm btn-primary"
									aria-label="Right Align">
										<span class="glyphicon glyphicon-info-sign" ></span>
								</button></a>
						</td>
								
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		
		
	</div>
</body>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script
	src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>



</html>