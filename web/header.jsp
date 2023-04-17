<%-- 
    Document   : header
    Created on : Jun 27, 2022, 12:07:52 AM
    Author     : vuman
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="eightshoes-header">
    <nav class="eightshoes-header__top-nav-bar">
        <ul class="container d-flex flex-row-reverse p-2 nav">
            <c:if test="${sessionScope.name == null}">
                <li class="small nav-item">
                    <a href="login" class="text-body">
                        <i class="fas fa-user"></i>
                        <span class="ms-1">Đăng Nhập</span>
                    </a>
                </li>

                <li class="small nav-item">
                    <a href="register" class="text-body">
                        <i class="fas fa-lock"></i>
                        <span class="ms-1">Đăng Ký</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${sessionScope.name != null && sessionScope.role == 2}">
                <li class="small nav-item">
                    <a href="logout" class="text-body">
                        <i class="fas fa-lock"></i>
                        <span class="ms-1">Đăng xuất</span>
                    </a>
                </li>

                <li class="small nav-item">
                    <a href="user-profile" class="text-body">
                        <i class="fas fa-user"></i>
                        <span class="ms-1">${sessionScope.name}</span>
                    </a>
                </li>

                <li class="small nav-item">
                    <a href="cart" class="text-body">
                        <i class="fas fa-cart-shopping"></i>
                        <span class="ms-1">Giỏ hàng</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${sessionScope.name != null && sessionScope.role == 1}">
                <li class="small nav-item">
                    <a href="logout" class="text-body">
                        <i class="fas fa-lock"></i>
                        <span class="ms-1">Đăng xuất</span>
                    </a>
                </li>

                <li class="small nav-item">
                    <a href="user-profile" class="text-body">
                        <i class="fas fa-user"></i>
                        <span class="ms-1">${sessionScope.name}</span>
                    </a>
                </li>

                <li class="small nav-item">
                    <a href="cart" class="text-body">
                        <i class="fas fa-cart-shopping"></i>
                        <span class="ms-1">Giỏ hàng</span>
                    </a>
                </li>
                
                <li class="small nav-item">
                    <a href="admin-dashboard" class="text-body">
                        <i class="fa-solid fa-user-secret"></i>
                        <span class="ms-1">Admin</span>
                    </a>
                </li>
            </c:if>

            <li class="small nav-item">
                Hotline: <b class="ms-1">0123456789</b>
            </li>

            <form action="search" method="get" class="me-5">
                <div class="form-outline">
                    <input name="name" type="text" class="form-control">
                    <label class="form-label">Search</label>
                </div>
            </form>
        </ul>
    </nav>

    <nav class="eightshoes-header__center-nav-bar">
        <div class="d-flex justify-content-center p-3">
            <a href="home">
                <img src="images/logo.png" class="img-fluid" alt="" width="160"/>
            </a>
        </div>

        <hr class="m-0" />

        <div class="d-flex justify-content-center">
            <div
                style="cursor: pointer"
                class="p-1"
                id="owl-carousel__left"
                >
                <i class="fa fa-angle-left"></i>
            </div>

            <div class="owl-carousel w-50 p-1">
                <div class="text-center">Email hỗ trợ : linhtinh@gmail.com</div>
                <div class="text-center">Miễn phí vận chuyển toàn quốc</div>
                <div class="text-center">Đăng ký hoặc gọi 0123456789 để cập nhật chương trình khuyến mãi</div>
            </div>

            <div
                style="cursor: pointer"
                class="p-1"
                id="owl-carousel__right"
                >
                <i class="fa fa-angle-right"></i>
            </div>
        </div>
    </nav>

    <nav class="eightshoes-header__bottom-nav-bar">
        <div class="container p-2">
            <div class="row">
                <div class="col-2">
                    <a href="brand?brand=Iphone" class="text-white text-uppercase">
                        <strong class="ms-1">IPHONE</strong>
                    </a>
                </div>

                <div class="col-2">
                    <a href="brand?brand=Xiaomi" class="text-white text-uppercase">
                        <strong class="ms-1">XIAOMI</strong>
                    </a>
                </div>

                <div class="col-2">
                    <a href="brand?brand=Samsung" class="text-white text-uppercase">
                        <strong class="ms-1">SAMSUNG</strong>
                    </a>
                </div>

                <div class="col-2">
                    <a href="brand?brand=Oppo" class="text-white text-uppercase">
                        <strong class="ms-1">OPPO</strong>
                    </a>
                </div>

                <div class="col-2">
                    <a href="brand?brand=Nokia" class="text-white text-uppercase">
                        <strong class="ms-1">NOKIA</strong>
                    </a>
                </div>

                <div class="col-2">
                    <a href="brand?brand=Sony" class="text-white text-uppercase">
                        <strong class="ms-1">Sony</strong>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>