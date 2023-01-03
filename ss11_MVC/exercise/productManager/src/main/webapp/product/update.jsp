<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/3/2023
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<form action="/product?action=update" method="post" >
    <h1 style="color: orange">Product Information Udpate</h1>
    <input type="hidden" name="oldId" value="${product.id}">
    <p>ID</p>
    <input type="text" name="id" value="${product.id}">
    <br>
    <p>Name</p>
    <input type="text" name="name" value="${product.name}">
    <br>
    <p>Price</p>
    <input type="text" name="price" value="${product.price}">
    <br>
    <p>Describe</p>
    <input type="text" name="describe" value="${product.describe}">
    <br>
    <p>Brand</p>
    <input type="text" name="brand" value="${product.brand}">
    <br>
    <button type="submit"  type="button" class="btn btn-warning">UPDATE</button>
</form>
</body>
</html>
