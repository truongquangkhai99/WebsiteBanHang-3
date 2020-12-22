<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	User kh = (User)session.getAttribute("userlogin");
%>
</head>
<body>
		<div class="header" id="home">	
			<div class="header-para">
				<p><i style="font-size: 13px;">Đọc được nhiều sách tốt nhưng nếu không đem áp dụng vào thực tiễn cuộc sống thì chẳng khác nào “cái hòm đựng sách”.</i></span></p>	
			</div>	
			<ul class="header-in">
				<li>
					<p>Xin chào,
						<%if(kh!=null){
							out.print(kh.getName());
						}%>
					</p>
				</li>
				<li><a href="contact.jsp">Liên lạc</a></li>
				<li><a href="login.jsp">Đăng nhập</a> </li>
				<li><a href="login?action=Logout">Đăng xuất</a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<!---->
		<div class="header-top">
			<div class="logo">
				<a href="index.jsp"><img src="images/logo.png" alt="" ></a>
			</div>
			<div class="header-top-on">
				<ul class="social-in">
					<li><a href="#"><i> </i></a></li>						
					<li><a href="#"><i class="ic"> </i></a></li>
					<li><a href="#"><i class="ic1"> </i></a></li>
					<li><a href="#"><i class="ic2"> </i></a></li>
					<li><a href="#"><i class="ic3"> </i></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
</body>
</html>