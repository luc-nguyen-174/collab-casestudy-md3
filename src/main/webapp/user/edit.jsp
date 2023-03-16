<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 13/03/2023
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<form method="post">
    <caption>Edit user</caption>
    <table>
        <c:if test="${requestScope.user !=null}">
            <input type="hidden" name="id" value="<c:out value="${user.id}"/>"/>
        </c:if>
        <tr>
            <th>NAME</th>
            <td><input type="text" name="name" id="name" value="<c:out value="${user.name}"/>"/></td>
        </tr>
        <tr>
            <th>EMAIL</th>
            <td><input type="text" name="email" id="email" value="<c:out value="${user.email}"/>"/></td>
        </tr>
        <tr>
            <th>PHONE</th>
            <td><input type="text" name="phone" id="phone" value="<c:out value="${user.phone}"/>"/></td>
        </tr>
        <tr>
            <th>ADDRESS</th>
            <td><input type="text" name="address_id" id="address_id" value="<c:out value="${user.address.id}"/>"/></td>
        </tr>
        <tr>
            <th>IS_ACTIVE</th>
            <td>
                <select name="is_active">
                    <c:forEach var="option" items="${{'True': 'true', 'False': 'false'}}">
                        <option value="${option.value}">${option.key}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
            <td><a href="/user">Back to list user</a></td>
        </tr>
    </table>
</form>
</body>
</html>
