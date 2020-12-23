<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Order_detail"%>
<%@page import="model.Order"%>
<%@page import="model.Book"%>
<%@page import="dao.BookDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
<%
	User user = (User)request.getAttribute("user");
	Order od = (Order)request.getAttribute("order");
	List<Order_detail> listDetail = (List<Order_detail>)request.getAttribute("detail");
    float tongTien = 0;
    int soLuongTong = 0;
    float discountValue = 0;
    int order_status = 0;
    switch (od.getStatus())
    {
        case "Đặt hàng":
            // Use the text block below to separate html elements from code
            order_status = 0;
            break;  // Always break each case
        case "Đóng gói":
            order_status = 1;
            break;
        case "Vận chuyển":
            order_status = 2;
            break;
        case "Nhận hàng":
            order_status = 3;
            break;
        case "Hủy":
            order_status = 4;
            break;
        default:
            order_status = 0;
            break;
    }
%>
<p id="customer_name">Khách hàng: <% out.print(user.getName()); %></p>
<p id="customer_address">Địa chỉ giao hàng: <% out.print(user.getAddress()); %></p>
<p id="customer_phone">Số điện thoại liên hệ: <% out.print(user.getPhone()); %></p>
<p>Ngày yêu cầu hàng: <b><% out.print(od.getRequired_date()); %></b></p>
<p>Ghi chú: <b><%out.print(od.getComment()); %></b></p>
<label>Trạng thái</label>
<select class="form-control" style="width:250px" id="order_status">
    <option value="0">Đặt hàng</option>
    <option value="1">Đóng gói</option>
    <option value="2">Vận chuyển</option>
    <option value="3">Nhận hàng</option>
    <option value="4">Hủy</option>
</select>
<br />
<span>Chi tiết</span>
<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Mã sách:</th>
            <th>Tên sách:</th>
            <th>Ảnh bìa:</th>
            <th>Số lượng:</th>
            <th>Thành tiền:</th>
        </tr>
    </thead>
    <tbody>
    <%
    	for(Order_detail dt: listDetail){
    		%>
    		<tr>
                <td style="width:80px"><%dt.getBook_id(); %></td>
                    <%Book book = BookDAO.mapSanPham.get(dt.getBook_id());%>
                    <td style="width:250px"><a href="#"><%out.print(book.getTitle()); %></a></td>
                    <td style="width:150px"><img src="../<%out.print(book.getPicture());%>" class="img-responsive" style="width: 150px; height: auto"></td>
                <td style="width:40px"><%out.print(dt.getQuantity()); %></td>
                <td style="width:140px">
                <% 
	                DecimalFormat formatter = new DecimalFormat("###,###,###");
					out.print(formatter.format(dt.getQuantity()*dt.getPrice()));%> VNĐ</td>
                <%
                	soLuongTong+=dt.getQuantity();
                    tongTien+=dt.getQuantity()*dt.getPrice();
                %>
            </tr>
    	<%}    %>
        
        <tr>
            <td></td>
            <td></td>
            <td><b>Tổng (tạm tính):</b></td>
            <td><b><%out.print(soLuongTong);%></b></td>
            <td><b><%DecimalFormat formatter = new DecimalFormat("###,###,###");
            			out.print(formatter.format(tongTien));%> VNĐ</b></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td><b>Khuyến mãi:</b></td>
            <td style="color:red"><b></b></td>
            <td><b>-0 VNĐ</b></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td><b>Tổng:</b></td>
            <td></td>
            <td><b><%out.print(formatter.format(od.getTotal()));%> VNĐ</b></td>
        </tr>
    </tbody>
</table>
<script>
    $(document).ready(function(){
        console.log("@order_status")
        Array.from(document.getElementById("order_status").options).forEach((element)=>{if(element.value == "<%out.print(order_status);%>") element.selected = true})
    });
</script>
</body>

<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->


<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>



</html>