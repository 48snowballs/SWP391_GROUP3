<%-- 
    Document   : home
    Created on : Jun 10, 2022, 4:01:47 PM
    Author     : vuman
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Context.UserDAO" %>
<%@page import="Model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${product.getName()}</title>
        <link rel="icon" href="images/icon.png"/>
        <title>Thông tin người dùng</title>

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
        <link rel="stylesheet" href="css/product.css" />

        <style>
            .nav-link[data-mdb-toggle="pill"] {
                margin-left: -20px;
            }
        </style>
    </head>

    <body>

        <%@include file="header.jsp" %>


        <section class="py-5 my-5">

            <div class="container">
                <nav aria-label="breadcrumb" class="mt-3">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=".">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="">User Profile</a>
                        </li>
                    </ol>
                </nav>
                <form action='user-profile' method="post">
                    <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                        <div class="profile-tab-nav border-right">
                            <div class="p-4">
                                <div class="img-circle text-center mb-3">
                                    <img src="images/User.jpg" alt="Image" class="shadow">
                                </div>
                                <h4 class="text-center">${u.name}</h4>
                            </div>

                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="account-tab" data-mdb-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
                                    <i class="fa fa-home text-center mr-1"></i> 
                                    Tài Khoản
                                </a>
                                <a class="nav-link" id="password-tab" data-mdb-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
                                    <i class="fa fa-key text-center mr-1"></i> 
                                    Mật Khẩu
                                </a>

                                <a class="nav-link" id="application-tab" data-mdb-toggle="pill" href="#history" role="tab" aria-controls="history" aria-selected="false">
                                    <i class="fa fa-tv text-center mr-1"></i> 
                                    Lịch sử mua hàng
                                    
                                </a>
                                <a class="nav-link" id="notification-tab" data-mdb-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
                                    <i class="fa fa-bell text-center mr-1"></i> 
                                    Thông báo
                                </a>
                            </div>
                        </div>
                        <div class="tab-content p-4 p-md-5 w-100" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                                <h3 class="mb-4">Cài đặt tài khoản</h3>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-outline mb-3">
                                            <input type="text" class="form-control" name="username" id="username" value="${sessionScope.username}" readonly>
                                            <label for="username" class="form-label">Tài Khoản</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-outline mb-3">
                                            <input type="text" class="form-control" name="name" id="name" value="${u.name}">
                                            <label for="name"  class="form-label">Họ và tên</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-outline mb-3">
                                            <input type="email" class="form-control" name="email" id="email" value="${u.email}">
                                            <label for="email"  class="form-label">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-outline mb-3">
                                            <input type="text" class="form-control" name="phone" id="phone" value="${u.phone}">
                                            <label for="phone"  class="form-label">Số điện thoại</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-outline mb-3">
                                            <input type="text" class="form-control" name="address" id="address" value="${u.address}">
                                            <label for="address"  class="form-label">Địa chỉ</label>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <button class="btn btn-primary" type="submit" name="action" value="edit">Chỉnh sửa</button>
                                </div>


                            </div>


                            <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                                <h3 class="mb-4">Cài đặt mật khẩu</h3>

                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <div class="form-outline">
                                            <input type="password" name="oldpass" id="oldpass" class="form-control">
                                            <label for="oldpass" class="form-label">Mật khẩu mới</label>
                                        </div>
                                    </div>

                                    <div class="col-12 mb-3">
                                        <div class="form-outline">
                                            <input type="password" name="pass" id="pass" class="form-control">
                                            <label for="pass" class="form-label">Xác nhận mật khẩu mới</label>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <button class="btn btn-primary" type="submit" name="action" value="change-password">Cập nhật</button>
                                    <button class="btn btn-light" type="reset">Hủy</button>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
                                <h3 class="mb-4">Lịch sử mua hàng</h3>
                                <button type="button" id="back" onclick="turnback()">Trở về</button>
                                <div class="row flex-fill">
                                    <div class="col-12">
                                        <table class="table table-striped" id="bill-table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Date</th>
                                                    <th>Address</th>
                                                    <th>Chi tiết đơn hàng</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${bills}" var="b">
                                                    <tr>
                                                        <td>${b.id}</td>
                                                        <td>${b.date}</td>
                                                        <td>${b.address}</td>
                                                        <td><button onclick="details(${b.id})" type="button" class="btn btn-outline-info">Chi tiết</button></td>
                                                    </tr>
                                                </c:forEach>


                                            </tbody>
                                        </table>

                                        <table class="table table-striped" id="order-table">
                                            <thead>
                                                <tr>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Số lượng</th>
                                                    <th>Đơn giá</th>
                                                    
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${orders}" var="order">
                                                    <c:forEach items="${products}" var="product"> 
                                                        <c:if test="${order.productId == product.productId}">
                                                            <tr data-bill-id="${order.billId}"> 
                                                                <td>${product.name}</td>
                                                                <td><img src="${product.img}" width="200"></td>
                                                                <td>${order.quantity}</td>
                                                                <td>${order.payment} đ</td>
                                                                
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
                                <h3 class="mb-4">Notification Settings</h3>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="notification1">
                                        <label class="form-check-label" for="notification1">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum accusantium accusamus, neque cupiditate quis
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="notification2" >
                                        <label class="form-check-label" for="notification2">
                                            hic nesciunt repellat perferendis voluptatum totam porro eligendi.
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="notification3" >
                                        <label class="form-check-label" for="notification3">
                                            commodi fugiat molestiae tempora corporis. Sed dignissimos suscipit
                                        </label>
                                    </div>
                                </div>
                                <div>
                                    <button class="btn btn-primary">Update</button>
                                    <button class="btn btn-light">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>



        <%@include file="footer.jsp" %>   

    </body>
    <script>
        $(document).ready(function () {
            $('#eye').click(function () {
                $(this).toggleClass('open');
                $(this).children('i').toggleClass('fa-eye-slash fa-eye');
                if ($(this).hasClass('open')) {
                    $(this).next().attr('type', 'text');
                } else {
                    $(this).next().attr('type', 'password');
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#eye1').click(function () {
                $(this).toggleClass('open');
                $(this).children('i').toggleClass('fa-eye-slash fa-eye');
                if ($(this).hasClass('open')) {
                    $(this).next().attr('type', 'text');
                } else {
                    $(this).next().attr('type', 'password');
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#eye2').click(function () {
                $(this).toggleClass('open');
                $(this).children('i').toggleClass('fa-eye-slash fa-eye');
                if ($(this).hasClass('open')) {
                    $(this).next().attr('type', 'text');
                } else {
                    $(this).next().attr('type', 'password');
                }
            });
        });
    </script>
    <script>
        const back = document.getElementById("back");
        const billTable = document.getElementById("bill-table");
        const orderTable = document.getElementById("order-table");
        orderTable.style.display = 'none';
        back.style.display = 'none';

        function details(x) {
            back.style.display = 'block';
            billTable.style.display = 'none';
            orderTable.style.display = 'block';

            orderTable.querySelectorAll("tbody > tr").forEach(e => {
                if (e.dataset.billId == x)
                    e.classList.remove("d-none");
                else
                    e.classList.add("d-none");
            });
        }
        
        function turnback(){
             billTable.style.display = 'block';
             orderTable.style.display = 'none';
        }
    </script>

</html>
