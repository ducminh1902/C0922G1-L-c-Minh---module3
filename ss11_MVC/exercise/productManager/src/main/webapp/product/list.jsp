<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/3/2023
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<h1 style="color: orange;text-align: center">Product List</h1>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand"></a>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-warning" type="submit">Search</button>
        </form>
    </div>
</nav>
<table class="table table-warning table-striped">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Describe</th>
        <th>Brand</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="product" items="${listProduct}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.describe}</td>
            <td>${product.brand}</td>
            <td><a href="/product?action=delete&id=${product.id}"><button type="button" class="btn btn-outline-warning"><i class="fa-sharp fa-solid fa-trash"></i></button></a></td>
            <td><a href="/product?action=update&id=${product.id}"><button type="button" class="btn btn-outline-warning"><i class="fa-sharp fa-solid fa-pen-to-square"></i></button></a></td>
        </tr>
    </c:forEach>
</table>
<a href="/product?action=add"><button  type="button" class="btn btn-warning">Add New Product</button></a>
</body>
</html>
