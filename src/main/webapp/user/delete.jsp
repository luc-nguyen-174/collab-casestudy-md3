<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DISABLE USER</title>
</head>
<body>
<form method="post">
    <table border="1">
        <caption>
            <h2>Disable user</h2>
        </caption>
        <tr>
            <td>ID</td>
            <td><c:out value="${user.id}"/></td>
        </tr>
        <tr>
            <td>NAME</td>
            <td><c:out value="${user.name}"/></td>
        </tr>
        <tr>
            <td>EMAIL</td>
            <td><c:out value="${user.email}"/></td>
        </tr>
        <tr>
            <td>PHONE</td>
            <td><c:out value="${user.phone}"/></td>
        </tr>
        <tr>
            <td>ADDRESS</td>
            <td><c:out value="${user.address_id}"/></td>
        </tr>
    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Delete user"></td>
            <td><a href="/user">Back to list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
