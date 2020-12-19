<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/styleLogin.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<!--//fonts-->
<!--//slider-script-->
<script>$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close1').on('click', function(c){
		$('.message1').fadeOut('slow', function(c){
	  		$('.message1').remove();
		});
	});	  
});
</script>
<script>$(document).ready(function(c) {
	$('.alert-close2').on('click', function(c){
		$('.message2').fadeOut('slow', function(c){
	  		$('.message2').remove();
		});
	});	  
});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
				<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>		
</head>
<body> 

	<div class="wrapper">
      	<div class="title-text">
        	<div class="title login">Đăng nhập nào</div>
        
			<div class="title signup">Đăng ký ngay</div>
		</div>
		
		<div class="form-container">
        	<div class="slide-controls">
         	 	<input type="radio" name="slide" id="login" checked>
          		<input type="radio" name="slide" id="signup">
          		<label for="login" class="slide login">Đăng nhập</label>
          		<label for="signup" class="slide signup">Đăng ký</label>
          		<div class="slider-tab"></div>
			</div>
			
			<div class="form-inner">
          		<form action="login" method="post" class="login">
          		<input type="hidden" name="from" value="${pageContext.request.requestURI}" />
           	 		<div class="field">
              			<input type="text" name="username" placeholder="Tên đăng nhập" required>
            		</div>
            		
					<div class="field">
              			<input type="password" name="password" placeholder="Mật khẩu" required>
            		</div>
            		
					<div class="pass-link"><a href="#">Quên mật khẩu?</a></div>
					
					<div class="field btn">
              			<div class="btn-layer"></div>
						<input type="submit" value="Đăng nhập">
            		</div>
            		
					<div class="signup-link">Không phải thành viên? <a href="">Đăng ký ngay</a></div>
				</form>
				
				<form action="signup" class="signup" method="post">
					<input type="hidden" name="from" value="${pageContext.request.requestURI}" />
            		<div class="field">
              			<input type="text" name="username" placeholder="Tên đăng nhập" required>
            		</div>
					
					<div class="field">
              			<input type="password" name="password" placeholder="Mật khẩu" required>
            		</div>
					
					<div class="field">
              			<input type="password" placeholder="Nhập lại mật khẩu" required>
            		</div>
					
					<div class="field btn">
              			<div class="btn-layer"></div>
						<input type="submit" value="Đăng ký">
            		</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");
      signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
      });
    </script>
</body>
</html>