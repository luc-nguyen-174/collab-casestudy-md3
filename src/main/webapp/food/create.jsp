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
                <th>Food ID</th>
                <td>
                    <input type="text" name="id" id="id" size="45">
                </td>
            </tr>
            <tr>
                <th>Food Name</th>
                <td>
                    <input type="text" name="name" id="name" size="45">
                </td>
            </tr>
            <tr>
                <th>Food Price</th>
                <td>
                    <input type="text" name="price" id="price" size="45">
                </td>
            </tr>
            <tr>
                <th>Food Details</th>
                <td>
                    <input type="text" name="detail" id="detail" size="45">
                </td>
            </tr>
            <tr>
                <th>Food Image</th>
                <td>
                    <input type="text" name="img_link" id="img_link" size="45">
                </td>
            </tr>
            <tr>
                <th>Merchant</th>
                <td>
                    <input type="text" name="merchant_id" id="merchant_id" size="45">
                </td>
            </tr>
            <tr>
                <th>Certificate</th>

                <td>
                    <%--                    <input type="text" name="certificate" id="certificate" size="45">--%>
                    <select name="certificate">
                        <option name="certificate" value="1">True</option>
                        <option name="certificate" value="0">False</option>
                    </select>
                </td>

            </tr>
            <tr>
                <th>Active?</th>
                <td>
                    <%--                    <input type="text" name="is_active" id="merchant_id" size="45">--%>
                    <select name="is_active">
                        <option name="is_active" value="1">True</option>
                        <option name="is_active" value="0">False</option>
                    </select>
                </td>
            </tr>
            <tr>
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
