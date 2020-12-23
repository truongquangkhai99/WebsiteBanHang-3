<%@page import="dao.PublisherDAO"%>
<%@page import="dao.UndoDAO"%>
<%@page import="model.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Map<String, Publisher> mapListNXB = PublisherDAO.mapPublisher;
%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý nhà xuất bản - TriThucOnline</title>
		<meta charset="utf-8">
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="shortcut icon" href="img/icon2.jpg" />
		<!-- Bootstrap -->
		<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- Datatables -->
<link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
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

<!--script hổ trợ import file từ excel -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 
  <script src="importExcel/agu.js"></script>
  <script src="importExcel/xlsx.js"></script>
  <script src="importExcel/xlsx-model.js"></script>
  <script src="importExcel/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    
    $(document).ready(function(){
      $('#btn').on('click',function(){
       var val = $('pre').text();
      alert(val.split(",")[0]);
      });
    });
  </script>

</head>
<body>
    <header>
        <jsp:include page="menu/menu.jsp"></jsp:include>
<%--         <jsp:include page="./menu/header.jsp"></jsp:include> --%>
    </header>
    <div class="container">
        <div class="row">
            <h2>
                <strong>Quản lý nhà xuất bản</strong>
            </h2>
        </div>
        <div class="row">
            <button style="margin: 10px" class="btn btn-sm btn-success" id="Them" onclick="$('#addModal').modal()">
                <span class="glyphicon glyphicon-plus"></span> Thêm nhà xuất bản
            </button>
         </div>

        <div>
            <table id="datatable-buttons" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên NXB</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>

                <tbody>
                    <%
						int count = 0;
						for (Publisher kh : mapListNXB.values()) {
							count++;
					%>
                        <tr>
                            <td>
                                <%=count%>
                            </td>
                            <td>
                                <%=kh.getName()%>
                            </td>
                            <td>
                                <button type="button" class="btn btn-sm btn-danger" aria-label="Right Align" onclick="del('<%=kh.getId()%>')">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                </button>
                                
                                <button type="button" class="btn  btn-sm btn-warning" aria-label="Right Align" onclick="edit('<%=kh.getId()%>', '<%=kh.getName()%>')">
                                    <span class="glyphicon glyphicon-edit"></span>
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
            url: 'publisher?chucNang=Delete',
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
        $("#addForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.
			var form = $(this);
            var url = form.attr('action');
            $("#addModal").modal('hide');
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
            <form id="addForm" action="publisher?chucNang=Add" method="post" enctype="multipart/form-data">
                <div class="modal-header" style="background-color: #5cb85c;color: white;text-align: center;font-size: 30px;">
                    <h4 class="modal-title">Thêm thể loại</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
						<label>Tên thể loại</label> <input type="text" class="form-control"
							name="name" id="name" required>
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
			<form id="editForm" action="publisher?chucNang=Edit" method="post" enctype="multipart/form-data">
				<div class="modal-header" style="background-color: #ec971f;color: white;text-align: center;font-size: 30px;">
					<h4 class="modal-title">Chỉnh sửa thể loại</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<input type="text" id="id" name="id" hidden>
					<div class="form-group">
						<label>Tên thê loại</label> <input type="text" class="form-control"
							name="name" id="name" required>
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