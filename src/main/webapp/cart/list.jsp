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
<center>
    <h1>Cart Management</h1>
    <h2>
        <a href="/cart?action=create">Add New Employee</a>
    </h2>
</center>
<table border="1" cellpadding="5">
    <caption><h2>List of cart</h2></caption>
    <tr>
        <th>ID</th>
        <th>Quantity</th>
        <th>Food</th>
        <th>Coupon</th>
        <th>User</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="cart" items="${requestScope.carts}">
        <tr>
            <td><c:out value="${cart.id}"/></td>
            <td><c:out value="${cart.quantity}"/></td>
            <td><c:out value="${cart.food.name}"/></td>
            <td><c:out value="${cart.coupon.name}"/></td>
            <td><c:out value="${cart.user.username}"/></td>
            <td>
                <a href="/food?action=edit&id=${food.id}">Edit</a>
                <a href="/food?action=delete&id=${food.id}">Delete</a>
                <a href="/food?action=view&id=${food.id}">View</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
