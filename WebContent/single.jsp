<%@page import="dao.BookDAO"%>
<%@page import="model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="dao.UndoDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.PublisherDAO"%>
<%@page import="model.Publisher"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="model.Author"%>
<%@page import="model.Review"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Map<String, Book> mapListProduct = BookDAO.mapSanPham;
	Map<String, Publisher> mapListPublisher = PublisherDAO.mapPublisher;
	Map<String, Category> mapListCategory = CategoryDAO.mapLoaiSanPham;
	Map<String, Author> mapListAuthor = AuthorDAO.mapTacGia;
	Set<String> setPublisher = BookDAO.getSetPublisher();
	Map<String, Review> mapListReviews = ReviewDAO.mapReview;
	
	
	String x = request.getParameter("id");
	Book detailBook = BookDAO.mapSanPham.get(x);
	String publisherId = detailBook.getPublisher_id();
	String authorId = detailBook.getAuthor_id();
	String categoryId = detailBook.getCategory_id();
	
	Publisher detailPublisher = PublisherDAO.mapPublisher.get(publisherId);
	Author detailAuthor = AuthorDAO.mapTacGia.get(authorId);
	Category detailCategory = CategoryDAO.mapLoaiSanPham.get(categoryId);
	
	Map<String, Book> mapListBookRelate = BookDAO.layDuLieuSachLienQuan(categoryId);
%>
<%!
	public String formatMoney(String a) {
		float x = Float.parseFloat(a);  
		String result = String.format("%,.0f", x);
     	return result;
  	}
%>
<%!
	public String percentBook(String a, String b) {
		float x = Float.parseFloat(a);  	
		float y = Float.parseFloat(b);
		String result = Float.toString((long)(100-(x*100/y)));
     	return result.substring(0, result.indexOf("."));
  	}
%>
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
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
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
						<li><a href="optionallink.html"> 
							<img class="etalage_thumb_image img-responsive" src="<%=detailBook.getPicture()%>" alt=""> 
							<img class="etalage_source_image img-responsive" src="<%=detailBook.getPicture()%>" alt="">
						</a></li>
					</ul>

				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para">
						<h4><% out.print(detailBook.getTitle());%></h4>
						<div class="para-grid">
							<span class="add-to"><%=formatMoney(detailBook.getSale_price())%>₫</span> 
							<span class="line-through"><%=formatMoney(detailBook.getPrice())%>₫</span>
							<p class="">-<%=percentBook(detailBook.getSale_price(), detailBook.getPrice())%>%</p>
							<div class="clearfix"></div>
						</div>
						<h5>Còn <%=detailBook.getQuantity()%> sản phẩm</h5>
						<form action="CartServlet?bookId=<%=detailBook.getId()%>&action=add" method="post">
						
							<div class="available">
								<h6>Số lượng :</h6>
								<div class="container-quantity">
									<span class="btn-next" onclick="nextNumQuantity()"></span>
									<span class="btn-prev" onclick="prevNumQuantity()"></span>
									<div id="box-quantity">
										<input type="text" id="quantity" name="quantity" value="1">
									</div>
								</div>
								<script type="text/javascript">
									var valueCount;
									
									function nextNumQuantity() {									
										valueCount = document.getElementById("quantity").value;
							            if (valueCount >= <%=detailBook.getQuantity()%>) {
							            }
							            else {
											valueCount++;
											document.getElementById("quantity").value = valueCount;
											const xxx = valueCount;
							            }
									}
									function prevNumQuantity() {
										valueCount = document.getElementById("quantity").value;
										
							            if (valueCount == 1) {
							            }
							            else {
							            	valueCount--;
											document.getElementById("quantity").value = valueCount;
											const xxx = valueCount;
							            }
									}
								</script>
							</div>
							<button type="submit" class="cart-an">Thêm vào giỏ</button>
						</form>

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
					<%
						for (Book sp : mapListBookRelate.values()) {
					%>
						<li>
							<img style="height: 200px" src="<%=sp.getPicture()%>" />
							<div class="grid-flex">
								<p style="padding: 0px;"><a href="Book?id=<%=sp.getId()%>&func=Detail"><%=sp.getTitle()%></a></p>
								<span style="padding: 0px;"><%=formatMoney(sp.getSale_price())%>₫</span>
							</div>
						</li>
					<%
						}
					%>
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
									<td><b>Thể loại</b></td>
									<td><%=detailCategory.getName()%></td>
								</tr>
								<tr>
									<td><b>Tác giả</b></td>
									<td><%=detailAuthor.getName()%></td>
								</tr>
								<tr>
									<td><b>Nhà xuất bản</b></td>
									<td><%=detailPublisher.getName()%></td>
								</tr>
								<tr>
									<td><b>Năm xuất bản</b></td>
									<td><%=detailBook.getPublish_year()%></td>
								</tr>
								<tr>
									<td><b>Số trang</b></td>
									<td><%=detailBook.getPage_number()%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<h4 style="margin: 15px 0;">MÔ TẢ SẢN PHẨM</h4>
				
				<div class="description-book">
					<p>
						<%=detailBook.getQuotes_about()%>
						<span id="dots">...</span>
						<span id="more-detail">
							<b>VỀ TÁC GIẢ</b> 
							<%=detailAuthor.getInfo()%>
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