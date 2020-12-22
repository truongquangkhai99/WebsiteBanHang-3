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
<title>Quản lý sản phẩm</title>
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

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
	th {
		text-align: center;
	}
	.modal-header, h4, .close {
		text-align: center;
		font-size: 30px;
}
    .modal-confirm {
        color: #434e65;
        width: 525px;
    }
        .modal-confirm .modal-content {
            padding: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
        }
        .modal-confirm .modal-header {
            background: #47c9a2;
            border-bottom: none;
            position: relative;
            text-align: center;
            margin: -20px -20px 0;
            border-radius: 5px 5px 0 0;
            padding: 35px;
        }
        .modal-confirm h4 {
            text-align: center;
            font-size: 36px;
            margin: 10px 0;
        }
        .modal-confirm .form-control, .modal-confirm .btn {
            min-height: 40px;
            border-radius: 3px;
        }
        .modal-confirm .close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: #fff;
            text-shadow: none;
            opacity: 0.5;
        }
            .modal-confirm .close:hover {
                opacity: 0.8;
            }
        .modal-confirm .icon-box {
            color: #fff;
            width: 95px;
            height: 95px;
            display: inline-block;
            border-radius: 50%;
            z-index: 9;
            border: 5px solid #fff;
            padding: 15px;
            text-align: center;
        }
            .modal-confirm .icon-box i {
                font-size: 64px;
                margin: -4px 0 0 -4px;
            }
        .modal-confirm.modal-dialog {
            margin-top: 80px;
        }
        .modal-confirm .btn, .modal-confirm .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #eeb711 !important;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            border-radius: 30px;
            margin-top: 10px;
            padding: 6px 20px;
            border: none;
        }
            .modal-confirm .btn:hover, .modal-confirm .btn:focus {
                background: #eda645 !important;
                outline: none;
            }
            .modal-confirm .btn span {
                margin: 1px 3px 0;
                float: left;
            }
            .modal-confirm .btn i {
                margin-left: 1px;
                font-size: 20px;
                float: right;
            }
    .modal-confirm-delete {
        color: #636363;
        width: 400px;
        margin: 30px auto;
    }
        .modal-confirm-delete .modal-content {
            padding: 20px;
            border-radius: 5px;
            border: none;
            text-align: center;
            font-size: 14px;
        }
        .modal-confirm-delete .modal-header {
            border-bottom: none;
            position: relative;
        }
        .modal-confirm-delete h4 {
            text-align: center;
            font-size: 26px;
            margin: 30px 0 -10px;
        }
        .modal-confirm-delete .close {
            position: absolute;
            top: -5px;
            right: -2px;
        }
        .modal-confirm-delete .modal-body {
            color: #999;
        }
        .modal-confirm-delete .modal-footer {
            border: none;
            text-align: center;
            border-radius: 5px;
            font-size: 13px;
            padding: 10px 15px 25px;
        }
            .modal-confirm-delete .modal-footer a {
                color: #999;
            }
        .modal-confirm-delete .icon-box {
            width: 80px;
            height: 80px;
            margin: 0 auto;
            border-radius: 50%;
            z-index: 9;
            text-align: center;
            border: 3px solid #f15e5e;
        }
            .modal-confirm-delete .icon-box i {
                color: #f15e5e;
                font-size: 46px;
                display: inline-block;
                margin-top: 13px;
            }
        .modal-confirm-delete .btn {
            color: #fff;
            border-radius: 4px;
            background: #60c7c1;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            min-width: 120px;
            border: none;
            min-height: 40px;
            border-radius: 3px;
            margin: 0 5px;
            outline: none !important;
        }
        .modal-confirm-delete .btn-info {
            background: #c1c1c1;
        }
            .modal-confirm-delete .btn-info:hover, .modal-confirm .btn-info:focus {
                background: #a8a8a8;
            }
        .modal-confirm-delete .btn-danger {
            background: #f15e5e;
        }
            .modal-confirm-delete .btn-danger:hover, .modal-confirm .btn-danger:focus {
                background: #ee3535;
            }
    .trigger-btn {
        display: inline-block;
        margin: 100px auto;
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

			<button style="margin-left: 10px" class="btn btn-sm btn-success" id="Them" onclick="$('#addModal').modal()">
				<span class="glyphicon glyphicon-plus"></span> Thêm sản phẩm
			</button>
			<!-- <a style="margin-left: 10px" href="book/book.jsp?chucNang=Add"><button
					class="btn btn-sm btn-success" id="Them">
					<span class="glyphicon glyphicon-plus"></span> Thêm sản phẩm
				</button></a> -->
				 <a href="Book?chucNang=DelAll">
					 <button
					class="btn btn-sm btn-success" id="">
					<span class="glyphicon glyphicon-trash"></span> Xóa tất cả
				</button>
			</a>
			<%
				if (!BookDAO.mapSanPham.isEmpty()) {
			%>
			<a href="Book?chucNang=UndoAll"><button
					class="btn btn-sm btn-success" id="">
					<i class="fa fa-undo" aria-hidden="true"></i> Undo all
				</button></a>
			<%
				}
			%>
			<%
				if (!UndoDAO.undoBook.isEmpty()) {
			%>
			<a href="Book?chucNang=UndoOne"><button
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
						<td>
							<button type="button" class="btn btn-sm btn-danger" aria-label="Right Align" onclick="del('<%=sp.getId()%>')">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</button>
							
							<button type="button" class="btn  btn-sm btn-warning" aria-label="Right Align" onclick="edit('<%=sp.getId()%>', '<%=sp.getTitle()%>','<%=sp.getPrice()%>','<%=sp.getPublish_year()%>','<%=sp.getPicture()%>','<%=sp.getPage_number()%>','<%=sp.getQuantity()%>','<%=sp.getQuotes_about()%>','<%=sp.getAuthor_id()%>','<%=sp.getPublisher_id()%>','<%=sp.getCategory_id()%>', '<%=sp.getSale_price()%>')">
								<span class="glyphicon glyphicon-edit"></span>
							</button>
							<a href="book/book.jsp?id=<%=sp.getId()%>&chucNang=Info">
								<button	type="button" class="btn  btn-sm btn-primary"
									aria-label="Right Align">
									<span class="glyphicon glyphicon-info-sign"></span>
								</button>
							</a>
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
<script type="text/javascript">
	function del(Id) {
		$("#confirmModal").modal();
		$('#submit-del').click(function () {
			//alert('Xác nhận xóa');
			$("#confirmModal").modal('hide');
			Remove(Id);
		});
	}

	function Remove(Id) {
        $.ajax({
            type: 'POST',
            url: 'Book?chucNang=Delete',
            data: { id: Id },
            success: function (data) {
				$("#deletedModal").modal();
				$('#deletedModal').on('hide.bs.modal', function (e) {
					location.reload();
				})
                
            },
            error: function () {
                alert("Đã có lỗi xảy ra khi xóa");
            }
        });
    }

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
		$("#editModal .modal-body #output1").attr("src", "../"+params[4]);
		$("#editModal").modal();
	}

	$(document).ready(function () {
        $("#editForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
			var form = $(this);
			var formData = new FormData($(this)[0]);
            var url = form.attr('action');
            $("#editModal").modal('hide');
            $.ajax({
                type: "POST",
				url: url,
				contentType: false,
				processData: false,
				enctype: 'multipart/form-data',
				data: formData,
                success: function(data)
                {
                    $("#deletedModal").modal();
                    $('#deletedModal').on('hide.bs.modal', function (e) {
					location.reload();
				})
                },
                error: function(){
                    alert("Đã có lỗi xảy ra khi truy vấn");
                }
            });
            
        });
        $("#addForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
			var form = $(this);
			var formData = new FormData($(this)[0]);
            var url = form.attr('action');
            $("#addModal").modal('hide');
            $.ajax({
				type: "POST",
				url: url,
				contentType: false,
				processData: false,
				enctype: 'multipart/form-data',
				data: formData,
                success: function(data)
                {
                    $("#deletedModal").modal();
                    $('#deletedModal').on('hide.bs.modal', function (e) {
						location.reload();
					})
                },
                error: function(xhr, status, error) {
                    alert("Đã có lỗi xảy ra khi truy vấn ");
                }
            });
            
		});
	})
	
