<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 14/03/2023
  Time: 00:42
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
    <h1>Employee Management</h1>
    <h2>
        <a href="/food?action=create">Add New Employee</a>
    </h2>
</center>
<table border="1" cellpadding="5">
    <caption><h2>List of Employees</h2></caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Details</th>
        <th>Image</th>
        <th>Merchant</th>
        <th>Certificate</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="food" items="${requestScope.foods}">
        <tr>
            <td><c:out value="${food.id}"/></td>
            <td><c:out value="${food.name}"/></td>

            <td><c:out value="${food.price}"/></td>

            <td><c:out value="${food.detail}"/></td>
            <td>
<%--                <c:out value="${food.img_link}"/>--%>
                <img src="${food.img_link}" alt="food_image" width="50" height="50">
            </td>
            <td><c:out value="${food.merchant.name}"/></td>
            <td>
                <c:choose>
                    <c:when test="${food.certificate}">
                        <p>Has Certificate<p>
                    </c:when>
                    <c:otherwise>
                        <p>Do Not Has Certificate</p>
                    </c:otherwise>
                </c:choose>
            </td>
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
