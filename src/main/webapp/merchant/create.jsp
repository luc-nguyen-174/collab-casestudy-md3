<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption><h2>Add New Merchant</h2></caption>
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
            <td><input type="text" name="address" id="address" size="45"></td>
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
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