</script>
<script>
	var loadFile = function (event, add) {
		if(add)
			$("#output").attr("src",URL.createObjectURL(event.target.files[0]));
		else
			$("#output1").attr("src",URL.createObjectURL(event.target.files[0]));
	};
</script>
<!-- Deleted Modal HTML -->
<div id="deletedModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header justify-content-center">
                <div class="icon-box">
                    <i class="material-icons">&#xE876;</i>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body text-center">
                <h4>Thành công!</h4>
                <p>Đã cập nhật thành công</p>
            </div>
        </div>
    </div>
</div>
<!-- Delete Confirm Modal HTML -->
<div id="confirmModal" class="modal fade">
    <div class="modal-dialog modal-confirm-delete">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE5CD;</i>
                </div>
                <h4 class="modal-title">Bạn có chắc xóa?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Bạn có thực sự muốn xóa các bản ghi này không? Không thể hoàn tác quá trình này.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="submit-del">Xóa</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal HTML -->
<div id="addModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="addForm" action="Book?chucNang=Add" method="post" enctype="multipart/form-data">
                <div class="modal-header" style="background-color: #5cb85c;color: white;text-align: center;font-size: 30px;">
                    <h4 class="modal-title">Thêm sách</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên sách</label>
                        <input type="text" class="form-control" name="name" id="name" required>
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
							value="#" onchange="loadFile(event, true)" accept="image/*" />
					</div>
                    <div class="form-group">
                        <label>Số trang sách</label>
                        <input type="number" min="1" max="99999" class="form-control" name="page_number" id="page_number">
                    </div>
                    <div class="form-group">
                        <label>Số lượng sách</label>
                        <input type="number" min="1" max="99999" class="form-control" name="quantity" id="quantity" required>
                    </div>
                    <div class="form-group">
                        <label>Trích dẫn trong sách</label>
                        <textarea class="form-control" name="quotes_about" id="quotes_about" rows="4" cols="50"></textarea>
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
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-info" value="Lưu">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Edit Modal HTML -->
<div id="editModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editForm" action="Book?chucNang=Edit" method="post" enctype="multipart/form-data">
				<div class="modal-header" style="background-color: #ec971f;color: white;text-align: center;font-size: 30px;">
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
							<img id="output1" src="#" style="width: 150px; height: auto">
						</div>
						<input type="file" class="form-control-file" name="fileUpload"
							value="#" onchange="loadFile(event, false)" accept="image/*" />

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