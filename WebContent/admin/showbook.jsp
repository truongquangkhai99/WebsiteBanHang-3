<%@page import="java.text.DecimalFormat"%>
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

<!-- Datatables -->
<link
	href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
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
		<%--         <jsp:include page="./menu/header.jsp"></jsp:include> --%>
	</header>
	<div class="container">
		<div class="row">
			<h2>
				<strong>Quản lý sản phẩm</strong>
			</h2>
		</div>
		<div class="row" style="margin-bottom: 10px">
			<div class="dropdown" style="float: left">
				<button class="btn btn-danger dropdown-toggle" type="button"
					data-toggle="dropdown">
					Chọn nhà xuất bản <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<%
						for (String publisher : setPublisher) {
					%>
					<li><a href="Dropdown?chucNang=Product&id=<%=publisher%>">
							<%
								out.print(new PublisherDAO().getPublisherName(publisher));
							%>
					</a></li>
					<%
						}
					%>
					<li class="divider"></li>
					<li><a href="Dropdown?chucNang=AllProduct">Tất cả</a></li>
				</ul>
			</div>

			<a style="margin-left: 10px" href="book/book.jsp?chucNang=Add"><button
					class="btn btn-sm btn-success" id="Them">
					<span class="glyphicon glyphicon-plus"></span> Thêm sản phẩm
				</button></a> <a href="Product?chucNang=DelAll"><button
					class="btn btn-sm btn-success" id="">
					<span class="glyphicon glyphicon-trash"></span> Xóa tất cả
				</button></a>
			<%
				if (!BookDAO.mapSanPham.isEmpty()) {
			%>
			<a href="Product?chucNang=UndoAll"><button
					class="btn btn-sm btn-success" id="">
					<i class="fa fa-undo" aria-hidden="true"></i> Undo
				</button></a>
			<%
				}
			%>
			<%
				if (!UndoDAO.undoBook.isEmpty()) {
			%>
			<a href="Product?chucNang=UndoOne"><button
					class="btn btn-sm btn-success" id="">
					<i class="fa fa-undo" aria-hidden="true"></i> Undo
				</button></a>
			<%
				}
			%>
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#excel">
				<i class="fa fa-file-excel-o" aria-hidden="true"></i> Import file
				excel
			</button>
			<div id="excel" class="collapse">
				<jsp:include page="importExcel/importproduct.jsp"></jsp:include>
			</div>
		</div>

		<div class="row">
			<table id="datatable-buttons"
				class="table table-condensed table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên sản phẩm</th>
						<th>Ảnh bìa</th>
						<th>Giá</th>
						<th>Giá sale</th>
						<th>Số lượng còn</th>
						<th>Chức năng</th>
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
						<td width="300"><%=sp.getTitle()%></td>
						<td><img src="../<%=sp.getPicture()%>" class="img-responsive"
							style="width: 150px; height: auto" /></td>
						<td width="120">
							<%
								DecimalFormat formatter = new DecimalFormat("###,###,###");
							out.print(formatter.format(Float.parseFloat(sp.getPrice())));
							%> VNĐ
						</td>
						<td width="120">
							<%
								out.print(formatter.format(Float.parseFloat(sp.getSale_price())));
							%> VNĐ
						</td>
						<td><%=sp.getQuantity()%></td>
						<td><a href="Product?chucNang=Delete&id=<%=sp.getId()%>">
								<button type="button" class="btn btn-sm btn-danger" id=""
									aria-label="Right Align">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</button>
						</a> <%-- 						<a href="book/book.jsp?id=<%=sp.getId()%>&chucNang=Edit"> --%>
							<button type="button" class="btn  btn-sm btn-warning"
								aria-label="Right Align"
								onclick="edit('<%=sp.getId()%>', '<%=sp.getTitle()%>','<%=sp.getPrice()%>','<%=sp.getPublish_year()%>','<%=sp.getPicture()%>','<%=sp.getPage_number()%>','<%=sp.getQuantity()%>','<%=sp.getQuotes_about()%>','<%=sp.getAuthor_id()%>','<%=sp.getPublisher_id()%>','<%=sp.getCategory_id()%>', '<%=sp.getSale_price()%>')">
								<span class="glyphicon glyphicon-edit"></span>
							</button> <!-- 						</a> --> <a
							href="book/book.jsp?id=<%=sp.getId()%>&chucNang=Info"><button
									type="button" class="btn  btn-sm btn-primary"
									aria-label="Right Align">
									<span class="glyphicon glyphicon-info-sign"></span>
								</button></a></td>

					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>


	</div>
