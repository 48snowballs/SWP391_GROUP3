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
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/checkout.css">
        <link rel="stylesheet" href="css/product.css"/>
        <link rel="icon" href="images/icon.png"/>
        <title>Giỏ hàng</title>
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

        <div class="container mt-5">

            <table class="table table-striped mt-5 mb-5">
                <c:if test="${cart == null}">
                    <h1 style="text-align: center">Giỏ hàng của bạn hiện đang trống</h1>
                </c:if>

                <c:if test="${cart != null}">
                    <thead>
                        <tr>
                            <td class="qc-image">Hình ảnh</td>
                            <td class="qc-name">Tên sản phẩm</td>
                            <td class="qc-size">Bộ nhớ</td>
                            <td class="qc-quantity ">Số lượng</td>
                            <td class="qc-price">Đơn Giá</td>
                            <td class="qc-total">Tổng cộng</td>
                            <td class="qc-delete">Xóa</td>
                        </tr>
                    </thead>

                    <tbody>				
                    <form action="deletecartproduct" method="POST">
                        <c:forEach items="${cart}" var="c">
                            <c:forEach items="${productList}" var="p">
                                <c:forEach items="${brandList}" var="b">
                                    <c:if test="${c.getProductId() == p.getProductId() && p.getBrandId() == b.getBrandId()}">
                                        <input type="hidden" name="pid" value="${c.getProductId()}">
                                        <input type="hidden" name="size" value="${c.getSize()}">
                                        <tr>    
                                            <td class="qc-image">
                                                <a href="product?productid=${c.getProductId()}&brandid=${p.getBrandId()}&brand=${b.getBrandName()}"><img src="${p.getImg()}" style="width: 90px;"/></a>
                                            </td>

                                            <td class="qc-name">
                                                <a href="product?productid=${c.getProductId()}&brandid=${p.getBrandId()}&brand=${b.getBrandName()}">${p.getName()}</a>
                                            </td>

                                            <td class="qc-size">
                                                ${c.getSize()}
                                            </td>

                                            <td class="qc-quantity ">
                                                ${c.getQuantity()}
                                            </td>

                                            <td class="qc-price">
                                                ${p.getPrice()} đ
                                            </td>

                                            <td class="qc-total">
                                                ${c.getQuantity() * p.getPrice()} đ
                                            </td>

                                            <td class="qc-delete">
                                                <button type="submit"><i class="fa-solid fa-trash-can"></i></button>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>
                    </form>
                    </tbody>
                </c:if>
            </table>

            <c:if test="${sessionScope.username != null && cart != null}">
                <div style="margin-bottom: 50px">
                    <a href="checkout" class="btn btn-primary">
                        <div>Thanh toán</div>
                    </a>
                </div>
            </c:if>
        </div>



        <%@include file="footer.jsp" %>
    </body>
</html>