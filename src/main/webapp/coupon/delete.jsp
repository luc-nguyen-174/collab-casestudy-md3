<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 15/03/2023
  Time: 12:53 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DISABLE COUPON</title>
</head>
<body>
<form method="post">
    <table border="1">
        <caption>Disable coupon</caption>
        <tr>
            <td>ID</td>
            <td><c:out value="${coupon.id}"/></td>
        </tr>
        <tr>
            <td>NAME</td>
            <td><c:out value="${coupon.name}"/></td>
        </tr>
        <tr>
            <td>VALUE</td>
            <td><c:out value="${coupon.value}"/></td>
        </tr>
        <tr>
            <td>MERCHANT ID</td>
            <td><c:out value="${coupon.merchant_id}"/></td>
        </tr>
    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Disable coupon"></td>
            <td><a href="/coupon">Back to list coupon</a></td>
        </tr>
    </table>
</form>
</body>
</html>
