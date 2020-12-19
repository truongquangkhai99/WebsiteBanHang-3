<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thêm khách hàng</title>
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
  		$('#addcustomerID').bind({
  			'submit':function(){
  						if($('#name').val()==''){
  							$('#name').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-name').html('Bạn không được bỏ trống trường này!');
  							$('#icon-name').html('<span style="color:green" class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#account').val()==''){
  							$('#account').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-account').html('Bạn không được bỏ trống trường này!');
  							$('#icon-account').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if($('#matkhau').val()==''){
  							$('#matkhau').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-pass').html('Bạn không được bỏ trống trường này!');
  							$('#icon-pass').html('<span class=" glyphicon glyphicon-remove"></span>');
  							return false;
  						}
  						if(!validatePhone($('#phone').val())){
  							$('#phone').css('box-shadow','0px 0px 2px 2px red');
  							$('#error-phone').html(' Số điện thoại bạn nhập không đúng!!! ');
  							$('#icon-phone').html('<span class=" glyphicon glyphicon-remove"></span>');
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
  						if($('#account').val().length>0){
  							$('#account').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-account').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-account').html(' ');
  						}
  						if($('#matkhau').val().length>0){
  							$('#matkhau').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-pass').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-pass').html(' ');
  						}
  						if($('#phone').val().length>0){
  							$('#phone').css('box-shadow','0px 0px 1px 1px green');
  							$('#icon-phone').html('<span class="glyphicon glyphicon-ok "></span>');
  							$('#error-phone').html(' ');
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
			<h2><strong>Thêm khách hàng</strong>
			<a href="showcustomer.jsp" style="float: right"><button class="btn btn-info"><i class="fa fa-undo" aria-hidden="true"></i>  Trở về</button></a>
			</h2>
			<hr>
		</div>
		<div class="">
		</div>
		  <div class="form-center">
		          <form class="form-horizontal" action="Process?chucNang=Add" name="addcustomer" method="post" id="addcustomerID">
					     <div class="form-group">
				              <label class="control-label col-sm-2" for=""><span class=""></span> Tên Khách hàng:</label>
					               <div class="col-sm-10">
					               		<div class="row">
					               			<div class="col-sm-8">
						             			 <input type="text" class=" form-control "  value="" name="tenKH" placeholder="Tên khách hàng" id="name">
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
		              <label class="control-label col-sm-2" for=""><span class=""></span> Tài khoản:</label>
		               <div class="col-sm-10">
		               		<div class="row">
		               			<div class="col-sm-8">
		               				<input type="text" class="form-control "  value="" name="tkkh" placeholder="Nhập tài khoản" id="account">
		               			</div>
		               			<div class="col-sm-2">
									<p id="icon-account"></p>
		               			</div>
		               		</div>
		               		<div class="row">
		            			<p style="color: red" id="error-account"></p>	
		               		</div>
		              
		            	</div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span> Mật khẩu:</label>
		                  <div class="col-sm-10">
		                  	<div class="row">
		               			<div class="col-sm-8">
		               				  <input type="password" class="form-control "  value="" name="pass" placeholder="Nhập mật khẩu" id="matkhau">
		               			</div>
		               			<div class="col-sm-2">
									<p id="icon-pass"></p>
		               			</div>
		               		</div>
		               		<div class="row">
		            			 <p style="color: red" id="error-pass"></p>	
		               		</div>
		           		 </div>
		            </div>  
		            <div class="form-group">
		              <label class="control-label col-sm-2" for=""><span class=""></span> Số điện thoại:</label>
		               <div class="col-sm-10">
		               		<div class="row">
		               			<div class="col-sm-8">
		               				   <input type="number" class="form-control "  value="" name="sdt" placeholder="Nhập vào số điện thoại" id="phone">
		               			</div>
		               			<div class="col-sm-2">
									<p id="icon-phone"></p>
		               			</div>
		               		</div>
		               		<div class="row">
		            			<p style="color: red" id="error-phone"></p>		
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
		
		<!-- Script bắt lỗi form -->

</body>

<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->


<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>



</html>