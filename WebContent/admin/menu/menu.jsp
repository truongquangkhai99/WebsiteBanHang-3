<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-check"></span>Admin</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-user"></span>  Giới thiệu</a></li>
      <li><a href="showcustomer.jsp"><i class="fa fa-users" aria-hidden="true"></i>  Khách hàng</a></li>
      <li><a href="showproduct.jsp" > <i class="fa fa-car" aria-hidden="true"></i>  Sản phẩm</a></li>
      <li><a href="showorder.jsp" > <i class="fa fa-list-alt" aria-hidden="true"></i>  Đơn hàng</a></li>
    </ul>
    <a href="orderonline.jsp"><button class="btn btn-danger navbar-btn"><i class="fa fa-cart-plus" aria-hidden="true"></i>  Đặt hàng online</button></a>
    <a href="note.jsp"><button class="btn btn-success navbar-btn"><span class="glyphicon glyphicon-info-sign"></span>  Mô tả chức năng</button></a>
  </div>
</nav>
<div style="margin-bottom:40px"></div>
</body>
</html>
