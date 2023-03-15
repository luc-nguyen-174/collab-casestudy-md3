<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/14/2023
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, td {
            border: 2px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h2>Merchant Information</h2>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["merchant"].getName()}</td>
    </tr>
    <tr>
        <td>Age: </td>
        <td>${requestScope["merchant"].getAge()} </td>
    </tr>
    <tr>
        <td>ID Card: </td>
        <td>${requestScope["merchant"].getId_number()} </td>
    </tr>
    <tr>
        <td>Address: </td>
        <td>${requestScope["merchant"].getAddress()} </td>
    </tr>
    <tr>
        <td>Phone: </td>
        <td>${requestScope["merchant"].getPhone()} </td>
    </tr>
    <tr>
        <td>Email: </td>
        <td>${requestScope["merchant"].getEmail()} </td>
    </tr>
</table>
</body>
</html>
