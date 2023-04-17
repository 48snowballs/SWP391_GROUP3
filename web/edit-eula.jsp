<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>EULA</title>
    <link rel="icon" href="images/icon.png"/>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet" />

    <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
    <link rel="stylesheet" href="assets/css/style1.css"> 
</head>
<body>
    <div class="main-wrapper">
        <div class="header">
            <div class="header-left">
                <a href="/Project_SWP/home" class="logo"> <img src="images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">G3Mobile</span> </a>
            </div>
            <p class="text-center display-4" style="color:#00bf6f">
                Hello ADMIN!!
            </p>
            <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
            <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
            <ul class="nav user-menu">
                <li class="nav-item dropdown noti-dropdown">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> </a>
                    <div class="dropdown-menu notifications">
                        <div class="topnav-dropdown-header"> 
                            <div class="noti-content">
                                <ul class="notification-list">
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer"> <a href="#">View all Notifications</a> </div>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="top-nav-search">
            </div>
        </div>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="submenu"> <a href="/Project_SWP/admin-dashboard"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
                        <li class="list-divider"></li>
                        <li class="submenu"> <a href="/Project_SWP/list-product"><i class="fas fa-suitcase"></i> <span> Manager Product </span> <span class="menu-arrow"></span></a>
                        </li>
                        <li class="submenu"> <a href="/Project_SWP/list-user"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                        </li>
                        <li class="active"> <a href="/Project_SWP/edit-eula"><i class="fas fa-cog"></i> <span> Edit EULA </span> <span class="menu-arrow"></span></a>
                        </li>
                        
                        <li class="list-divider"></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <form class="container mt-5 p-3" action="edit-eula" method="post">

                <c:forEach items="${eulas}" var="e">
                    <div class="ms-3 mb-3">
                        <h5 class="form-floating">
                            <input class="form-control" name="${e.id}" value="${e.content}">
                            <label class="form-label">Điều ${e.id}</label>
                        </h5>
                    </div> 
                </c:forEach>

                <button class="btn btn-primary" type="submit">Save</button>
                <button class="btn btn-outline-secondary" type="reset">Reset</button>
            </form>
        </div>
    </div>
</body>

</html>
