<%@page import="dao.ProducerDAO"%>
<%@page import="java.util.Map"%>
<%@page import="model.Producer"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Thêm sản phẩm</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="shortcut icon" href="../img/icon2.jpg" />
	<!-- Bootstrap -->
	<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- Font Awesome -->
	<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

	<style type="text/css">
		p{
			padding-top: 6px;
		}
		hr{
			width: 90%;
		}
		.form-center{
			margin-left: 200px;
		}
	</style>	
	<!-- validation form -->
	<script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">

		$(document).ready(function(){
			function validatePhone(txtPhone) {
				var filter = /^[0-9-+]+$/;
				if (filter.test(txtPhone+"") && txtPhone.length>=10 && txtPhone.length<12 ) {
					return true;
				}
				else {
					return false;
				}
			}
			function validateEmail(sEmail) {
				var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if (filter.test(sEmail) ) {
					return true;
				}
				else {
					return false;
				}
			}
			$('#addproductID').bind({
				'submit':function(){
					if($('#name').val()==''){
						$('#name').css('box-shadow','0px 0px 2px 2px red');
						$('#error-name').html('Bạn không được bỏ trống trường này!');
						$('#icon-name').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#cost').val()==''){
						$('#cost').css('box-shadow','0px 0px 2px 2px red');
						$('#error-cost').html('Bạn không được bỏ trống trường này!');
						$('#icon-cost').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					if($('#producerID').val()==''){
						$('#producerID').css('box-shadow','0px 0px 2px 2px red');
						$('#error-producerID').html('Bạn không được bỏ trống trường này!');
						$('#icon-producerID').html('<span class=" glyphicon glyphicon-remove"></span>');
						return false;
					}
					
					return true;	
				},
				'keydown':function(){
					if($('#name').val().length>0){
						$('#name').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-name').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-name').html(' ');
					}
					if($('#cost').val().length>0){
						$('#cost').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-cost').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-cost').html(' ');
					}
					if($('#producerID').val().length>0){
						$('#producerID').css('box-shadow','0px 0px 1px 1px green');
						$('#icon-producerID').html('<span class="glyphicon glyphicon-ok "></span>');
						$('#error-producerID').html(' ');
					}
					
				},
			}
			);
		});

	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2><strong>Thêm sản phẩm</strong>
				<a href="../showproduct.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
			</h2>
			<hr>
		</div>
		<div class="">
		</div>
		<div class="form-center">
			<form class="form-horizontal" action="../Product?chucNang=Add" name="addcustomer" method="post" id="addproductID">
				<div class="form-group">
					<label class="control-label col-sm-2" for=""><span class=""></span> Tên sản phẩm:</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
							<input type="text" class=" form-control "  value="" name="pdName" placeholder="Tên sản phẩm" id="name">
							</div>
							<div class="col-sm-2">
								<p id="icon-name"></p>
							</div>
						</div>
						<div class="row">
							<p style="color: red" id="error-name"></p>	
						</div>
					</div>
				</div>  
				<div class="form-group">
					<label class="control-label col-sm-2" for=""><span class=""></span> Giá sản phẩm:</label>
					 <div class="col-sm-10">
		               		<div class="row">
		               			<div class="col-sm-8">
		               				<input type="number" class="form-control " name="price" value="" name="tkkh" placeholder="Giá sản phẩm" id="cost">
		               			</div>
		               			<div class="col-sm-2">
									<p id="icon-cost"></p>
		               			</div>
		               		</div>
		               		<div class="row">
		            			<p style="color: red" id="error-cost"></p>	
		               		</div>
		              
		            	</div>
				</div>  
				<div class="form-group">
					<label class="control-label col-sm-2" for=""><span class=""></span> Nhà sản xuất:</label>
					 <div class="col-sm-10">
		                  	<div class="row">
		               			<div class="col-sm-8">
		               				  <input type="text" class="form-control "   list="listProducer" value="" name="NSXID" placeholder="Nhập mã nhà sản xuất" id="producerID">
		               			
		               				<datalist id="listProducer">
										<%Map<String, Producer> mapListProducer = ProducerDAO.mapProducer;
											for (Producer kh : mapListProducer.values()) {
										%>
										<option value="<%=kh.getProducerID()%>"><%=kh.getName()%></option>
										<%
											}
										%>
									</datalist>
		               			</div>
		               			<div class="col-sm-2">
									<p id="icon-producerID"></p>
		               			</div>
		               		</div>
		               		<div class="row">
		            			 <p style="color: red" id="error-producerID"></p>	
		               		</div>
		           		 </div>
				</div>  
				<div class="form-group">        
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>  Thêm</button>
					</div>
				</div>
			</form>
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



</html>