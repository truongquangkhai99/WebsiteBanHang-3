<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login for Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        /*các thông báo lỗi sẽ được chứa trong các label với class là error*/
        label.error {
            color: red;
        }
        .input-group-lg label{
            float:left;
            padding-left:10px;
            padding-bottom:7px;
        }
        .input-group.input-group-lg {
            width: 100%;
        }
    </style>
</head>
<body style="background-color:#64ed8e;">
    <div class="ch-container">
            <div class="row" style="text-align:center;width:35%;margin:auto; margin-top:30px">
                <img src="Assets/Admin/images/icon/LOGO.png" style="width:55%; " />
                <h2>TriThucOnline Admin</h2>
                <div class="well col-md-5 center login-box"  style="width:100%; margin-top:10px">
                        <c:if test="${errorString!=null}">
                            <div class="alert alert-info">
                                ${errorString}
                            </div>
                        </c:if>
<% String url =""; if (request.getParameter("returnURL") != null) { url = "?returnURL="+request.getParameter("returnURL"); } %>
                    <form class="form-horizontal" id='input_form' action="login<%=url%>" method="post">
                        <fieldset>
                        <input type="hidden" name="from" value="${pageContext.request.requestURI}" />
                            <div class="input-group input-group-lg">
                                <label><i class="glyphicon glyphicon-user red"></i></label>
                                <label>Tên Đăng Nhập</label>
                                <input type="text" class="form-control required" name="username" id="username" placeholder="Tên tài khoản..." autofocus>
                            </div>
                            <div class="clearfix"></div><br>
                            <div class="input-group input-group-lg">
                                <label><i class="glyphicon glyphicon-lock red"></i></label>
                                <label>Mật Khẩu</label>
                                <input type="password" class="form-control required" name="password" id="password" placeholder="Mật khẩu...">
                            </div>
                            <div class="clearfix"></div>
                            <p class="center col-md-5" style="margin-top:25px; width:100%">
                                <button type="submit" class="btn btn-primary">Đăng nhập</button>
                            </p>
                        </fieldset>
                    </form>
                </div>
                <!--/span-->
            </div><!--/row-->
    </div><!--/.fluid-container-->
    <script>
        $(document).ready(function () {
            var validator = $("#input_form").validate({
                rules: {
                    username: "required",
                    password: {
                        required: true
                    }
                },
                messages: {
                    username: "Hãy điền tên đăng nhập.",
                    password: {
                        required: "Hãy điền mật khẩu"
                    }
                }
            });
        });
    </script>

</body>
</html>