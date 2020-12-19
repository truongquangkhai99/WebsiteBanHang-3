<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%String chucNang = request.getParameter("chucNang");
    		
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<!-- validation form -->
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>
	<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="js/jquery.validationEngine-vi.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<script>
		$(document).ready(function(){
			// binds form submission and fields to the validation engine
			$("#addcustomerID").validationEngine();
		});
		function checkHELLO(field, rules, i, options){
			if (field.val() != "HELLO") {
				// this allows to use i18 for the error msgs
				return options.allrules.validate2fields.alertText;
			}
		}
	</script>
</head>
<body>
		<header>
			<jsp:include page="/menu/menu.jsp"></jsp:include>
		</header>
		<div class="container">
		<%if(chucNang.equals("Add")){ %>
				<div class="row">
						<jsp:include page="/customer/addcustomer.jsp"></jsp:include>
				</div>
				<%} else if(chucNang.equals("Edit")){ %>
				<div class="row">
						<jsp:include page="/customer/editcustomer.jsp"></jsp:include>
				</div>
				<%} else if(chucNang.equals("Info")){ %>
				<div class="row">
						<jsp:include page="/customer/infocustomer.jsp"></jsp:include>
				</div>
				<%} %>
		</div>
</body>
<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Custom Theme Scripts -->
<script src="build/js/custom.min.js"></script>

<!-- Script modal -->

</html>