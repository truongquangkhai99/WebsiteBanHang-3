<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<meta name="keywords"
	content="Mihstore Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<link href="css/userInfo.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<div class="info-user">
		<div class="container">
			<div class="left-box">
				<nav>
					<a onclick="tabs(0)" class="tab active"> <i class="fa fa-user"></i> </a> 
					<a onclick="tabs(1)" class="tab"> <i class="fa fa-user"></i> </a> 
					<a onclick="tabs(2)" class="tab"> <i class="fa fa-credit-card"></i> </a> 
					<a onclick="tabs(3)" class="tab"> <i class="fa fa-tasks"></i> </a> 
					<a onclick="tabs(4)" class="tab"> <i class="fa fa-cog"></i> </a>
				</nav>
			</div>

			<div class="right-box">
				<div class="tab-show profile">
					<h1>Personal Info</h1>
					<h2>Full name</h2>
					<input type="text" class="input" value="hiu" />
					<h2>Birth day</h2>
					<input type="text" class="input" value="14/12/1999" />
					<h2>Gender</h2>
					<input type="text" class="input" value="Female" />
					<h2>Email</h2>
					<input type="text" class="input" value="a@gmail.com" />
					<h2>Password</h2>
					<input type="password" class="input" value="om" />

					<button class="btn">Update</button>
				</div>

				<div class="tab-show payment">
					<h1>payment Info</h1>
					<h2>payment method</h2>
					<input type="text" class="input" value="mastercard - 09*****" />
					<h2>Billing address</h2>
					<input type="text" class="input" value="1234 some streer in a town" />
					<h2>Zipcode</h2>
					<input type="text" class="input" value="333" />
					<h2>Billing Date</h2>
					<input type="text" class="input" value="a@gmail.com" />
					<h2>Redeen Card</h2>
					<input type="password" class="input" value="enter the gift code" />

					<button class="btn">Update</button>
				</div>

				<div class="tab-show subscription">
					<h1>payment Info</h1>
					<h2>payment method</h2>
					<p>May 12, 2020</p>
					<h2>Next charges</h2>
					<p>
						32VND <span>includes tax</span>
					</p>
					<h2>Limit plan</h2>
					<p>Monthly</p>
					<p>152vnd</p>

					<button class="btn">Update</button>
				</div>

				<div class="tab-show privacy">
					<h1>privacy setting</h1>
					<h2>manage email noti</h2>
					<p></p>
					<p>May 12, 2020</p>
					<h2>Next charges</h2>
					<p>
						32VND <span>includes tax</span>
					</p>
					<h2>Limit plan</h2>
					<p>Monthly</p>
					<p>152vnd</p>

					<button class="btn">Update</button>
				</div>

				<div class="tab-show settings">
					<h1>privacy setting</h1>
					<h2>manage email noti</h2>
					<p></p>
					<p>May 12, 2020</p>
					<h2>Next charges</h2>
					<p>
						32VND <span>includes tax</span>
					</p>
					<h2>Limit plan</h2>
					<p>Monthly</p>
					<p>152vnd</p>

					<button class="btn">Update</button>
				</div>
			</div>
		</div>


		<script src="js/jquery.min.js"></script>
		<script>
			const tabBtn = document.querySelectorAll(".tab");
			const tab = document.querySelectorAll(".tab-show");
			function tabs(panelIndex) {
				console.log('as');
				tab.forEach(function (node) {
					node.style.display = "none";
				});
				tab[panelIndex].style.display = "block";
			}
			tabs(0);
		</script>
		<script>
			$(".tab").click(function() {
				$(this).addClass("active").siblings().removeClass("active");
			})
		</script>
	</div>
</body>
</html>