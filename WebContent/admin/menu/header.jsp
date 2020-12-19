<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <!-- Title Page-->
    <title>TriThucOnline Admin Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet" />
    <link href="Assets/Admin/css/font-face.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" media="all">

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Vendor CSS-->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/css/animsition.min.css" integrity="sha512-SagM1PHxt5mWDyWARVY6UOdhM5A8J+R1UqIWcGfiwOd+be7uHQagB+JQOmfVZF8jjJQqbyuWzw/KXfb4yqjBkQ==" crossorigin="anonymous" />
    <link href="Assets/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="Assets/Admin/css/theme.css" rel="stylesheet" media="all">
    <link href="Assets/Admin/css/Style_Layout_Admin.css" rel="stylesheet" />
</head>
<body>
    <div class="container-fluid">


        <!-- HEADER DESKTOP-->

        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <form class="form-header" action="" method="POST">
                            <input class="au-input au-input--xl" type="text" name="search" placeholder="..." />
                            <button class="au-btn--submit" type="submit">
                                <i class="zmdi zmdi-search"></i>
                            </button>
                        </form>
                        <div class="header-button">
                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="Assets/Admin/images/icon/avatar-01.jpg" alt="" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">@User.Identity.Name</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="Assets/Admin/images/icon/avatar-01.jpg" alt="Avatar" />
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">@User.Identity.Name</a>
                                                </h5>
                                                <span class="email">@User.Identity.Name@@trithuconline.com</span>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-account"></i>Tài khoản
                                                </a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-settings"></i>Cài đặt
                                                </a>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__footer">
                                            <a href="/login?action=logout">
                                                <i class="zmdi zmdi-power"></i>Đăng xuất
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- HEADER DESKTOP-->
        <div class="row">

            <div class="col-sm-3">


                <!-- MENU SIDEBAR-->
                <aside class="menu-sidebar d-none d-lg-block">
                    <div class="logo">
                        <a href="index.jsp">
                            <img src="Assets/Admin/images/icon/LOGO.png" alt="Admin" />
                        </a>
                    </div>
                    <div class="menu-sidebar__content js-scrollbar1">
                        <nav class="navbar-sidebar">
                            <ul class="list-unstyled navbar__list">
                                <li>
                                    <a href="index.jsp">
                                        <i class="fas fa-tachometer-alt"></i>Dashboard
                                    </a>
                                </li>
                                <li>
                                    <a class="js-arrow" href="#">
                                        <i class="fas fa-pencil-square"></i>Cập Nhật
                                    </a>
                                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                                        <li>
                                            <a href="#"><i class="fas fa-book"></i>Đầu Sách</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fas fa-users"></i>Tác giả </a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fas fa-filter"></i>Thể Loại</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fas fa-industry"></i>Nhà Xuất Bản</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fas fa-chart-bar"></i>Thống kê doanh thu
                                    </a>
                                </li>

                                <li>
                                    <a href="showorder.jsp">
                                        <i class="fas fa-cart-plus"></i>Đơn Hàng
                                    </a>
                                </li>
                                <li>
                                    <a href="showcustomer.jsp">
                                        <i class="fas fa-user"></i>Khách Hàng
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <i class="fas fa-percent"></i>Khuyễn mại
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </aside>
                <!-- END MENU SIDEBAR-->
            </div>
        </div>
    </div>








    <!-- Jquery JS-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="Assets/Admin/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="Assets/Admin/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="Assets/Admin/vendor/slick/slick.min.js">
    </script>
    <script src="Assets/Admin/vendor/wow/wow.min.js"></script>
    <script src="Assets/Admin/vendor/animsition/animsition.min.js"></script>
    <script src="Assets/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="Assets/Admin/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="Assets/Admin/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="Assets/Admin/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="Assets/Admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="Assets/Admin/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="Assets/Admin/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="Assets/Admin/js/main.js"></script>
    <script>
        $(document).ready(function () {
            $('.MenuTrang').find('li').addClass('page-item');
            $('.MenuTrang').find('li').find('a').addClass('page-link');
        })
    </script>
</body>
</html>