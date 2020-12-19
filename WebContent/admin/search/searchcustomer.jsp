<%@page import="dao.KhachHangDAO"%>
<%@page import="model.User"%>
<%@page import=" java.util.HashMap"%>
<%@page import=" java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%Map<String, User> mapListCustomer = KhachHangDAO.mapKhachHang; %>
      <%User thanhvien =(User)session.getAttribute("KhachHang");
      String disable="";
      		if(thanhvien!=null){
      			ServletContext contextDisable = getServletContext();
      			disable=(String) contextDisable.getAttribute("disabledButton");
      			if(disable==null){
      				disable="";
      			}
      	}
      %>
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
<form action="Search?chucNang=searchCustomer" method="post">
	<input type="text" list="listcustomer"  <%=disable %> name="name" />
	<button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-ok"></span>  Chọn</button>
</form>
	<datalist id="listcustomer">
<%	for (User kh : mapListCustomer.values()) { %>
		<option value="<%=kh.getId()%>"><%=kh.getName() %></option>
	<%} %>
	</datalist>
</body>
</html>