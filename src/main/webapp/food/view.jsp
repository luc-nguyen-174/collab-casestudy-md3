<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 14/03/2023
  Time: 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap User Management Data Table</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/efeb346dcb.js" crossorigin="anonymous"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #299be4;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn:hover, .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.settings {
            color: #2196F3;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }

        .text-success {
            color: #10c469;
        }

        .text-info {
            color: #62c9e8;
        }

        .text-warning {
            color: #FFC107;
        }

        .text-danger {
            color: #ff5b5b;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
        }

        input[type=number] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <form method="post" action="/food?action=addtocart?id=${food.id}">
                <c:if test="${food != null}">
                    <input type="hidden" name="id" value="<c:out value='${food.id}'/>"/>
                    <input type="hidden" name="name" value="<c:out value='${food.name}'/>"/>
                    <input type="hidden" name="price" value="<c:out value='${food.price}'/>"/>
                    <input type="hidden" name="detail" value="<c:out value='${food.detail}'/>"/>
                    <input type="hidden" name="img_link" value="<c:out value='${food.img_link}'/>"/>
                    <input type="hidden" name="merchant_id" value="<c:out value='${food.merchant_id}'/>"/>
                    <input type="hidden" name="certificate" value="<c:out value='${food.certificate}'/>"/>
                    <input type="hidden" name="is_active" value="<c:out value='${food.is_active}'/>"/>
                </c:if>
                <table class="table table-striped table-hover">

                    <thead>
                    <tr>
                        <th>FOOD ID</th>
                        <th>FOOD NAME</th>
                        <th>QUANTITY</th>
                        <th>PRICE</th>
                        <th>DETAIL</th>
                        <th>MERCHANT NAME</th>
                        <th>STATUS</th>
                        <th>CERTIFICATE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${food.id}</td>
                        <td><a href="#"><img src="${food.img_link}" class="avatar" alt="Avatar">${food.name}</a></td>
                        <td>
                            <input type="number" id="myNumber" value="0" size="10">
                            <button id="increaseButton"><i class="fa-solid fa-circle-plus"></i></button>
                            <button id="decreaseButton"><i class="fa-solid fa-circle-minus"></i></button>
                        </td>
                        <td>${food.price}</td>
                        <td>${food.detail}</td>
                        <td>${food.merchant.name}</td>
                        <td><span class="status text-success"></span>
                            <c:choose>
                                <c:when test="${food.is_active}">
                                    <p>Food Available<p>
                                </c:when>
                                <c:otherwise>
                                    <p>Do Not Available</p>
                                </c:otherwise>
                            </c:choose></td>
                        <td><span class="status text-success"></span><c:choose>
                            <c:when test="${food.certificate}">
                                <p>Has Certificate<p>
                            </c:when>
                            <c:otherwise>
                                <p>Do Not Has Certificate</p>
                            </c:otherwise>
                        </c:choose></td>
                    </tr>
                    </tbody>
                </table>
                <input type="submit" value="Add to cart">
            </form>
        </div>
    </div>
</div>
<script>
    var myNumber = document.getElementById("myNumber");
    var increaseButton = document.getElementById("increaseButton");
    var decreaseButton = document.getElementById("decreaseButton");

    increaseButton.addEventListener("click", function () {
        myNumber.value++;
    });

    decreaseButton.addEventListener("click", function () {
        if (myNumber.value > 0) {
            myNumber.value--;
        }
    });


</script>
</body>
</html>
