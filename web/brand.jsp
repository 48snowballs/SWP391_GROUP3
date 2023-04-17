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
        <title>G3Moblie - ${brandName}</title>
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

        <div class="store">
            <div class="container">
                <nav aria-label="breadcrumb" class="mt-3">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=".">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="">All ${brandName}</a>
                        </li>
                    </ol>
                </nav>

                <img src="images/brand-banner/<%= request.getParameter("brand")%>.jpg" class="img-fluid">

                <div class="d-flex flex-row-reverse mt-3 pe-3">
                    <select class="form-select w-25" id="products-sort">
                        <option value="0">Sắp xếp: Mặc định</option>
                        <option value="1">Sắp xếp: Tên (A - Z)</option>
                        <option value="2">Sắp xếp: Tên (Z - A)</option>
                        <option value="3">Sắp xếp: Giá (Thấp > Cao)</option>
                        <option value="4">Sắp xếp: Giá (Cao > Thấp)</option>
                    </select>
                </div>

                <div class="row" id="products-container">
                    <c:forEach items="${list}" var="x">
                        <div class="col-sm-3 products-item" data-id="${x.getProductId()}" data-name="${x.getName()}" data-price="${x.getPrice()}">
                            <a href="product?productid=${x.getProductId()}"><img class="img-responsive img-fluid" src="${x.getImg()}"/></a><br>
                            <p style="text-align: center; text-transform: uppercase; font-size: 15px">${x.getName()}</p>
                            <p style="text-align: center; font-size: 14px">Price: <span style="font-size: 20px">${x.getPrice()} đ</span></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>

    <script>
        function sortProduct(selector) {
            
            const container = document.querySelector("#products-container");
            let products = container.querySelectorAll(".products-item");

            products = new Array(...products.entries()).map(x => x[1]);

            container.innerHTML = "";

            switch (selector.value) {
                case "0":
                    products.sort((a, b) => parseInt(a.dataset.id) - parseInt(b.dataset.id)).forEach(e => container.appendChild(e));
                    break;
                case "1":
                    products.sort((a, b) => a.dataset.name.localeCompare(b.dataset.name)).forEach(e => container.appendChild(e));
                    break;
                case "2":
                    products.sort((a, b) => -a.dataset.name.localeCompare(b.dataset.name)).forEach(e => container.appendChild(e));
                    break;
                case "3":
                    products.sort((a, b) => parseInt(a.dataset.price) - parseInt(b.dataset.price)).forEach(e => container.appendChild(e));
                    break;
                case "4":
                    products.sort((a, b) => parseInt(b.dataset.price) - parseInt(a.dataset.price)).forEach(e => container.appendChild(e));
                    break;
            }
        }

        window.addEventListener("load", function () {
            const selector = document.querySelector("#products-sort");
            selector.onchange = () => sortProduct(selector);
            sortProduct(selector);
        });
    </script>
</body>
</html>
