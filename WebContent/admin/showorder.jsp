<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.BookDAO"%>
<%@page import="model.User"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.Set"%>
<%@page import="dao.UndoDAO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Map<String, Order> mapListOrder = OrderDAO.mapOrder;
	Book a=null;
	User b =null;
	Set<String> setDateOrder =  OrderDAO.setDateOrder;
%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý đơn hàng</title>
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
</header>
	<div class="container">
		<div class="row">
			<h2>
				<strong>Quản lý đơn hàng</strong>
			</h2>
		</div>
		<div class="row" style="margin-bottom:10px">
			<div class="dropdown" style="float: left">
			  <button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown">Chọn ngày đặt hàng
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu">
			  <%for(String date:setDateOrder) {%>
			    <li><a href="Dropdown?chucNang=Order&date=<%=date%>"><%=date %></a></li>
				<%} %>			 
  				<li class="divider"></li>
			    <li><a href="Dropdown?chucNang=AllOrder">Tất cả</a></li>
			  </ul>
			</div>
<!-- 			<a style="margin-left:10px" href="order/order.jsp?chucNang=Add"><button class="btn btn-sm btn-success" id="Them"><span class="glyphicon glyphicon-plus"></span>   Thêm đơn hàng</button></a> -->
<!-- 			<a href="Order?chucNang=DelAll"><button class="btn btn-sm btn-success" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a> -->
			
<%-- 			<%if(!OrderDAO.mapUndo.isEmpty()){ %> --%>
<!-- 				<a href="Order?chucNang=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a> -->
<%-- 			<%} %> --%>
<%-- 			<%if(!UndoDAO.undoOrder.isEmpty()){ %> --%>
<!-- 				<a href="Order?chucNang=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a> -->
<%-- 			<%} %> --%>
			
			<button  type="button" style="margin-left:10px" class="btn btn-info" data-toggle="collapse" data-target="#excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>   Import file excel</button>
					<div id="excel" class="collapse">
	         		   <jsp:include page="importExcel/importorder.jsp"></jsp:include>
	              </div>
		</div>

		<div>
			<table id="datatable-buttons"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Tên sản phẩm</th>
						<th>Khách hàng</th>
						<th>Trạng thái</th>
						<th>Ngày đặt hàng</th>
						<th>Tổng tiền</th>
						<th>Chức năng</th>
					</tr>
				</thead>

				<tbody>
					<%
						int count = 0;
						for (Order od : mapListOrder.values()) {
							count++;
							int order_status = 0;
					%>
					<tr>
						<td><%=count%></td>
						<td><%out.print(new BookDAO().getNameBook(od.getId()));%></td>
						<td><%out.print(UserDAO.getNameCustomer(od.getUser_id()));%></td>
						<td><span style="font-size:50" class="status text-info">&bull;</span><%=od.getStatus()%></td>
						<td><%=od.getOrder_date()%></td>
						<td><%DecimalFormat formatter = new DecimalFormat("###,###,###");
						out.print(formatter.format(od.getTotal())); %> VNĐ</td>
						<td>
							<button type="button" class="btn btn-sm btn-danger" aria-label="Right Align" onclick="del('<%=od.getId()%>')">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</button>
							
							<button type="button" class="btn  btn-sm btn-warning" aria-label="Right Align" onclick="edit('<%=od.getId()%>', '<%=od.getStatus()%>')">
								<span class="glyphicon glyphicon-edit"></span>
							</button>
							
							<button	type="button" class="btn  btn-sm btn-primary"
								aria-label="Right Align" onclick="ChiTietDH('<%=od.getId()%>')">
								<span class="glyphicon glyphicon-info-sign"></span>
							</button>
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
	function ChiTietDH(madh) {
		$.ajax({
			type: 'GET',
			url: 'order?chucNang=Detail&id='+madh,
			success: function (data) {
				$("#All_Dialog").html(data);
			}
		});
		$('#title_modal').text("Chi tiết đơn hàng");
		$('#myModal').on('shown.bs.modal', function () {
			$(this).find('.modal-dialog').css({
				width: '100%',
				height: 'auto',
				'max-height': '100%',
				'max-width': '1000px',
			});
		});
		$("#myModal").modal();
	}

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
            url: 'order?chucNang=Delete',
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
		$("#editModal .modal-body #order_status").val(params[1]);
		$("#editModal .modal-body #id").val(params[0]);
		$("#editModal").modal();
	}

	$(document).ready(function () {
        $("#editForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
			var form = $(this);
            var url = form.attr('action');
            $("#editModal").modal('hide');
            $.ajax({
                type: "POST",
				url: url,
				data: form.serialize(),
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
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="title_modal">Chi tiết đơn hàng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div id="All_Dialog"></div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>
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
<!-- Edit Modal HTML -->
<div id="editModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editForm" action="order?chucNang=Edit" method="post" enctype="multipart/form-data">
				<div class="modal-header" style="background-color: #ec971f;color: white;text-align: center;font-size: 30px;">
					<h4 class="modal-title">Cập nhật đơn hàng</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<input type="text" id="id" name="id" hidden>
					<div class="form-group">
						<label>Trạng thái</label>
						<select class="form-control" style="width:250px" id="order_status" name="order_status">
							<option value="Đặt hàng">Đặt hàng</option>
							<option value="Đóng gói">Đóng gói</option>
							<option value="Vận chuyển">Vận chuyển</option>
							<option value="Nhận hàng">Nhận hàng</option>
							<option value="Hủy">Hủy</option>
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