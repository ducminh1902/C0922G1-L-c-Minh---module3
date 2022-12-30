<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/30/2022
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Danh Sách Khách Hàng</h1>
<table class="table table-success table-striped">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${list}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birthDay}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.picture}" width="200" height="200"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
