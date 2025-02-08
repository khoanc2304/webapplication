<!DOCTYPE html>
<html lang="vi">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
<div class="card shadow p-4" style="width: 350px;">
    <h3 class="text-center mb-3">Đăng nhập</h3>
    <form action="#" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tài khoản:</label>
            <input type="text" id="username" name="username" class="form-control" required placeholder="Nhập tài khoản">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" id="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <c:if test="${not empty param.error}">
        <p style="color: red;">Sai tên đăng nhập hoặc mật khẩu!</p>
    </c:if>
    <div class="text-center mt-3">
        <p>Chưa có tài khoản? <a href="#">Đăng ký</a></p>
    </div>
</div>
</body>
</html>
