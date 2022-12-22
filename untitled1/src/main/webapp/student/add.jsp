<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/22/2022
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="color: darkseagreen">Bảng Điền Thông Tin</h1>
<form action="/student?action=add" method="post">
    <p style="color: cadetblue">Hãy nhập id học sinh</p>
    &ensp;&ensp;<input style="color: darkseagreen" type="text" placeholder="id" name="id">
    <br>
    <p style="color: cadetblue">Hãy nhập tên học sinh</p>
    &ensp;&ensp;<input style="color: darkseagreen" type="text" placeholder="name" name="name">
    <br>
    <p style="color: cadetblue" >Hãy nhập lớp học sinh</p>
    &ensp;&ensp;<input style="color: darkseagreen" type="text" placeholder="class" name="class">
    <br>
    <br>
    <button type="submit" class="btn btn-outline-success">Thêm Mới</button>
    <a href="/student"> <button type="button" class="btn btn-outline-success">Quay Lại</button></a>
</form>

</body>
</html>
