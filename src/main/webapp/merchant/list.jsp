<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="border: 2px solid black;">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>ID Cart</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="merchant" items="${merchants}">
        <tr>
            <td><c:out value="${merchant.id}"/></td>
            <td><c:out value="${merchant.name}"/></td>
            <td><c:out value="${merchant.age}"/></td>
            <td><c:out value="${merchant.id_number}"/></td>
            <td><c:out value="${merchant.address.address_name}"/></td>
            <td><c:out value="${merchant.phone}"/></td>
            <td><c:out value="${merchant.email}"/></td>
            <td>
                <a href="/merchants?action=edit&id=${merchant.id}">Edit</a>
                <a href="/merchants?action=delete&id=${merchant.id}">Delete</a>
            </td>
        </tr>
</table>
</c:forEach>
</body>
</html>
