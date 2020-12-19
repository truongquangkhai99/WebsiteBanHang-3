<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive Website Template | Contact :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<link href="css/contact.css" rel="stylesheet" type="text/css" media="all" />
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
<!--header-->
	<div class="container">
		<!-- header-top -->
		<jsp:include page="header/header-top.jsp"></jsp:include>
		<!-- header-top -->
		<!-- header-bottom -->
		<jsp:include page="header/header-bottom.jsp"></jsp:include>
		<!-- header-bottom -->

		<div class="content">
			<!---->
		<div class="contact">
			<div class="col-md-8 contact-top">
				<div class="container-contact">
      				<div class="text">CẢM NHẬN CỦA BẠN VỀ CHÚNG TÔI</div>
					<form action="#">
        				<div class="form-row">
          					<div class="input-data">
            					<input type="text" required style="border-radius: 0px">
            					<div class="underline" style="padding: 0px"></div>
								<label for="">Tên</label>
          					</div>
							
          					<div class="input-data">
            					<input type="text" required style="border-radius: 0px">
            					<div class="underline" style="padding: 0px"></div>
								<label for="">Email</label>
          					</div>
						</div>
					
						<div class="form-row">
          					<div class="input-data textarea">
            					<textarea type="text" required style="border-radius: 0px; padding-top: 10px"></textarea>
								<div class="underline" style="padding: 0px"></div>
								<label for="">Đánh giá của bạn</label>
        					</div>
        				</div>
        				
						<div id="submit-btn" class="form-row submit-btn">
          					<div class="input-data">
            					<div class="inner"></div>
            					<input type="submit" value="Gửi ngay" style="margin: 0px">
          					</div>
        				</div>
      				</form>
    			</div>
			</div>
				
			<div class="col-md-4 contact-bottom">
				<h3	class="h3-address">Thông tin cửa hàng</h3>
				<ul class="social ">
					<li><span>236 Hoàng Quốc việt, Hà Nội</span></li>
					<li><span>+ 00 123 456 7890</span></li>
					<li><a href="mailto:info@example.com">info@example.com</a></li>
				</ul>
							
				<div class="map">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.653584558256!2d105.78179885057052!3d21.046542585919866!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab3240fb4b67%3A0x66e281bac2a85bee!2zMjM2IEhvw6BuZyBRdeG7kWMgVmnhu4d0LCBD4buVIE5odeG6vywgVOG7qyBMacOqbSwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1608045651763!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>

		</div>
		<!---->
		<footer>
			<jsp:include page="footer/footerlevel1.jsp"></jsp:include>
		</footer> 
	</div>

	<!---->
</body>
</html>