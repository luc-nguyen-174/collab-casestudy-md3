<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, th, td {
            border: 2px solid black;
            border-collapse: collapse;
        }

        .fa-eye {

        }
    </style>
</head>
<body>
<h2>List Merchant Information</h2>
<table>
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
                <a href="<c:url value="/merchants?action=view&id=${merchant.getId()}"/>">
                    <i class="fa-solid fa-eye"></i></a>
                <a href="/merchants?action=edit&id=${merchant.id}">
                    <i class="fa-solid fa-pen-nib"></i></a>
                <a href="/merchants?action=delete&id=${merchant.id}">
                    <i class="fa-solid fa-trash"></i></a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://kit.fontawesome.com/13a7b8c203.js" crossorigin="anonymous"></script>
</body>
</html>
