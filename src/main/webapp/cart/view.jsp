<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 15/03/2023
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>
    <a href="/cart">List All Cart</a>
</h2>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Cart Information</h2>
            </caption>
            <tr>
                <td>Cart ID:</td>
                <td>${cart.id}</td>
            </tr>
            <tr>
                <td>Food Quantity:</td>
                <td>${cart.quantity}</td>
            </tr>
            <tr>
                <td>Food Price:</td>
                <td>${cart.food.price}</td>
            </tr>
            <tr>
                <td>Food Image:</td>
                <td><img src="${cart.food.img_link}" alt="food_image"></td>
            </tr>
            <tr>
                <td>Coupon</td>
                <td><c:out value="${cart.coupon.name}"/></td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
