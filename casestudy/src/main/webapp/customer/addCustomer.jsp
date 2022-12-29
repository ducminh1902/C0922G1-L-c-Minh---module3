<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/29/2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <a href="/customer"><button type="button" class="btn" style="background: darkred;color: white" >Back to list</button></a>
                </form>
            </div>
        </div>
    </nav>
</div>
<form action="/customer?action=add" method="post">
    <h1 style="text-align: center">Insert Customer Information</h1>
    <br>
    <div class="form-floating">
        <input type="text" class="form-control" id="CTI" name="customerTypeId">
        <label for="CTI"> Customer Type Id</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="name" name="name">
        <label for="name"> Name</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="DOB" name="dateOfBirth">
        <label for="DOB"> Date Of Birth</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="gender" name="gender">
        <label for="gender"> Gender</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="IC" name="idCard">
        <label for="IC"> Id Card</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="PN" name="phoneNumber">
        <label for="PN">Phone Number</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="Email" name="email">
        <label for="Email"> Email</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="Address" name="address">
        <label for="Address"> Address</label>
    </div>
    <br>
    <button type="submit" class="btn " style="background: darkred;color: white">Add New Customer</button>
</form>

</body>
</html>
