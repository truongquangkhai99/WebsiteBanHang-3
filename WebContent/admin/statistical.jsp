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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Map<String, Order> mapListOrder = OrderDAO.mapOrder;
	Book a=null;
	User b =null;
	Set<String> setDateOrder =  OrderDAO.setDateOrder;
	Set<String> setDateOrder1 =  OrderDAO.setDateOrder;
%>
<!DOCTYPE html>
<html>
<head>
<title>Thống kê doanh thu</title>
		<meta charset="utf-8">
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
				TriThucOnline Admin Dashboard
			</h2>
		</div>

		<div class="span-2c">
            <div id="curve_chart" style="width: 900px; height: 500px"></div>
            <div id="piechart" style="width: 900px; height: 500px;"></div>
            <div id="columnchart" style="width: 900px; height: 500px;"></div>
            <script type="text/javascript">
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.load('current', {packages: ['corechart', 'bar']});
		      google.charts.setOnLoadCallback(drawChart);
		
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Ngày', 'Số đơn'],
		          <c:forEach var="item" items="${listReceipt}">['${item.time}',${item.value}],</c:forEach>
		        ]);
		
		        var options = {
		          title: 'Số lượng đơn hàng 10 ngày gần đây nhất',
		          legend: { position: 'bottom' },
		          hAxis: {
		              title: 'Ngày'
		            },
		            vAxis: {
		              title: 'Số đơn'
		            }
		        };
		        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
		        chart.draw(data, options);
		        
		        var data_hot = google.visualization.arrayToDataTable([
		            ['Tên sách', 'Số lượng bán ra'],
		            <c:forEach var="item" items="${mapTopHotBook}">['${item.getKey()}',${item.getValue()}],</c:forEach>
		          ]);

		          options = {
		            title: 'Top 10 sách có số lượng bán chạy trong tháng'
		          };

		          var chart = new google.visualization.PieChart(document.getElementById('piechart'));

		          chart.draw(data_hot, options);
		          
		          var data_doanhthu = new google.visualization.DataTable();
		          data_doanhthu.addColumn('string', 'Tháng');
		          data_doanhthu.addColumn('number', 'Doanh thu');

		          data_doanhthu.addRows([
		        	  <c:forEach var="item" items="${mapRevenue}">['${item.getKey()}',${item.getValue()}],</c:forEach>
		          ]);

		          var options1 = {
	        		chart: {
	        			title: 'Doanh thu qua từng tháng trong năm'
        	        },
		            hAxis: {
		              title: 'Tháng'
		            },
		            vAxis: {
		              title: 'Doanh thu (VNĐ)'
		            }
		          };
		          
		          var materialChart = new google.charts.Bar(document.getElementById('columnchart'));
		          materialChart.draw(data_doanhthu, options1);
		      }
		    </script>
<%-- 		    <canvas id="viewchart1" height="300" width="400" style="width: 400px; height: 300px;"></canvas> --%>
<!--             <script> -->
<!--                   var lineChartData = { -->
<%--                        labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>], --%>
<!--                        datasets: [ -->
<!--                             { -->
<!--                                   fillColor: "#FC8213", -->
<%--                                   data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>] --%>
<!--                             } -->
<!--                        ] -->
     
<!--                   }; -->
<!--                   var chart = new google.visualization.LineChart(document.getElementById("viewchart1").getContext("2d")) -->
<!--                   chart.draw(lineChartData); -->
<!--             </script> -->
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