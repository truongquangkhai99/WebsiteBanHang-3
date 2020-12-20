<%@page import="dao.CouponDAO"%>
<%@page import="dao.UndoDAO"%>
<%@page import="model.Coupon"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	//ArrayList<KhachHang> listCustomer = new KhachHangDAO().getKh(); 
	HttpSession session2 = request.getSession();
	Map<String, Coupon> mapListCoupon = CouponDAO.mapCoupon;
%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý khách hàng - TriThucOnline</title>
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
<style type="text/css">
    th {
        text-align: center;
    }
    
    .modal-header,
    h4,
    .close {
        background-color: #5cb85c;
        color: white !important;
        text-align: center;
        font-size: 30px;
    }

.modal-footer {
	background-color: #f9f9f9;
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
<%--         <jsp:include page="menu/header.jsp"></jsp:include> --%>
    </header>
    <div class="container">
        <div class="row">
            <h2>
                <strong>Quản lý khách hàng</strong>
            </h2>
        </div>
<!--         <div class="row"> -->
<!--             <center> -->
                
<!--                 <a href="customer.jsp?chucNang=Add"><button class="btn btn-sm btn-success" id="Them"><span class="glyphicon glyphicon-plus"></span>  Thêm khách hàng</button></a> -->
<!--                 <a href="Process?chucNang=DelAll"><button class="btn btn-sm btn-success" id=""><span class="glyphicon glyphicon-trash"></span>  Xóa tất cả</button></a> -->

<%--                 <%if(!KhachHangDAO.mapUndo.isEmpty()){ %> --%>
<!--                     <a href="Process?chucNang=UndoAll"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a> -->
<%--                     <%} %> --%>
<%--                         <%if(!UndoDAO.undoCustomer.isEmpty()){ %> --%>
<!--                             <a href="Process?chucNang=UndoOne"><button class="btn btn-sm btn-success" id=""><i class="fa fa-undo" aria-hidden="true"></i>  Undo</button></a> -->
<%--                             <%} %> --%>

<!--                                 <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#excel"><i class="fa fa-file-excel-o" aria-hidden="true"></i>   Import file excel</button> -->
<!--                                 <div id="excel" class="collapse"> -->
<%--                                     <jsp:include page="importExcel/importcustomer.jsp"></jsp:include> --%>
<!--                                 </div> -->
<!--             </center> -->
<!--         </div> -->

        <div>
            <table id="datatable-buttons" class="table table-condensed table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã giảm giá</th>
                        <th>Giá trị</th>
                        <th>Số lần còn lại</th>
                        <th>Kích hoạt?</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>

                <tbody>
                    <%
						int count = 0;
						for (Coupon kh : mapListCoupon.values()) {
							count++;
					%>
                        <tr>
                            <td>
                                <%=count%>
                            </td>
                            <td>
                                <%=kh.getCode()%>
                            </td>
                            <td>
                                <%=kh.getDiscount()%>
                            </td>
                            <td>
                                <%=kh.getCount()%>
                            </td>
                            <td>
                                <%=kh.getIs_enable()%>
                            </td>
                            <td>
                                <a href="Process?chucNang=Delete&id=<%=kh.getId()%>">
                                    <button type="button" class="btn btn-sm btn-danger" id="" aria-label="Right Align">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									</button>
                                </a>
                                <a href="customer.jsp?id=<%=kh.getId()%>&chucNang=Edit">
                                	<button type="button" class="btn  btn-sm btn-warning" aria-label="Right Align">
										<span class="glyphicon glyphicon-edit"></span>
									</button>
								</a>
								<a href="customer.jsp?id=<%=kh.getId()%>&chucNang=Info">
									<button type="button" class="btn  btn-sm btn-primary" aria-label="Right Align">
										<span class="glyphicon glyphicon-info-sign" ></span>
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