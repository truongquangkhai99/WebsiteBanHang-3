<%@page import="java.time.LocalDateTime"%>
<%@page import="model.Review"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@page import=" java.time.format.*"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	Map<String, Review> mapListReviews = ReviewDAO.mapReview;
	
	String x = request.getParameter("id");

	Map<String, Review> mapListReview = ReviewDAO.layDuLieuDanhGiaCuaSach(x);
%>
<%!
	Map<String, User> mapListUsers = UserDAO.mapKhachHang;

	public String getNameUser(String id) {
		String uN = UserDAO.getNameCustomer(id);
		
		return uN;
	}
%>
<%!
	public String formatDate(LocalDateTime date) {
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String formattedDate = date.format(myFormatObj);
	    
		return formattedDate;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="css/rating.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<%
		if(!mapListReview.isEmpty())
			for (Review rv : mapListReview.values()) {
	%>
	<div class="info-user-review">
		<div style="display: flex">
			<img src="./images/sh2.png" alt="" />

			<div class="info">
				<p><%=getNameUser(rv.getUser_id())%></p>
				<span>
					Nhận xét vào <%=formatDate(rv.getPost_date())%>
				</span>
			</div>
		</div>

		<p class="review-of-user"><%=rv.getComment()%></p>
			
		<div style="border-bottom: 1px solid gray; margin-bottom: 10px;"></div>
	</div>
	<%
		}
	%>
</body>
</html>