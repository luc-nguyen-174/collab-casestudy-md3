<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h2>
    <a href="/merchants">List All Merchants</a>
</h2>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Food Information</h2>
            </caption>
            <tr>
                <td>Name: </td>
                <td>${merchant.name}</td>
            </tr>
            <tr>
                <td>Age: </td>
                <td>${merchant.age} </td>
            </tr>
            <tr>
                <td>ID Card: </td>
                <td>${merchant.id_number} </td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${merchant.address.address_name} </td>
            </tr>
            <tr>
                <td>Phone: </td>
                <td>${merchant.phone} </td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${merchant.email} </td>
            </tr>
            <tr>
                <td>Active:</td>
                <td>
                    <c:choose>
                        <c:when test="${merchant.is_active}">
                            <p>Merchant Available<p>
                        </c:when>
                        <c:otherwise>
                            <p>Do Not Available</p>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
