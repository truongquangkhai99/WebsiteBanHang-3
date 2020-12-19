<%@page import="dao.SanPhamDAO"%>
<%@page import="model.Book"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%Map<String, Book> mapListProduct = SanPhamDAO.mapSanPham ;%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js"></script>
<script>
yepnope({
  test : (!Modernizr.input.list || (parseInt($.browser.version) > 400)),
  yep : [
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/jquery.relevant-dropdown.js',
      'https://raw2.github.com/CSS-Tricks/Relevant-Dropdowns/master/js/load-fallbacks.js'
  ]
});
</script>
</head>
<body>
<form action="" method="post">
	<input type="text" list="listProduct" name="ho" />
	<button class="btn btn-primary" type="submit">Chọn</button>
</form>
	<datalist id="listProduct">
		<%	for (Book kh : mapListProduct.values()) { %>
			<option value="<%=kh.getId()%>"><%=kh.getTitle()%></option>
		<%} %>
	</datalist>
</body>
</html>