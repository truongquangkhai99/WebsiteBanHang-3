<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Mô tả chức năng</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="img/icon2.jpg" />
<!-- Bootstrap -->
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
	<style>
        .database{
                border: solid;
                background-color: cyan;
                
        }
        li{
/*        font-size: 15px;*/
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/menu/menu.jsp"></jsp:include>
	</header>
	<div class="container">
		<div class="row">
			<h2><strong>Tóm tắt những tính năng đã làm trong project giữa kỳ:</strong></h2>
			<ul>
				<li>Tất cả dữ liệu load lên đều được sử dụng cấu trúc dữ liệu <strong>map<'key',value></strong> để lưu giữ liệu.</li>
				<li>Sử dụng bảng datatable của bootstrap gồm nhiều tính năng:lọc,tìm kiếm,sắp xếp,in ấn,...</li>
				<li>Tích hợp jquery và javascript để bắt lỗi form nhập liệu ở các trang chứa chức năng thêm và sửa.</li>
				<li>Sử dụng ajax và jsp-sevrlet để xử lý các thẻ select option trong datalist(được ứng dụng trong chức năng <strong>đặt hàng online</strong>).</li>
				<li>Tích hợp chức năng <strong>import file dữ liệu từ excel</strong>.Tuy nhiên vẫn còn hạn chế là sau khi import xong chưa tự tải lại trang,nếu bảng excel có dữ liệu không phù hợp với bảng đối tượng thì sẽ không import được.</li>
				<li>Hoàn thiện được <strong>chức năng undo</strong>.Tính năng được xuất hiện khi người dùng thực hiện chức năng xóa.Khi đó, nút undo sẽ xuất hiện,cho phép người dùng khôi phục lại dữ liệu đã xóa trước đó.</li>
			</ul>

		</div>
		<div class="row">
		    <h2><strong>Thiết kế database</strong></h2>
		    <div class="database container" style="padding-left: 30px;">
		        <div class="row ">
		            <h4><strong>KhachHang</strong>(<strong style="text-decoration: underline;">CustomerID</strong>,TenKhachHang,TaiKhoan,SoDienThoai,MatKhau)</h4>
		        </div>
		        <div class="row">
		            <h4><strong>Product</strong>(<strong style="text-decoration: underline;">ProductID</strong>,ProductName,Price,<strong>ProducerID</strong>,Image)</h4>
		        </div>
		        <div class="row">
		            <h4><strong>Order</strong>(<strong style="text-decoration: underline;">OrderID</strong>,<strong>CustomerID</strong>,<strong>ProductID</strong>,Date,TotalPrice)</h4>
		        </div>
		        <div class="row">
		            <h4><strong>Producer</strong>(<strong style="text-decoration: underline;">ProducerID</strong>,ProducerName,Address)</h4>
		        </div>
		    </div>
		</div>
		<div class="row">
			<h2>Bên dưới là tóm tắt một số chức năng đã làm trong project</h2>
			<table class="table">
				<thead>
					<th class="col-sm-2">Tên chức năng</th>
					<th class="col-sm-10">Mô tả</th>
				</thead>
				<tbody>
					<tr>
						<td>Quản lý sản phẩm</td>
						<td>
							<p>-Gồm chức năng thêm,sửa,xóa.</p>
							<p>-Chức năng dropdown cho người dùng chọn hãng sản xuất thì lọc ra đúng các sản phẩm thuộc nhà sản xuất đó.</p>
							<p>-Có thêm chức năng xóa tất cả.Khi chọn xóa tất cả thì sẽ có nút undo cho người dùng lựa chọn.Khi nhấn undo thì sẽ quay lại bước trước đó.</p>
						</td>
					</tr>
					<tr>
						<td>Quản lý đơn hàng</td>
						<td>
							<p>-Gồm chức năng thêm,sửa,xóa.</p>
							<p>-Chức năng dropdown cho phép người dùng lọc theo ngày đặt hàng,hiển thị các đơn hàng có ngày đặt hàng tương ứng như đã chọn.</p>
							<p>-Có thêm chức năng xóa tất cả.Khi chọn xóa tất cả thì sẽ có nút undo cho người dùng lựa chọn.Khi nhấn undo thì sẽ quay lại bước trước đó.</p>
						</td>
					</tr>
					<tr>
						<td>Quản lý khách hàng</td>
						<td>
							<p>-Gồm chức năng thêm,sửa,xóa.</p>
							<p>-Có thêm chức năng xóa tất cả.Khi chọn xóa tất cả thì sẽ có nút undo cho người dùng lựa chọn.Khi nhấn undo thì sẽ quay lại bước trước đó.</p>
						</td>
					</tr>
					<tr>
						<td><strong>Đặt hàng online</strong></td>
						<td>
							<p>-Khi người dùng lựa chọn được khách hàng,hệ thống sẽ in thông tin người dùng ra cột bên trái màn hình.Đồng thời sẽ hiển thị nút <strong>Đổi khách hàng</strong>,ô nhập tên khách hàng bị disable nhầm không cho người dùng thay đổi trong lúc xử lý.</p>
							<p>-Khi người dùng chọn được khách hàng,hệ thống sẽ mở thêm một bảng chọn ở kế bên.Tại đây khi người dùng chọn tên nhà sản xuất thì hệ thống sẽ <strong>lọc ra những sản phẩm thuộc nhà sản xuất vừa chọn,và hiển thị chúng trong datalist kế tiếp.</strong> </p>
							<p>-Khi người dùng chọn được sản phẩm đặt hàng,hệ thống sẽ thêm sản phẩm đó vào bảng đơn đặt hàng bên dưới.Tại đây có các chức năng xóa ,xem thông tin sản phẩm vừa chọn</p>
							<p>-Sau khi đã hoàn thành đặt hàng xong,ấn nút xuất đơn hàng thì hệ thống sẽ chuyển đơn hàng này sang chức năng quản lý đơn hàng ở trên.</p>
							
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>