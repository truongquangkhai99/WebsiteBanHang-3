<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive
	Website Template | Single :: w3layouts</title>
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
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 300,
											thumb_image_height : 400,
											source_image_width : 900,
											source_image_height : 1200,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
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
				<div class="col-md-5 single-top">
					<ul id="etalage">
						<li><a href="optionallink.html"> <img
								class="etalage_thumb_image img-responsive" src="images/s1.jpg"
								alt=""> <img class="etalage_source_image img-responsive"
								src="images/s11.jpg" alt="">
						</a></li>
						<li><img class="etalage_thumb_image img-responsive"
							src="images/s2.jpg" alt=""> <img
							class="etalage_source_image img-responsive" src="images/s12.jpg"
							alt=""></li>
						<li><img class="etalage_thumb_image img-responsive"
							src="images/s3.jpg" alt=""> <img
							class="etalage_source_image img-responsive" src="images/s13.jpg"
							alt=""></li>
						<li><img class="etalage_thumb_image img-responsive"
							src="images/s4.jpg" alt=""> <img
							class="etalage_source_image img-responsive" src="images/s14.jpg"
							alt=""></li>
					</ul>

				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para">
						<h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit</h4>
						<div class="para-grid">
							<span class="add-to">$32.8</span> <a href="#" class=" cart-to">Thêm vào giỏ</a>
							<div class="clearfix"></div>
						</div>
						<h5>100 items in stock</h5>
						<div class="available">
							<h6>Available Options :</h6>
							<ul>

								<li>Size:<select>
										<option>Large</option>
										<option>Medium</option>
										<option>small</option>
										<option>Large</option>
										<option>small</option>
								</select></li>
								<li>Cost: <select>
										<option>U.S.Dollar</option>
										<option>Euro</option>
								</select></li>
							</ul>
						</div>

						<a href="#" class="cart-an ">More details</a>
						<div class="share">
							<h4>Chia sẻ sản phẩm với: </h4>
							<ul class="share_nav">
								<li><a href="#"><img src="images/facebook.png"
										title="facebook"></a></li>
								<li><a href="#"><img src="images/twitter.png"
										title="Twiiter"></a></li>
								<li><a href="#"><img src="images/rss.png" title="Rss"></a></li>
								<li><a href="#"><img src="images/gpluse.png"
										title="Google+"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>

				<h4 style="margin: 20px 0;">SẢN PHẨM TƯƠNG TỰ</h4>
				<ul id="flexiselDemo1">
					<li><img src="images/pi.jpg" />
					<div class="grid-flex">
							<a href="#">Lorem</a>
							<p>Rs 850</p>
						</div></li>
					<li><img src="images/pi1.jpg" />
					<div class="grid-flex">
							<a href="#">Amet</a>
							<p>Rs 850</p>
						</div></li>
					<li><img src="images/pi2.jpg" />
					<div class="grid-flex">
							<a href="#">Simple</a>
							<p>Rs 850</p>
						</div></li>
					<li><img src="images/pi3.jpg" />
					<div class="grid-flex">
							<a href="#">Text</a>
							<p>Rs 850</p>
						</div></li>
					<li><img src="images/pi4.jpg" />
					<div class="grid-flex">
							<a href="#">Sit</a>
							<p>Rs 850</p>
						</div></li>
				</ul>
				<script type="text/javascript">
					$(window).load(function() {
						$("#flexiselDemo1").flexisel({
							visibleItems : 5,
							animationSpeed : 1000,
							autoPlay : true,
							autoPlaySpeed : 3000,
							pauseOnHover : true,
							enableResponsiveBreakpoints : true,
							responsiveBreakpoints : {
								portrait : {
									changePoint : 480,
									visibleItems : 1
								},
								landscape : {
									changePoint : 640,
									visibleItems : 2
								},
								tablet : {
									changePoint : 768,
									visibleItems : 3
								}
							}
						});

					});
				</script>
				<script type="text/javascript" src="js/jquery.flexisel.js"></script>
				
				<h4 style="margin: 15px 0;">THÔNG TIN CHI TIẾT</h4>
				<div class="group">
					<div class="content has-table">
						<table>
							<tbody>
								<tr>
									<td><b>Công ty phát hành</b></td>
									<td>Nhà Xuất Bản Đà Nẵng</td>
								</tr>
								<tr>
									<td><b>Tác giả</b></td>
									<td>1433771174981</td>
								</tr>
								<tr>
									<td><b>Nhà xuất bản</b></td>
									<td>Nhà Xuất Bản Đà Nẵng</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<h4 style="margin: 15px 0;">MÔ TẢ SẢN PHẨM</h4>
				
				<div class="description-book">
					<p>
						Giải mã siêu trí nhớ" được in màu toàn bộ. Nội dung bao gồm nhiều phương pháp ghi nhớ đa dạng thông qua các ví dụ dí dỏm, hài hước và các hình ảnh minh hoạ trực quan sinh động, đồng thời giải mã các thử thách trong Giải đấu trí nhớ trên Thế giới và Siêu trí tuệ Việt Nam. Cuốn sách là toàn bộ các phương pháp ghi nhớ do tác giả Mai Tường Vân học hỏi và sáng tạo, cũng như kinh nghiệm đúc kết từ các trải nghiệm trong suốt thời gian gắn bó với lĩnh vực trí nhớ.
						<span id="dots">...</span><span id="more-detail">
						Giải mã siêu trí nhớ" được in màu toàn bộ. Nội dung bao gồm nhiều phương pháp ghi nhớ đa dạng thông qua các ví dụ dí dỏm, hài hước và các hình ảnh minh hoạ trực quan sinh động, đồng thời giải mã các thử thách trong Giải đấu trí nhớ trên Thế giới và Siêu trí tuệ Việt Nam. Cuốn sách là toàn bộ các phương pháp ghi nhớ do tác giả Mai Tường Vân học hỏi và sáng tạo, cũng như kinh nghiệm đúc kết từ các trải nghiệm trong suốt thời gian gắn bó với lĩnh vực trí nhớ.
						</span> 
					</p>
					
					<button type="button" id="read-more" onclick="readMore()">Xem thêm</button>
				</div>
				
				<script type="text/javascript">
					var i = 0;
					function readMore(){
						if(!i) {
							document.getElementById("more-detail").style.display = "inline";
							document.getElementById("dots").style.display = "none";
							document.getElementById("read-more").innerHTML = "Thu gọn";
							
							i = 1;
						} else {
							document.getElementById("more-detail").style.display = "none";
							document.getElementById("dots").style.display = "inline";
							document.getElementById("read-more").innerHTML = "Xem thêm";
							
							i = 0;
						}	
					}
				</script>
				<!---->
				
				<h4 style="margin: 20px 0;">KHÁCH HÀNG NHẬN XÉT</h4>
				<div class="review-book">
					<jsp:include page="RatingBook.jsp"></jsp:include>
					
					<jsp:include page="ReviewBook.jsp"></jsp:include>
				</div>
				<!---->
			</div>
			
			<div class="col-md-3 col-md">
				<div class=" possible-about">
					<h4>BỘ LỌC TÌM KIẾM</h4>
					<div class="tab1">
						<ul class="place">
							<li class="sort"><span>Tác giả</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="single-bottom">
							<a href="#"> <input type="checkbox" id="brand" value="">
								<label for="brand"><span></span><b>Hồng Hạnh</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand1" value="">
								<label for="brand1"><span></span> <b>Lương Bích Hữu</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand2" value="">
								<label for="brand2"><span></span> <b>Hồng Hà</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand3" value="">
								<label for="brand3"><span></span> <b>Phạm</b></label>
							</a> <a href="#"> <input type="checkbox" id="brand4" value="">
								<label for="brand4"><span></span><b>A</b></label>
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
							<li class="sort"><span>Khoảng giá</span></li>
							<li class="by"><img src="images/do.png" alt=""></li>
							<div class="clearfix"></div>
						</ul>

						<div class="w_nav2" style="display: flex; flex-direction: column; align-items: center;">
							<div style="display: flex; flex-direction: row; justify-content: space-between;">
								<input type="number" />
								<p> - </p>
								<input type="number" />
							</div>
							
							<button class="btn-search-price">Chọn</button>
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