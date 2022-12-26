<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/26/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
  <head>
    <title>product discount calculator</title>
  </head>
  <body>
  <form action="/discount" method="post">
    <h1 style="color: hotpink">Product Discount Calculator</h1>
    <br>
    <input style="color: hotpink" type="text" placeholder="Product Description">
    <input style="color: hotpink" type="text" placeholder="List Price" name="listPrice">
    <input style="color: hotpink" type="text" placeholder="Discount Percent" name="discountPercent">
    <button type="submit" class="btn btn-$pink-400">Calculate</button>

  </form>

  </body>
</html>
