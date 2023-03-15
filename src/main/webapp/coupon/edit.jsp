<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 15/03/2023
  Time: 12:52 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<form method="post">
    <caption>Edit coupon</caption>
    <table>
        <c:if test="${requestScope.coupon != null}">
            <input type="hidden" name="id" value="<c:out value="${coupon.id}"/>"/>
        </c:if>
        <tr>
            <th>NAME</th>
            <td></td>
        </tr>
        <tr>
            <th>VALUE</th>
            <td></td>
        </tr>
        <tr>
            <th>IS_ACTIVE</th>
            <td><input type="text" name="name" id="name" value=""/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
