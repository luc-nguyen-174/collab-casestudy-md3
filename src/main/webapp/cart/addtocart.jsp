<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 16/03/2023
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>
    <a href="/cart">List All Cart</a>
</h2>
<form action="" method="post">
    <c:if test="${cart != null}">
        <input type="hidden" name="id" value="<c:out value='${food.id}'/>"/>
    </c:if>
    <tr>
        <th>Card ID</th>
        <td>
            <input type="hidden" name="id" id="id" size="45"
                   value="<c:out value='${cart.id}'/>">
        </td>
    </tr>
    <tr>
        <th>Food Quantity</th>
        <td>
            <input type="hidden" name="quantity" id="quantity" size="45"
                   value="<c:out value='${cart.quantity}'/>">
        </td>
    </tr>
    <tr>
        <th>Food Name</th>
        <td>

            <input type="hidden" name="food_id" id="food_id" size="45"
                   value="<c:out value='${cart.food.id}'/>">

        </td>
        <td>${card.food.name}</td>
    </tr>
    <tr>
        <th>Coupon</th>
        <td>
            <input type="hidden" name="coupon_id" id="coupon_id" size="45"
                   value="<c:out value='${cart.coupon.id}'/>">
        </td>
    </tr>
    <tr>
        <th>User</th>
        <td>
            <input type="text" name="user_id" id="user_id" size="45"
                   value="<c:out value='${cart.user.id}'/>">
        </td>
    </tr>
</form>
</body>
</html>
