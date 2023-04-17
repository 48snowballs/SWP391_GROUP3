<%-- 
    Document   : update-password-success
    Created on : Jul 18, 2022, 5:30:50 AM
    Author     : vuman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>8Shoes</title>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet" />

        <!-- Owl Carousel -->
        <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css"/>
        <link rel="stylesheet" href="lib/owlcarousel/assets/owl.theme.default.min.css"/>

        <link rel="stylesheet" href="css/style.css" />
    </head>

    <body>
        <%@include file="header.jsp" %>

        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <div class="container">
                <div class="card login-card">
                    <div class="row no-gutters">
                        <div class="col-md-5">
                            <img src="images/anh1.jpg" alt="login" class="login-card-img img-fluid rounded rounded-4">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <div class="brand-wrapper">
                                    <img src="images/logo.png" alt="logo" class="logo img-fluid" style="width: 150px">
                                </div>
                                <p class="login-card-description display-4">Đăng nhập </p>


                                <div class="text-success display-6 mb-3" style="font-weight: 20px">Bạn đã thay đổi mật khẩu thành công!!</div>

                                <a href="." class="btn btn-outline-primary d-block mb-3">Trang chính</a>

                                <div class="d-flex flex-row-reverse">
                                    <div>
                                        <a href="#!" class="forgot-password-link">Quên mật khẩu?</a>
                                        <nav class="login-card-footer-nav">
                                            <a href="#!">Điều khoản sử dụng</a>
                                            <br>
                                            <a href="#!">Chính sách bảo mật</a>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>     


        <%@include file="footer.jsp" %>     
    </body>
</html>
