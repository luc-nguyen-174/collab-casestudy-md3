<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create New Merchant</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Create New Merchant</h2>
    <form method="post">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id">
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="text" class="form-control" id="age">
        </div>
        <div class="form-group">
            <label for="id_number">ID card:</label>
            <input type="text" class="form-control" id="id_number">
        </div>
        <div class="form-group">
            <label for="province">Province:</label>
            <select class="form-control" id="province" name="address_id">
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
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" class="form-control" id="phone">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email">
        </div>
        <div class="form-group">
            <label for="email">Active:</label>
            <select class="form-control" name="is_active">
                <c:forEach var="option" items="${{'True': 'true', 'False': 'false'}}">
                    <option value="${option.value}">${option.key}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Create Merchant</button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
