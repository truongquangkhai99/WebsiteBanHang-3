<%@page import="dao.ProducerDAO"%>
<%@page import="model.Producer"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Map<String, Producer> mapListProducer = ProducerDAO.mapProducer;
	Map<String, Product> mapListProduct = ProductDAO.mapProduct;
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>
<script>
	yepnope({
		test : (!Modernizr.input.list || (parseInt($.browser.version) > 400)),
		yep : [
				'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/jquery.relevant-dropdown.js',
				'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/load-fallbacks.js' ]
	});
</script>
</head>
<body>
	<form action="Search?chucNang=Add" method="post" class="form-inline">
	<div class="row">
		<div class="form-group ">
			<label><strong><i class="fa fa-plus-square" aria-hidden="true"></i>  Nhập tên nhà cung cấp:</strong></label> <br>
			<input	type="text" list="listProducer" name="producerID" id="producer" />
		</div>
		<div class="form-group ">
			<label><strong><i class="fa fa-car" aria-hidden="true"></i>  Nhập tên sản phẩm:</strong></label> <br>
			<input type="text" 	list="listProduct" name="productID" id="product" />
		</div>
		<div class="form-group ">
			<br>
			<button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-ok"></span> Đặt hàng</button>
		</div>
		</div>
	</form>
	<datalist id="listProducer">
		<%
			for (Producer kh : mapListProducer.values()) {
		%>
		<option value="<%=kh.getProducerID()%>"><%=kh.getName()%></option>
		<%
			}
		%>
	</datalist>
	<datalist id="listProduct">
		<%
			for (Product kh : mapListProduct.values()) {
		%>
		<option value="<%=kh.getProductID()%>"><%=kh.getProductName()%></option>
		<%
			}
		%>
	</datalist>
</body>
<!-- Script xử lý combobox chọn nhà sản xuất và sản phẩm -->
<script>
	$(document).ready(
			function() {
				$('#producer').change(
						function(event) {
							var sports = $('option[value="' + $(this).val() + '"]').val();
							if (sports == null)
								return;
							$.get('Datalist', {
								producerID : sports
							}, function(response) {
								var select = $('#listProduct');
								$(select).find('option').remove();
								$.each(response, function(index, value) {
									$('<option>').val(value.split('-')[0])
											.text(value.split('-')[1])
											.appendTo(select);
								});
							});
						});
			});
</script>
</html>