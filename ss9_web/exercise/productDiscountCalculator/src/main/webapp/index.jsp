<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/26/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/discount" method="post">
    <h1>Product Discount Calculator</h1>
    <br>
    <input type="text" placeholder="Product Description">
    <input type="text" placeholder="List Price" name="listPrice">
    <input type="text" placeholder="Discount Percent" name="discountPercent">
    <button type="submit">Calculator</button>
  </form>

  </body>
</html>
