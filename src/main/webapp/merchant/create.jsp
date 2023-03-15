<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption><h2>Add New Merchant</h2></caption>
        <tr>
            <td>ID: </td>
            <td><input type="text" name="id" id="id" size="45"></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" id="name" size="45"></td>
        </tr>
        <tr>
            <td>Age: </td>
            <td><input type="text" name="age" id="age" size="45"></td>
        </tr>
        <tr>
            <td>ID card: </td>
            <td><input type="text" name="id_number" id="id_number" size="45"></td>
        </tr>
        <tr>
            <td>Address: </td>
            <td><select name="address_id">
                <option value="1">Ba Đình</option>
                <option value="2">Bắc Từ Liêm</option>
                <option value="3">Cầu Giấy</option>
                <option value="4">Đống Đa</option>
                <option value="5">Hà Đông</option>
                <option value="6">Hai Bà Trưng</option>
                <option value="7">Hoàn Kiếm</option>
                <option value="8">Hoàng Mai</option>
                <option value="9">Long Biên</option>
                <option value="10">Nam Từ Liêm</option>
                <option value="11">Tây Hồ</option>
                <option value="12">Thanh Xuân</option>
            </select>
            </td>
        </tr>
        <tr>
            <td>Phone: </td>
            <td><input type="text" name="phone" id="phone" size="45"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="text" name="email" id="email" size="45"></td>
        </tr>
        <tr>
            <th>Active?</th>
            <td><select name="is_active">
                    <c:forEach var="option" items="${{'True': 'true', 'False': 'false'}}">
                        <option value="${option.value}">${option.key}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
                <a href="/merchants">Back To List Merchant</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
