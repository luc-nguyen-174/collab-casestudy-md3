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
<h2>
    <a href="/food">List All Users</a>
</h2>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Food Information</h2>
            </caption>
            <tr>
                <td>Food ID:</td>
                <td>${food.id}</td>
            </tr>
            <tr>
                <td>Food Name:</td>
                <td>${food.name}</td>
            </tr>
            <tr>
                <td>Food Price:</td>
                <td>${food.price}</td>
            </tr>
            <tr>
                <td>Food Details:</td>
                <td>${food.detail}</td>
            </tr>
            <tr>
                <td>Food Image:</td>
                <td><img src="${food.img_link}" alt="food_image"></td>
            </tr>
            <tr>
                <td>Merchant:</td>
                <td>${food.merchant.name}</td>
            </tr>
            <tr>
                <td>Certificate:</td>
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
            </tr>
            <tr>
                <td>Active:</td>
                <td>
                    <c:choose>
                        <c:when test="${food.is_active}">
                            <p>Food Available<p>
                        </c:when>
                        <c:otherwise>
                            <p>Do Not Available</p>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
