<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new user</title>
</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption><h2>Add New User</h2></caption>
        <tr>
            <th> Id</th>
            <td>
                <input type="text" name="id" id="id" size="45">
            </td>
        </tr>
        <tr>
            <th> Username</th>
            <td><input type="text" name="username" id="username" size="45"></td>
        </tr>
        <tr>
            <th> Password</th>
            <td><input type="text" name="password" id="password" size="45"></td>
        </tr>
        <tr>
            <th> Name</th>
            <td><input type="text" name="name" id="name" size="45"></td>
        </tr>
        <tr>
            <th> Email</th>
            <td><input type="text" name="email" id="email" size="45"></td>
        </tr>
        <tr>
            <th> Phone</th>
            <td><input type="text" name="phone" id="phone" size="45"></td>
        </tr>
        <tr>
            <th> Address</th>
            <td><input type="text" name="address_id" id="address_id" size="45"></td>
        </tr>
        <tr>
            <th> Status</th>
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
                <a href="/user">Back To List Coupon</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
