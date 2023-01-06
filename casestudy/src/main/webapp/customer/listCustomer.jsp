<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/28/2022
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="bootstrap-5.1.3-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light " style="background: black;height: 60px">
        <div class="container-fluid">
            <li class="nav-item dropdown">
                <a class="nav-link " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                   style="margin-bottom: 20px">
                    <i class="fa-solid fa-bars" style="color: white;font-size: 30px;text-align: center"></i>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#"><b>Find & Reserve</b></a></li>
                    <li><a class="dropdown-item" href="#"><b>Special Offer</b></a></li>
                    <li>
                        <hr class="dropdown-divider">
                        <b>Meeting and Event</b></li>
                    <li><a class="dropdown-item" href="#"><b>Vacation</b></a></li>
                    <li><a class="dropdown-item" href="#"><b>Our Brand</b></a></li>
                    <li><a class="dropdown-item" href="#"><b>Our Credit Cards</b></a></li>
                    <li><a class="dropdown-item" href="#"><b>About Marriot Bonvoy</b></a></li>
                    <li><a class="dropdown-item" href="#"><b>Career at Marriot</b></a></li>
                </ul>
            </li>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                </ul>
                <form class="d-flex">
                    <img src="https://mobile-app.marriott.com/global/images/brands/header-logo.svg" width="100px"
                         height="50px">
                </form>
            </div>
        </div>
    </nav>
</div>
<div>
    <nav class="navbar navbar-expand-lg navbar-light " style="background: white;height: 100px">
        <div class="container-fluid">
            <a class="nav-link " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"
               style="margin-bottom: 20px;margin-top: 20px">
                <img src="https://cache.marriott.com/content/dam/marriott-digital/mc/global-property-shared/en_us/logo/assets/mc_logo_L.png"
                     height="80px" width="100px">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                </ul>
                <form class="d-flex">
                    <a href="http://localhost:8080/">
                        <button type="button" class="btn" style="background: darkred;color: white">Back to Menu</button>
                    </a>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1 style="color: black;text-align: center">List Customer</h1>
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand"></a>
        <form class="d-flex" action="/customer?action=find" method="get">
            <input type="hidden" name="action" value="find">
            <input class="form-control me-2" name="name" type="search" placeholder="Search by name" aria-label="Search">
           <button class="btn btn-outline-danger" type="submit"><i class="fa-sharp fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
    </div>`
</nav>
<table class="table">
    <tr>
        <th style="color: darkred">#</th>
<%--        <th style="color: darkred">Customer Type Id</th>--%>
        <th style="color: darkred">Name</th>
        <th style="color: darkred">Date Of Birth</th>
        <th style="color: darkred">Gender</th>
        <th style="color: darkred">Id Card</th>
        <th style="color: darkred">Phone Number</th>
        <th style="color: darkred">Email</th>
        <th style="color: darkred">address</th>
        <th style="color: darkred">edit</th>
        <th style="color: darkred">delete</th>
    </tr>
    <c:forEach var="customer" items="${listCustomer}" varStatus="status">
        <tr>
            <td>${status.count}</td>
<%--            <td>${customer.customerTypeId}</td>--%>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <c:if test="${customer.gender}">
                <td>Nam</td>
            </c:if>
            <c:if test="${!customer.gender}">
                <td>Nữ</td>
            </c:if>
            <td>${customer.idCard}</td>
            <td>${customer.phoneNumber}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <a href="/customer?action=update&id=${customer.id}">
                    <button type="button" class="btn" style="background: darkred;color: white" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        <i class="fa-sharp fa-solid fa-pen-to-square"></i>
                    </button>
                </a>
            </td>
            <td><a href="/customer?action=delete&id=${customer.id}">
                <button type="button" class="btn" style="background: darkred;color: white" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    <i class="fa-sharp fa-solid fa-trash"></i>
                </button>
            </a></td>
        </tr>
    </c:forEach>
</table>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>
            <form class="d-flex" role="search">
                <a href="/customer?action=add">
                    <button type="button" class="btn " style="background:darkred;color: white">ADD NEW CUSTOMER</button>
                </a>
            </form>
        </div>
    </div>
</nav>
</body>
</html>