</body>
<script type="text/javascript">
function edit(...params) {
    $("#editModal .modal-body #name").val(params[1]);
    $("#editModal .modal-body #id").val(params[0]);
    $("#editModal .modal-body #price").val(params[2]);
    $("#editModal .modal-body #publish_year").val(params[3]);
    $("#editModal .modal-body #picture").val(params[4]);
    $("#editModal .modal-body #page_number").val(params[5]);
    $("#editModal .modal-body #quantity").val(params[6]);
    $("#editModal .modal-body #quotes_about").val(params[7]);
    $("#editModal .modal-body #author_id").val(params[8]);
    $("#editModal .modal-body #publisher_id").val(params[9]);
    $("#editModal .modal-body #category_id").val(params[10]);
    $("#editModal .modal-body #sale_price").val(params[11]);
    $("#editModal .modal-body #output").attr("src", "../"+params[4]);
    $("#editModal").modal();
}
</script>
<!-- Edit Modal HTML -->
<div id="editModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editForm" action="../Product?chucNang=Edit" method="post" enctype="multipart/form-data">
				<div class="modal-header">
					<h4 class="modal-title">Chỉnh sửa sách</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<input type="text" id="id" name="id" hidden>
					<div class="form-group">
						<label>Tên sách</label> <input type="text" class="form-control"
							name="name" id="name" required>
					</div>
					<div class="form-group">
						<label>Giá tiền</label> <input type="number" min="1"
							class="form-control" name="price" id="price" required>
					</div>
					<div class="form-group">
						<label>Giá sale</label> <input type="number" min="1"
							class="form-control" name="sale_price" id="sale_price" required>
					</div>
					<div class="form-group">
						<label>Năm xuất bản</label> <input type="number" min="1"
							max="99999" class="form-control" name="publish_year"
							id="publish_year">
					</div>
					<div class="form-group">
						<label>Ảnh bìa sách</label> <input id="picture" name="picture"
							type="text" value="" hidden>
						<div class="fileinput-preview thumbnail" data-trigger="fileinput"
							style="width: 150px; height: auto">
							<img id="output" src="#" style="width: 150px; height: auto">
						</div>
						<input type="file" class="form-control-file" name="fileUpload"
							value="#" onchange="loadFile(event)" accept="image/*" />

						<script>
			                var loadFile = function (event) {
			                    var image = document.getElementById('output');
			                    image.src = URL.createObjectURL(event.target.files[0]);
			                };
			            </script>
					</div>
					<div class="form-group">
						<label>Số trang sách</label> <input type="number" min="1"
							max="99999" class="form-control" name="page_number"
							id="page_number">
					</div>
					<div class="form-group">
						<label>Số lượng sách</label> <input type="number" min="1"
							max="99999" class="form-control" name="quantity" id="quantity"
							required>
					</div>
					<div class="form-group">
						<label>Trích dẫn trong sách</label>
						<textarea class="form-control" name="quotes_about"
							id="quotes_about" rows="4" cols="50"></textarea>
					</div>
					<div class="form-group">
						<label>Tác giả</label> <select type="text" class="form-control"
							name="author_id" id="author_id" required>
							<%
								for (Author kh : mapListAuthor.values()) {

								out.print("<option value=" + kh.getId() + ">" + kh.getName() + "</option>");
							}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Nhà xuất bản</label> <select type="text"
							class="form-control" name="publisher_id" id="publisher_id"
							required>
							<%
								for (Publisher kh : mapListPublisher.values()) {

								out.print("<option value=" + kh.getId() + ">" + kh.getName() + "</option>");
							}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Thể loại</label> <select type="text" class="form-control"
							name="category_id" id="category_id" required>
							<%
								for (Category kh : mapListCategory.values()) {

								out.print("<option value=" + kh.getId() + ">" + kh.getName() + "</option>");
							}
							%>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
						value="Hủy"> <input type="submit" class="btn btn-info"
						value="Lưu">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
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