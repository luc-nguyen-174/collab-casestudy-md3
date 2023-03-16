<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 15/03/2023
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <c:if test='${message != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>
            <h2>
                Disable
            </h2>
            <h3>Cart Information</h3>
        </caption>
        <tr>
            <td>Cart Id:</td>
            <td><c:out value="${cart.id}"/></td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td><c:out value="${cart.quantity}"/></td>
        </tr>
        <tr>
            <td>Food Name:</td>
            <td><c:out value="${cart.food.name}"/></td>
        </tr>
        <tr>
            <td>Coupon:</td>
            <td><c:out value="${cart.coupon.name}"/></td>
        </tr>
        <tr>
            <td>User Id:</td>
            <td><c:out value="${cart.user.name}"/></td>
        </tr>
    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Delete employee"></td>
            <td><a href="<c:url value="/cart"/>">Back to list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
