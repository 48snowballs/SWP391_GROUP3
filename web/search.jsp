<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tìm kiếm</title>
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
        <%@include  file="header.jsp" %>

        <div class="container mt-3">
            <div class="row">
                <div class="col-sm-3 col-12">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list me-1"></i>Filter Search</div>
                        <ul class="list-group category_block">

                            <form action="search" method="get" class="bg-white">
                                <li class="list-group-item">
                                    <div class="form-outline">
                                        <input class="form-control" type="text" name="name" value="${name}">
                                        <label class="form-label">Name</label>
                                    </div>
                                </li>

                                <li class="list-group-item">
                                    <h5>Brands:</h5>
                                    <c:forEach items="${requestScope.brands}" var="b">
                                        <div class="form-check">
                                            <input type="checkbox" name="brand" class="me-1" value="${b.brandId}" <c:if test="${brandIDs.contains(b.brandId)}">checked</c:if>>
                                            <span>${b.brandName}</span>
                                        </div>
                                    </c:forEach>
                                    
                                </li>

                                <li class="list-group-item">
                                    <h5>Price:</h5>

                                    <div class="form-outline mb-3">
                                        <input class="form-control" type="text" pattern="\d*" name="from" value="${from}">
                                        <label class="form-label">From</label>
                                    </div>
                                    <div class="form-outline mb-3">
                                        <input class="form-control" type="text" pattern="\d*" name="to" value="${to}">
                                        <label class="form-label">To</label>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <input type="submit" value="Apply" class="btn btn-outline-primary btn-block">
                                </li>
                            </form>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-9 col-12">
                    <div class="row">
                        <c:forEach items="${requestScope.products}" var="o">
                            <div class="col-12 col-md-4 p-3">
                                <a href="product?productid=${o.productId}" title="View Product">
                                    <div class="card" title="${o.name}" data-mdb-toggle="tooltip">
                                        
                                        <img class="card-img-top" src="${o.img}" alt="Card image cap" style="width:253px;height:253px;"/> 
                                            

                                        <h4 class="card-title text-truncate me-2 ms-2">${o.name}</h4>
                                        <h5 class="card-title text-truncate me-2 ms-2">${o.color}</h5>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>

