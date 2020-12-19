<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<!--//slider-script-->
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close2').on('click', function(c) {
			$('.message2').fadeOut('slow', function(c) {
				$('.message2').remove();
			});
		});
	});
</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>

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

			<div class="col-md-9">
				<div class="shoe">
					<img class="img-responsive" src="images/banner.jpg" alt="">
					<div class="shop">
						<h4>
							SHOP<span>BOOK</span>
						</h4>
						<p>2020</p>
					</div>
				</div>
				<div class="content-bottom">
					<h3>Featured products</h3>
					<div class="bottom-grid">
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh.png" alt="">
									<div class="five">
										<h6>-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh2.png" alt="">
									<div class="five">
										<h6 class="one">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh1.png" alt="">
									<div class="five">
										<h6 class="one1">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bottom-grid">
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh2.png" alt="">
									<div class="five">
										<h6 class="one">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh3.png" alt="">
									<div class="five">
										<h6 class="one1">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh4.png" alt="">
									<div class="five">
										<h6>-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bottom-grid">
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh5.png" alt="">
									<div class="five">
										<h6 class="one1">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh.png" alt="">
									<div class="five">
										<h6>-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="col-md-4 shirt">
							<div class="bottom-grid-top">
								<a href="single.jsp"><img class="img-responsive"
									src="images/sh2.png" alt="">
									<div class="five">
										<h6 class="one">-50%</h6>
									</div>
									<div class="pre">
										<p>Pure Slim Xe</p>
										<span>$60.00</span>
										<div class="clearfix"></div>
									</div></a>


							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="demo">
					<nav class="pagination-outer" aria-label="Page navigation">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <span aria-hidden="true">«</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item active"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <span aria-hidden="true">»</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>

			<div class="col-md-3 col-md">
				<div class=" possible-about">
					<h4>BỘ LỌC TÌM KIẾM</h4>
					<div class="tab1">
						<ul class="place">
							<li class="sort"><span>Khoảng giá</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<a href="#"> <input type="checkbox" id="brand" value="">
								<label for="brand"><span></span><b>500.000₫ - Lớn
										hơn</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand1" value="">
								<label for="brand1"><span></span> <b>500.000₫ -
										400.000₫</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand2" value="">
								<label for="brand2"><span></span> <b>400.000₫ -
										200.000₫</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand3" value="">
								<label for="brand3"><span></span> <b>200.000₫ -
										50.000₫</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand4" value="">
								<label for="brand4"><span></span><b>50.000₫ - Thấp
										hơn</b></label>
							</a>
						</div>
					</div>

					<div class="tab2">
						<ul class="place">
							<li class="sort"><span>Thể loại</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<a href="#"> <input type="checkbox" id="nike" value="">
								<label for="nike"><span></span><b>Tâm lý</b></label>
							</a> <a href="#"> <input type="checkbox" id="nike1" value="">
								<label for="nike1"><span></span> <b>Tình cảm</b></label>
							</a> <a href="#"> <input type="checkbox" id="nike2" value="">
								<label for="nike2"><span></span><b>Thiếu nhi</b></label>
							</a>
						</div>
					</div>

					<div class="tab3">
						<ul class="place">
							<li class="sort"><span>Tác giả</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="w_nav2" style="display: flex; flex-direction: column;">
							<a href="#"> <input type="checkbox" id="nike" value="">
								<label for="nike"><span></span><b>AA</b></label>
							</a> <a href="#"> <input type="checkbox" id="nike1" value="">
								<label for="nike1"><span></span> <b>B</b></label>
							</a> <a href="#"> <input type="checkbox" id="nike2" value="">
								<label for="nike2"><span></span><b>C</b></label>
							</a>
						</div>
					</div>

					<div class="tab4">
						<ul class="place">
							<li class="sort"><span>Nhà cung cấp</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<a href="#"> <input type="checkbox" id="up" value="">
								<label for="up"><span></span><b>A</b></label>
							</a> <a href="#"> <input type="checkbox" id="up1" value="">
								<label for="up1"><span></span> <b>B</b></label>
							</a> <a href="#"> <input type="checkbox" id="up2" value="">
								<label for="up2"><span></span> <b>B</b></label>
							</a> <a href="#"> <input type="checkbox" id="up3" value="">
								<label for="up3"><span></span> <b>B</b></label>
							</a> <a href="#"> <input type="checkbox" id="up4" value="">
								<label for="up4"><span></span><b>B</b></label>
							</a>
						</div>
					</div>

					<div class="tab5">
						<ul class="place">
							<li class="sort"><span>Đánh giá</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="star-at">
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
								<a href="#"><i></i></a> <a href="#"><i></i></a>
							</div>
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
								<a href="#"><i></i></a>
							</div>
							<div class="two">
								<a href="#"><i></i></a> <a href="#"><i></i></a> <a href="#"><i></i></a>
							</div>
						</div>
					</div>

					<!--script-->
					<script>
						$(document).ready(function() {
							$(".tab1 .single-bottom").hide();
							$(".tab2 .single-bottom").hide();
							$(".tab3 .w_nav2").hide();
							$(".tab4 .single-bottom").hide();
							$(".tab5 .star-at").hide();
							$(".tab1 ul").click(function() {
								$(".tab1 .single-bottom").slideToggle(300);
								$(".tab2 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
							})
							$(".tab2 ul").click(function() {
								$(".tab2 .single-bottom").slideToggle(300);
								$(".tab1 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
							})
							$(".tab3 ul").click(function() {
								$(".tab3 .w_nav2").slideToggle(300);
								$(".tab4 .single-bottom").hide();
								$(".tab5 .star-at").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
							$(".tab4 ul").click(function() {
								$(".tab4 .single-bottom").slideToggle(300);
								$(".tab5 .star-at").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
							$(".tab5 ul").click(function() {
								$(".tab5 .star-at").slideToggle(300);
								$(".tab4 .single-bottom").hide();
								$(".tab3 .w_nav2").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab1 .single-bottom").hide();
							})
						});
					</script>
					<!-- script -->
				</div>

				<div class="content-bottom-grid">
					<h3>BÁN CHẠY NHẤT</h3>

					<div class="latest-grid">
						<div class="news">
							<a href="single.jsp"><img class="img-responsive"
								src="images/si.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6>
								<a href="single.jsp">Product name here</a>
							</h6>
							<p>Description Lorem ipsum</p>
							<ul>
								<li>Price: <span>$110</span>
								</li>
								<b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="latest-grid">
						<div class="news">
							<a href="single.jsp"><img class="img-responsive"
								src="images/si1.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6>
								<a href="single.jsp">Product name here</a>
							</h6>
							<p>Description Lorem ipsum</p>
							<ul>
								<li>Price: <span>$110</span>
								</li>
								<b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="latest-grid">
						<div class="news">
							<a href="single.jsp"><img class="img-responsive"
								src="images/si.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6>
								<a href="single.jsp">Product name here</a>
							</h6>
							<p>Description Lorem ipsum</p>
							<ul>
								<li>Price: <span>$110</span>
								</li>
								<b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="latest-grid">
						<div class="news">
							<a href="single.jsp"><img class="img-responsive"
								src="images/si1.jpg" title="name" alt=""></a>
						</div>
						<div class="news-in">
							<h6>
								<a href="single.jsp">Product name here</a>
							</h6>
							<p>Description Lorem ipsum</p>
							<ul>
								<li>Price: <span>$110</span>
								</li>
								<b>|</b>
								<li>Country: <span>US</span></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>

				<!---->
				<div class="money">
					<h3>PHƯƠNG THỨC THANH TOÁN</h3>
					<ul class="money-in">
						<li><a href="#"><img class="img-responsive"
								src="images/p1.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p2.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p3.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p4.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p5.png" title="name" alt=""></a></li>
						<li><a href="#"><img class="img-responsive"
								src="images/p6.png" title="name" alt=""></a></li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!---->
		<footer>
			<jsp:include page="footer/footerlevel1.jsp"></jsp:include>
		</footer>
	</div>

	<!---->
</body>
</html>