<%-- 
    Document   : converse
    Created on : Jun 17, 2022, 1:46:02 PM
    Author     : vuman
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, Model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${product.getName()}</title>
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
        <link rel="stylesheet" href="css/product.css" />
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="store">
            <div class="container">
                <nav aria-label="breadcrumb" class="mt-3">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=".">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="">All ${brandName}</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="product?productid=${product.getProductId()}">${product.getName()}</a>
                        </li>
                    </ol>
                </nav>

                <div class="item">
                    <div class="row">
                        <div class="col-sm-4">
                            <img class="img-responsive img-fluid" src="${product.getImg()}"/>
                        </div>
                        <div class="col-sm-8">
                            <p style="font-size: 26px; font-weight: bold">${product.getName()}</p>
                            <div class="row detail">
                                <div class="col-sm-4 descript" style="font-size: 12.98px">
                                    Năm sản xuất:${product.getDescrip()}<br>
                                    Màu sắc:${product.getColor()}<br>
                                    Xuất xứ:${brandDes}
                                    
                                </div>
                                <div class="col-sm-8">
                                    <p><span>Price: </span><span style="color: red; font-size: 32px; font-weight: 500">${product.getPrice()} đ</span></p>
                                    <p style="font-size: 11px; font-weight: bold">MIỄN PHÍ VẬN CHUYỂN TOÀN QUỐC VÀ HỖ TRỢ TRẢ GÓP 0% KHI ĐẶT HÀNG ONLINE  </p>
                                </div>
                            </div>

                            <form action="checkout" method="post" >
                                <div class="choose_size">
                                    <input type="hidden" name="productId" value="${product.getProductId()}">
                                    <select name="size" id="size" onchange="sizeChanged()">
                                        <option>
                                            Vui lòng chọn dung lượng bộ nhớ
                                        </option>
                                        <c:forEach  items="${size}" var="s">
                                            <option value="${s.getSize()}">
                                                ${s.getSize()}
                                            </option>
                                        </c:forEach>
                                    </select><br>
                                    <div id="alert_choose_size">
                                        
                                    </div>
                                </div>

                                <div class="choose_quantity">
                                    <span style="font-weight: bold">Số lượng:</span>
                                    <input class="minus is-form" type="button" value="-" onclick="decrease()">
                                    <input class="input-qty" name="quantity" type="text" value="1" oninput="checkQuantity()" required pattern="^[0-9]+">
                                    <input class="plus is-form" type="button" value="+" onclick="increase()">
                                </div>

                                <input type="submit" value="Đặt hàng" id="order" onclick="notAllowToOrder()">
                            </form>

                            <div id="alert_login">
                                Vui lòng đăng nhập trước khi đặt hàng
                            </div>

                            <div id="alert_cart_quantity">
                                Số hàng của quý khách vượt quá số hàng trong kho
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>

        <script>
            var x = document.getElementsByClassName("input-qty")[0];
            var please = document.getElementById("alert_choose_size");
            please.style.display = 'none';
            var login = document.getElementById("alert_login");
            login.style.display = 'none';
            var cart = document.getElementById("alert_cart_quantity");
            cart.style.display = 'none';

            function sizeChanged() {
                x.value = 1;
            }

            function decrease() {
                if (x.value <= 1) {
                    x.value = 1;
                    return;
                }
                x.value--;
            }
            ;

            function increase() {
                var value = document.getElementById("size").value;
            <c:forEach items="${size}" var="s">
                if (value == '${s.getSize()}') {
                    if (x.value >= ${s.getQuantity()}) {
                        x.value = ${s.getQuantity()};
                        return;
                    }
                }
            </c:forEach>
                x.value++;
            }
            ;

            function notAllowToOrder() {
                var value = document.getElementById("size").value;

                if (value == 'Vui lòng chọn hình thức thanh toán') {
                    please.style.display = 'inline-block';
                    return false;
                }
                
                if(x.value / 1 != x.value){
                    return false;
                }
                

            <c:if test="${sessionScope.username == null}">
                login.style.display = 'inline-block';
                return false;
            </c:if>

            <c:if test="${sessionScope.username != null}">
                <c:forEach items="${size}" var="s">
                if (value === '${s.getSize()}') {
                    <c:forEach items="${cart}" var="cart">
                    if (value === '${cart.getSize()}' && <%= request.getParameter("productid")%> == ${cart.getProductId()}) {
                        if (x.value > (${s.getQuantity()} - ${cart.getQuantity()})) {
                            cart.style.display = 'block';
                            return false;
                        }
                    }
                    </c:forEach>
                }
                </c:forEach>
            </c:if>


                return;
            }
            ;

            function checkQuantity() {
                var value = document.getElementById("size").value;
            <c:forEach items="${size}" var="s">
                if (value == '${s.getSize()}') {
                    if (x.value > ${s.getQuantity()}) {
                        x.value = ${s.getQuantity()};
                        return;
                    }
                    if (x.value < 1) {
                        x.value = 1;
                    }
                }
            </c:forEach>
            }
            ;


        </script>

    </body>
</html>
