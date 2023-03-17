<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 16/03/2023
  Time: 02:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<p>
    <c:if test="${message != null}">
<h2 class="message">${message}</h2>
</c:if>
</p>
<h2>
    <a href="<c:url value="/cart"/>">Back To List</a>
</h2>
<form method="post">
    <table border="1" cellpadding="5">
        <c:if test="${cart != null}">
            <input type="hidden" name="id" value="<c:out value='${food.id}'/>"/>
        </c:if>
        <tr>
            <th>Card ID</th>
            <td>
                <input type="text" name="id" id="id" size="45"
                       value="<c:out value='${cart.id}'/>">
            </td>
        </tr>
        <tr>
            <th>Food Quantity</th>
            <td>
                <input type="text" name="quantity" id="quantity" size="45"
                       value="<c:out value='${cart.quantity}'/>">
            </td>
        </tr>
        <tr>
            <th>Food Name</th>
            <td>

                <input type="text" name="food_id" id="food_id" size="45"
                       value="<c:out value='${cart.food.id}'/>">

            </td>
        </tr>
        <tr>
            <th>Coupon</th>
            <td>
                <input type="text" name="coupon_id" id="coupon_id" size="45"
                       value="<c:out value='${cart.coupon.id}'/>">
            </td>
        </tr>
        <tr>
            <th>User</th>
            <td>
                <input type="text" name="user_id" id="user_id" size="45"
                       value="<c:out value='${cart.user.id}'/>">
            </td>
        </tr>
        <tr>
            <th>Available</th>
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
        </tr>
    </table>
</form>
</body>
</html>
