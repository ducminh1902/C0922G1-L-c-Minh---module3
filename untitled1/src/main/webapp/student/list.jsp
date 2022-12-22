<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/21/2022
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="color: darkseagreen">Dánh Sách Học Sinh</h1>
<a href="/student?action=add"><button type="button" class="btn btn-outline-danger">Thêm Học Sinh Mới</button></a>
<br>
<table class="table  table-success table-striped">
    <tr>
        <th style="color: red">Id</th>
        <th style="color: red">Name</th>
        <th style="color: red">Class</th>
        <th style="color: red">Delete</th>
    </tr>
<c:forEach items="${listStudent}"  var="student">
    <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.className}</td>
        <td><a href="/student?action=delete&id=${student.id}"><button type="button" class="btn btn-outline-success">Delete</button></a></td>
    </tr>
</c:forEach>
</table>
</body>
</html>
