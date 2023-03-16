<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 15/03/2023
  Time: 22:25
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
    <c:if test='${"message" != null}'>
<h2 class="message">${message}</h2>
</c:if>
</p>
<div>
    <form method="post">
        <table border="1" cellpadding="5">
            <caption><h2>Add New Food</h2></caption>
            <tr>
                <th>Cart ID</th>
                <td>
                    <input type="text" name="id" id="id" size="45">
                </td>
            </tr>

            <tr>
                <th>Quantity</th>
                <td>
                    <input type="number" name="quantity" id="quantity" size="45">
                </td>
            </tr>

            <tr>
                <th>Food Name</th>
                <td>
                    <input type="text" name="food_id" id="food_id" size="45">
                </td>
            </tr>

            <tr>
                <th>Coupon</th>
                <td>
                    <input type="text" name="coupon" id="coupon" size="45">
                </td>
            </tr>

            <tr>
                <th>User</th>
                <td>
                    <input type="text" name="user_id" id="user_id">
                </td>
            </tr>

            <tr>
                <th>Active?</th>
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
                    <a href="/food">Back To List Food</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>