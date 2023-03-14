<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 14/03/2023
  Time: 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>Edit Employee</caption>
        <c:if test="${food != null}">
            <input type="hidden" name="id" value="<c:out value='${food.id}' />"/>
        </c:if>
        <tr>
            <th>Employee Code</th>
            <td>
                <input type="text" name="food_id" id="food_id" size="45"
                       value="<c:out value='${food.id}' />">
            </td>
        </tr>
        <tr>
            <th>Employee Name</th>
            <td><input type="text" name="food_name" id="food_name" size="45"
                       value="<c:out value='${food.name}' />">
            </td>
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
