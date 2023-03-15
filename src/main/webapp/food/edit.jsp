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
<p>
    <c:if test="${message != null}">
<h2 class="message">${message}</h2>
</c:if>
</p>
<h2>
    <a href="/food">Back To List</a>
</h2>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>Edit Food</caption>
        <c:if test="${food != null}">
            <input type="hidden" name="id" value="<c:out value='${food.id}'/>"/>
        </c:if>
        <tr>
            <th>Food Name</th>
            <td>
                <input type="text" name="name" id="name" size="45"
                       value="<c:out value='${food.name}'/>">
            </td>
        </tr>
        <tr>
            <th>Price</th>
            <td><input type="text" name="price" id="price" size="45"
                       value="<c:out value='${food.price}'/>">
            </td>
        </tr>
        <tr>
            <th>Details</th>
            <td><input type="text" name="detail" id="detail" size="45"
                       value="<c:out value='${food.detail}'/>">
            </td>
        </tr>
        <tr>
            <th>Image</th>
            <td><input type="text" name="img_link" id="img_link" size="45"
                       value="<c:out value='${food.img_link}'/>">
            </td>
        </tr>
        <tr>
            <th>Merchant</th>
            <td><input type="text" name="merchant_id" id="merchant_id" size="45"
                       value="<c:out value='${food.merchant.id}'/>">
            </td>
        </tr>
        <tr>
            <th>Certificate</th>
            <td>
<%--                <input type="text" name="certificate" id="certificate" size="45">--%>
                <select name="certificate">
                    <c:forEach var="option" items="${{'True': 'true', 'False': 'false'}}">
                        <option value="${option.value}">${option.key}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>Active?</th>
            <td>
                <%--                    <input type="text" name="is_active" id="merchant_id" size="45">--%>
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
        </tr>
    </table>
</form>
</body>
</html>
