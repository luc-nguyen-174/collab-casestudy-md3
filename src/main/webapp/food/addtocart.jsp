<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 17/03/2023
  Time: 02:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${food != null}">
    <input type="hidden" name="id" value="<c:out value='${food.id}'/>"/>
    <input type="hidden" name="name" value="<c:out value='${food.name}'/>"/>
    <input type="hidden" name="price" value="<c:out value='${food.price}'/>"/>
    <input type="hidden" name="detail" value="<c:out value='${food.detail}'/>"/>
    <input type="hidden" name="img_link" value="<c:out value='${food.img_link}'/>"/>
    <input type="hidden" name="merchant_id" value="<c:out value='${food.merchant_id}'/>"/>
    <input type="hidden" name="certificate" value="<c:out value='${food.certificate}'/>"/>
    <input type="hidden" name="is_active" value="<c:out value='${food.is_active}'/>"/>
</c:if>

<c:out value='${food.id}'/>
<c:out value='${food.name}'/>
<c:out value='${food.price}'/>
<c:out value='${food.detail}'/>
<c:out value='${food.img_link}'/>
<c:out value='${food.merchant_id}'/>
<c:out value='${food.certificate}'/>
<c:out value='${food.is_active}'/>
</body>
</html>
