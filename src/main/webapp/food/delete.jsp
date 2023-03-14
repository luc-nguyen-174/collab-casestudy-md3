<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 14/03/2023
  Time: 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <c:if test='${message != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>
            <h2>
                Disable
            </h2>
            <h3>Food Information</h3>
        </caption>
        <tr>
            <td>Food Id:</td>
            <td><c:out value="${food.id}"/></td>
        </tr>
        <tr>
            <td>Food Name:</td>
            <td><c:out value="${food.name}"/></td>
        </tr>
        <tr>
            <td>Food Price:</td>
            <td><c:out value="${food.price}"/></td>
        </tr>
        <tr>
            <td>Food Image:</td>
            <td><c:out value="${food.img_link}"/></td>
        </tr>

    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Delete employee"></td>
            <td><a href="/food">Back to list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
