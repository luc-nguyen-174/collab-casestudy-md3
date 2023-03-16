<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 13/03/2023
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<center><h1>List user</h1>
    <h2><a href="/user?action=create">Create new user</a></h2>
    <h2><a href="/user?action=search">Search user</a></h2>
</center>
<table border="1">
<tr>
    <td>ID</td>
    <td>NAME</td>
    <td>EMAIL</td>
    <td>PHONE</td>
    <td>ADDRESS</td>
    <td>STATUS</td>
    <td>ACTION</td>
</tr>
<c:forEach var="user" items="${requestScope.users}">
    <tr>

        <td><c:out value="${user.id}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.phone}"/></td>
        <td><c:out value="${user.address.address_name}"/></td>
        <td><c:out value="${user.is_active}"/></td>
        <td>
            <a href="/user?action=edit&id=${user.id}">EDIT</a>
            <a href="/user?action=delete&id=${user.id}">DISABLE</a>
        </td>
    </tr>
</c:forEach>
</table>
</body>
</html>
