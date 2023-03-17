<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 16/03/2023
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>
    <a href="/cart">List All Cart</a>
</h2>
<form action="" method="post">
    <c:if test="${cart != null}">
        <input type="hidden" name="id" value="<c:out value='${cart.id}'/>"/>

        <input type="hidden" name="quantity" value="<c:out value='${cart.quantity}'/>"/>

        <input type="hidden" name="food_id" value="<c:out value='${cart.food_id}'/>"/>

        <input type="hidden" name="coupon" value="<c:out value='${cart.coupon_id}'/>"/>

        <input type="hidden" name="user" value="<c:out value='${cart.user_id}'/>"/>
    </c:if>

</form>
</body>
</html>
