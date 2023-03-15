<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 16/03/2023
  Time: 00:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<center>
    <h1>Food Search</h1>
    <h2>
        <a href="/food">List All Food</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <input type="text" name="food_name" size="45">
        <input type="submit" value="Search">
    </form>
    <c:if test="${foods != null}">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Food Information</h2>
            </caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Details</th>
                <th>Image</th>
                <th>Merchant</th>
                <th>Certificate</th>
            </tr>
            <c:forEach var="food" items="${foods}">
                <tr>
                    <td><c:out value="${food.id}"/></td>
                    <td><c:out value="${food.name}"/></td>

                    <td><c:out value="${food.price}"/></td>

                    <td><c:out value="${food.detail}"/></td>
                    <td>
                            <%--                <c:out value="${food.img_link}"/>--%>
                        <img src="${food.img_link}" alt="food_image" width="50" height="50">
                    </td>
                    <td><c:out value="${food.merchant.name}"/></td>
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
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>
