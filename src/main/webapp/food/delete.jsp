<%--
  Created by IntelliJ IDEA.
  User: vipqk
  Date: 14/03/2023
  Time: 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>
            <h2>
                Delete User
            </h2>
            <h3>Food Information</h3>
        </caption>
        <tr>
            <td>Food Name:</td>
            <td>${employee.name}</td>
        </tr>
        <tr>
            <td>Employee ID Card Number:</td>
            <td>${employee.id_number}</td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td>${employee.phone}</td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>${employee.address}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${employee.email}</td>
        </tr>
        <tr>
            <td>Note:</td>
            <td>${employee.note}</td>
        </tr>
    </table>
    <table>
        <h3>Are you sure?</h3>
        <tr>
            <td><input type="submit" value="Delete employee"></td>
            <td><a href="/employees">Back to customer list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
