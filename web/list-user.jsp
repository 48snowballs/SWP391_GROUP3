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
    <title>List User</title>
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
                        <li class="active"> <a href="/Project_SWP/list-user"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                        </li>
                        <li class="submenu"> <a href="/Project_SWP/edit-eula"><i class="fas fa-cog"></i> <span> Edit EULA </span> <span class="menu-arrow"></span></a>
                        </li>

                        <li class="list-divider"></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="container mt-5">
                <div class="row justify-content-center pt-3">
                    <form class="col-10 col-sm-8 col-md-4 d-flex" onchange="this.submit()">
                        <a class="btn btn-success" href="list-user?page=${currentPage - 1 <= 0 ? 1 : currentPage - 1}">
                            <i class="fa-solid fa-angle-left"></i>
                        </a>

                        <select class="form-select me-1 ms-1" name="page">
                            <c:forEach var="page" begin="${1}" end="${pageCount}">
                                <option value="${page}" <c:if test="${page == currentPage}">selected</c:if>>
                                    Page ${page}
                                </option>
                            </c:forEach>
                        </select>
                            
                            <a class="btn btn-success" href="list-user?page=${currentPage + 1 > pageCount ? pageCount : currentPage + 1}">
                                <i class="fa-solid fa-angle-right"></i>
                            </a>
                    </form>
                </div>

                <table class="table table-striped">
                    <tr>
                        <th class="text-center">UserName</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Address</th>
                        <th class="text-center">Phone</th>              
                        <th class="text-center">Action</th>              
                    </tr>
                    <br>

                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.getKey().getUsername()}</td>
                            <td>${user.getValue().getName()}</td>
                            <td>${user.getValue().getEmail()}</td>
                            <td>${user.getValue().getAddress()}</td>
                            <td>${user.getValue().getPhone()}</td>

                            <td>
                                <form method="post" class="m-0 p-0">
                                    <input type="hidden" name="id" value="${user.getValue().getId()}">
                                    <button type="submit" class="btn btn-danger m-0">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
