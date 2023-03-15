<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 15/03/2023
  Time: 12:52 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new coupon</title>
</head>
<body>
<center>
    <h1>Create</h1>
</center>
<div>
    <form method="post">
        <table border="1">
            <caption><h2>Create new coupon</h2></caption>
            <tr>
                <th>ID</th>
                <td>
                    <input type="text" name="id" id="id">
                </td>
            </tr>
            <tr>
                <th>NAME</th>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <th>VALUE</th>
                <td><input type="text" name="value" id="value"></td>
            </tr>
            <tr>
                <th>IS_ACTIVE</th>
                <td>
                    <select name="is_active">
                        <option name="is_active" value="1">True</option>
                        <option name="is_active" value="0">False</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                    <a href="/coupon">Back To List Coupon</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
