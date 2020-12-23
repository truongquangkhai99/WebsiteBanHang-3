<%@page import="model.Coupon"%>
<%@page import="model.CartItem"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CartItem> listBooks = (List) session.getAttribute("orderCart");   

	float percentCoupon = 0;
	String descriptionCoupon = "";
	String codeCoupon = "";

	Coupon cp = (Coupon) request.getAttribute("valueCoupon");
	if(cp != null ){
		percentCoupon = cp.getDiscount();
		descriptionCoupon = cp.getDescription();
		codeCoupon = cp.getCode();
	}
	
%>
<%!
	public String formatMoney(String a) {
		float x = Float.parseFloat(a);  
		String result = String.format("%,.0f", x);
     	return result;
  	}
%>
<%!
	public float mulNum(String a, int b) {
		float x = Float.parseFloat(a);  

     	return x*b;
  	}
%>
<%!
	public String totalPay(float a, float b) {

     	return Float.toString(a - (a*b/100));
  	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Mihstore A Ecommerce Category Flat Bootstarp Resposive Website Template | Cart :: w3layouts</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
    		
    		<div class="shopping-cart">
            <div class="px-4 px-lg-0">

                <div class="pb-5">
                    <div class="container">
						<%
							if(listBooks != null ) {
						%>
                        <div class="row">
                            <div class="col-lg-12 bg-white rounded shadow-sm">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">STT</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Đơn Giá</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Số Lượng</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                            <%
                                            	float sum = 0;
                								int count = 0;
												for (CartItem sp : listBooks) {
													count++;
													sum += mulNum(sp.getBook().getSale_price(), sp.getQuantity());
											%>
                                                <tr>
                                                    <td class="align-middle"><strong><%=count %></strong></td>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="<%=sp.getBook().getPicture() %>" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block"><%=sp.getBook().getTitle() %></a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong><%=formatMoney(sp.getBook().getSale_price()) %> ₫</strong></td>
                                                    <td class="align-middle" style="display: flex; justify-content: space-around; align-items: center; height: 150px;">
														<form action="CartServlet?bookId=<%=sp.getBook().getId()%>&action=sub" method="post">
                                                        	<button type="submit" class="btnSub">-</button>
														</form>
                                                        	<strong><%=sp.getQuantity() %></strong>
														<form action="CartServlet?bookId=<%=sp.getBook().getId()%>&action=add" method="post">
                                                        	<button type="submit" class="btnAdd">+</button>
														</form>
                                                    </td>
                                                    <td class="align-middle">
                                                    	<form action="CartServlet?bookId=<%=sp.getBook().getId()%>&action=delete" method="post">
                                                        	<button type="submit" class="btn btn-danger" onclick="onDeleteBook()">Xóa</button>
														</form>
                                                    </td>
                                                </tr> 
                                             <%
												}
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                        <script type="text/javascript">
                        	$(document).ready(function onDeleteBook(){
                        		Swal.fire({
                      			  position: 'top-end',
                      			  icon: 'success',
                      			  title: 'Cập nhập giỏ hàng thành công',
                      			  showConfirmButton: false,
                      			  timer: 1500
                      			})
                      		});
                        </script>

                        <div class="row bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <form action="CouponProcess?action=get" method="post">
                                   		<div class="input-group mb-4 border rounded-pill p-2">
                                        	<input value="<%=codeCoupon %>" type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0" name="valuecoupon">
                                        	<div class="input-group-append border-0">
                                            	<button id="button-addon3" type="submit" class="btn btn-dark px-4 rounded-pill">
                                            		<i class="fa fa-gift mr-2"></i>Sử dụng
                                            	</button>
                                        	</div>
                                    	</div>
                                	</form>
                                	<p><%=descriptionCoupon %></p>
                                	<p></p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong><% out.print(formatMoney(Float.toString(sum))); %> ₫</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold"><% out.print(formatMoney(totalPay(sum, percentCoupon))); %> ₫</h5> 
                                        </li>
                                    </ul><a href="order" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>
                                </div>
                            </div>
                        </div>
						<%
							} else {
						%>
							<div class="check-out">
								<img src="./images/logo-cart-shop.png" alt="" />
    	    					<p class="cart-out">Không có sản phẩm nào.<br>Ấn vào <a href="index.jsp">đây</a> để tiếp tục mua hàng</p>
    						</div>
						<%
							}
						%>
                    </div>
                </div>
            </div>
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