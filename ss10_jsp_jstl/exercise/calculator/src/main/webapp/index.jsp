<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/26/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
  <form action="/calculator" method="post">
    <h1 style="color: cadetblue">Calculator</h1>
    <br>
    First Number :
    <input type="text" name="firstNumber">
    <br>
    <br>
    Operator : <select name="selector">
      <option style="color: cadetblue" value="+">Addition(+)</option>
      <option style="color: cadetblue" value="-">Subtraction (-)</option>
      <option style="color: cadetblue" value="*">Multiplication (x)</option>
      <option style="color: cadetblue" value="/">Division (/)</option>
    </select>
    <br>
    <br>
    Second Number :
    <input type="text" name="secondNumber">
    <br>
    <br>
    <button type="submit" class="btn btn-success">Calculate</button>
  </form>

  </body>
</html>
