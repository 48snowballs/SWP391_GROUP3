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
    <title>Edit Product</title>
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
                        <li class="active"> <a href="/Project_SWP/list-product"><i class="fas fa-suitcase"></i> <span> Manager Product </span> <span class="menu-arrow"></span></a>
                        </li>
                        <li class="submenu"> <a href="/Project_SWP/list-user"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                        </li>
                        <li class="submenu"> <a href="/Project_SWP/edit-eula"><i class="fas fa-cog"></i> <span> Edit EULA </span> <span class="menu-arrow"></span></a>
                        </li>

                        <li class="list-divider"></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Edit <b>Product</b></h2>
                            </div>
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="editEmployeeModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="create" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Create Product</h4>

                                    <a href="list-product" class="btn btn-close"></a>
                                </div>

                                

                                <div class="modal-body">					
                                    <div class="form-floating mb-3">
                                        <input value="" name="name" type="text" class="form-control" required>
                                        <label class="form-label">Name</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input value="" name="image" type="text" class="form-control" required>
                                        <label class="form-label">Image</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input value="" name="price" type="text" class="form-control" required>
                                        <label class="form-label">Price</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <textarea name="description" class="form-control">${product.descrip}</textarea>
                                        <label class="form-label">Description</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <textarea name="color" class="form-control">${product.color}</textarea>
                                        <label class="form-label">color</label>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Brand</label>
                                        <select name="brand" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.brands}" var="b">
                                                <option value="${b.brandId}" >${b.brandName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Category</label>
                                        <select name="category" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${requestScope.category}" var="c">
                                                <option value="${c.categoryID}">${c.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Create</button>
                                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
