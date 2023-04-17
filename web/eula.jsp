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
        <title>G3Mobile</title>

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

        <div class="container p-3">
            <h1 class="text-primary">EULA</h1>

            <c:forEach items="${eulas}" var="e">
                <div class="ms-3 mb-3">
                    <h5>${e.id}. ${e.content}</h5>
                </div> 
            </c:forEach>

            <a href="." class="btn btn-primary" type="submit">Back To Home</a>
        </div>

        <%@include file="footer.jsp" %>     
    </body>
</html>
