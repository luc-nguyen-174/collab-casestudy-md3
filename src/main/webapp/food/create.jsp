<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<form method="post">
  <table border="1" cellpadding="5">
    <caption><h2>Add New Food</h2></caption>
    <tr>
      <th>Food Name</th>
      <td>
        <input type="text" name="name" id="name" size="45">
      </td>
      <td>
        <input type="text" name="price" id="price" size="45">
      </td>
      <td>
        <input type="text" name="detail" id="detail" size="45">
      </td>
      <td>
        <input type="text" name="img_link" id="img_link" size="45">
      </td>
      <td>
        <input type="text" name="merchant_id" id="food_name" size="45">
      </td>

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
