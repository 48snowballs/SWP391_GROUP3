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
        <title>Thanh toán</title>
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
        <script>
            var data = null;
            var tinh = null;

            window.addEventListener("load", async function () {
                data = await fetch("https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json").then(r => r.json());
                console.log(data);

                document.querySelector("select[name='tinh']").innerHTML = "";
                document.querySelector("select[name='tinh']").append(
                        ...data.map(tinh => {
                            const option = document.createElement("option");
                            option.value = tinh.Id;
                            option.innerText = tinh.Name;
                            return option;
                        })
                        );

                chonTinh({value: data[0].Id});

                document.querySelector('form[action="bill"]').onsubmit = function (e) {
                    e.preventDefault();
                    fetch('bill?' + new URLSearchParams({
                        "address": e.target.querySelector('*[name="address"]:checked').value,
                        "thanh-pho": e.target.querySelector('*[name="thanh-pho"]>option:checked').innerText,
                        "quan": e.target.querySelector('*[name="quan"]>option:checked').innerText,
                        "tinh": e.target.querySelector('*[name="tinh"]>option:checked').innerText,
                        "dia-chi": e.target.querySelector('*[name="dia-chi"]').value
                    }).toString(), {method: 'POST', redirect: 'follow'}).then(response => {

                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                    });
                };
            });

            function chonTinh(tinhSelector) {
                tinh = data.find(t => t.Id == tinhSelector.value);

                document.querySelector("select[name='thanh-pho']").innerHTML = "";
                document.querySelector("select[name='thanh-pho']").append(
                        ...tinh.Districts.map(district => {
                            const option = document.createElement("option");
                            option.value = district.Id;
                            option.innerText = district.Name;
                            return option;
                        })
                        );

                chonThanhPho({value: tinh.Districts[0].Id});
            }

            function chonThanhPho(thanhPhoSelector) {
                const district = tinh.Districts.find(t => t.Id == thanhPhoSelector.value);

                document.querySelector("select[name='quan']").innerHTML = "";
                document.querySelector("select[name='quan']").append(
                        ...district.Wards.map(ward => {
                            const option = document.createElement("option");
                            option.value = ward.Id;
                            option.innerText = ward.Name;
                            return option;
                        })
                        );
            }
        </script>

        <%@include file="header.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-sm-4 roll_back">
                    <a href="home"><i class="fa-solid fa-angles-left"></i> &nbsp;Quay lại mua hàng</a>
                </div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
            </div>
        </div>

        <form action="bill" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="table">
                            <div class="head">
                                <i class="fa-solid fa-location-dot"></i> Địa chỉ
                            </div>
                            <div class="body">
                                <input type="radio" name="address" id="old_address" checked="true" onclick="hide()" value="old">
                                <label for="old_address">${infor.getAddress()}</label><br>

                                <input type="radio" name="address" id="new_address" onclick="show()" value="new">
                                <label for="new_address">Tôi muốn dùng địa chỉ mới</label>

                                <div class="customer_new_address">
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <span style="color: red">* </span>Tỉnh thành:
                                        </div>
                                        <div class="col-sm-7">
                                            <select name="tinh" class="form-select" onchange="chonTinh(this)" style="width: 170px;">
                                            </select>
                                        </div><br><br>

                                        <div class="col-sm-5">
                                            <span style="color: red">* </span>Quận huyện:
                                        </div>
                                        <div class="col-sm-7">
                                            <select name="thanh-pho" class="form-select" onchange="chonThanhPho(this)" style="width: 170px;">
                                            </select>
                                        </div><br><br>

                                        <div class="col-sm-5">
                                            <span style="color: red">* </span>Phường xã:
                                        </div>
                                        <div class="col-sm-7">
                                            <select name="quan" class="form-select" style="width: 170px;">
                                            </select>
                                        </div><br><br>

                                        <div class="col-sm-5">
                                            <span style="color: red">* </span>Địa chỉ:
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" name="dia-chi" style="width: 170px;" placeholder="* Địa chỉ">
                                        </div><br><br>
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="table">
                            <div class="head">
                                <i class="fa-solid fa-truck-fast"></i>Phương thức giao hàng
                            </div>
                            <div class="body">
                                <div class="row">
                                    <div class="col-sm-10">Free Ship</div>
                                    <div class="col-sm-2">0đ</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="table">
                            <div class="head">
                                <i class="fa-solid fa-truck-fast"></i>Phương thức thanh toán
                            </div>
                            <div class="body">
                                <div class="row">
                                    Thanh toán khi nhận hàng
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="eula">
                    <a href="eula">
                        Chính sách mua hàng
                    </a>
                </div>

            </div>
            <div class="container">
                <div class="cart">
                    <table class="table table-striped m-0 mt-5 mb-5">
                        <thead>
                            <tr>
                                <td class="qc-image">Hình ảnh</td>
                                <td class="qc-name">Tên sản phẩm</td>
                                <td class="qc-size">Size</td>
                                <td class="qc-quantity ">Số lượng</td>
                                <td class="qc-price">Đơn Giá</td>
                                <td class="qc-total">Tổng cộng</td>
                            </tr>
                        </thead>

                        <tbody>				
                            <c:forEach items="${cart}" var="c">
                                <c:forEach items="${productList}" var="p">
                                    <c:forEach items="${brandList}" var="b">
                                        <c:if test="${c.getProductId() == p.getProductId() && p.getBrandId() == b.getBrandId()}">
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
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="container">
                <div  class="cart">
                    <div class="table">
                        <div class="head">
                            <i class="fa-solid fa-money-bill"></i> Tổng cộng
                        </div>

                        <div class="body">
                            <h1>Tổng giá tiền: <b class="text-danger">${sum}₫</b></h1>

                            <button type="submit" class="btn btn-primary mt-4">Xác Nhận Đơn Hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%@include file="footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous">
        </script>

        <script>
            document.getElementsByClassName("customer_new_address")[0].style.display = 'none';

            function show() {
                document.getElementsByClassName("customer_new_address")[0].style.display = 'block';
            }

            function hide() {
                document.getElementsByClassName("customer_new_address")[0].style.display = 'none';
            }
        </script>
    </body>
</html>