<%-- 
    Document   : Login
    Created on : Jul 4, 2022, 9:05:36 AM
    Author     : baqua
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Đăng nhập</title>
        <link rel="icon" href="images/icon.png"/>

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
                            <img src="images/anhbia.jpg" alt="login" class="login-card-img img-fluid rounded rounded-4">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <div class="brand-wrapper">
                                    <img src="images/logo.png" alt="logo" class="logo img-fluid" style="width: 90px">
                                </div>
                                <p class="login-card-description display-4">Đăng nhập </p>


                                <form action="login" method = "post">
                                    <div class="text-danger" style="margin-bottom: 20px">${result}</div>

                                    <div class="form-outline mb-3">
                                        <input type="text" name="account" class="form-control">
                                        <label class="form-label">Username</label>
                                    </div>

                                    <div class="form-outline mb-3">
                                        <input type="password" name="password"  class="form-control">
                                        <label class="form-label">Password</label>
                                    </div>

                                    <button class="btn btn-block login-btn mb-4" type="submit">Đăng nhập</button>
                                </form>
                                <div class="float-end">
                                    <a href="forgot-password" class="forgot-password-link">Quên mật khẩu?</a>
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
        </main>     


        <%@include file="footer.jsp" %>     
    </body>
</html>
