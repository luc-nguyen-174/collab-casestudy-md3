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
            <h3>Merchant Information</h3>
        </caption>
        <tr>
            <td>Id:</td>
            <td><c:out value="${merchant.id}"/></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><c:out value="${merchant.name}"/></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><c:out value="${merchant.age}"/></td>
        </tr>
        <tr>
            <td>ID card</td>
            <td><c:out value="${merchant.id_number}"/></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><c:out value="${merchant.address.address_name}"/></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><c:out value="${merchant.phone}"/></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><c:out value="${merchant.email}"/></td>
        </tr>
    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Delete merchant"></td>
            <td><a href="/merchants">Back to list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
