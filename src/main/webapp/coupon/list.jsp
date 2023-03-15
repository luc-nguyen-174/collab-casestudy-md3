<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 14/03/2023
  Time: 1:47 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center><h1>List coupon</h1>
    <h2><a href="/coupon?action=create">Create new coupon</a></h2>
    <h2><a href="/coupon?action=search"></a></h2>
</center>
<table border="1">
    <tr>
        <td>ID</td>
        <td>NAME</td>
        <td>VALUE</td>
        <td>MERCHANT_ID</td>
        <td>IS_ACTIVE</td>
        <td>ACTION</td>
    </tr>
    <c:forEach items="${requestScope.coupons}" var="coupon">
        <tr>
            <td><c:out value="${coupon.id}"/></td>
            <td><c:out value="${coupon.name}"/></td>
            <td><c:out value="${coupon.value}"/></td>
            <td><c:out value="${coupon.merchant.name}"/></td>
            <td><c:out value="${coupon.is_active}"/></td>
            <td>
                <a href="/coupon?action=view&id=${coupon.id}">VIEW</a>
                <a href="/coupon?action=edit&id=${coupon.id}">EDIT</a>
                <a href="/coupon?action=delete&id=${coupon.id}">DISABLE</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
