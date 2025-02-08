<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách sản phẩm</title>
  <!-- Thêm Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    /* Headline */
    .headline {
      background-color: #f9f9f9;
      border-bottom: 1px solid #ddd;
      padding: 15px 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .headline .logo {
      display: flex;
      align-items: center;
    }
    .headline .logo img {
      max-height: 70px; /* Tăng chiều cao logo */
      margin-right: 15px;
    }
    .headline .search-bar {
      flex: 1;
      margin: 0 20px;
    }
    .headline .search-bar input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
    .headline .right {
      display: flex;
      align-items: center;
    }
    .headline .right a {
      text-decoration: none;
      color: #555;
      margin-left: 20px;
      font-size: 14px;
    }
    .headline .right a i {
      margin-right: 5px;
    }

    /* Product Card */
    .product-card {
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      text-align: center;
      background-color: #fff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
    }
    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    }
    .product-card img {
      max-width: 100%;
      height: auto;
      border-radius: 5px;
      margin-bottom: 15px;
    }
    .product-title {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .product-price {
      color: #f44336;
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .product-description {
      font-size: 14px;
      color: #555;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<!-- Headline -->
<div class="headline">
  <div class="logo">
    <img src="${pageContext.request.contextPath}/images/logoshop.jpeg" alt="Logo">
  </div>
  <div class="search-bar">
    <input type="text" placeholder="Nhập từ khóa cần tìm">
  </div>
  <div class="right">
    <a href="#"><i class="bi bi-person"></i> Đăng nhập / Đăng ký</a>
    <a href="#"><i class="bi bi-bell"></i></a>
    <a href="#"><i class="bi bi-cart"></i> Giỏ hàng của bạn</a>
  </div>
</div>

<!-- Danh sách sản phẩm -->
<div class="container my-4">
  <div class="row">
    <c:forEach var="product" items="${products}">
      <div class="col-md-3 mb-4">
        <div class="product-card">
          <img src="${product.imageURL}" alt="${product.name}">
          <h5 class="product-title">${product.name}</h5>
          <p class="product-price">${product.price}₫</p>
          <p>Số lượng: ${product.stock}</p>
          <p class="product-description">${product.description}</p>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
