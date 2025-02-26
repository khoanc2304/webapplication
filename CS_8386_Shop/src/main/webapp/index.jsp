<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Toàn bộ trang */
        body {
            background-color: #f4f4f4;
            text-align: center;
        }

        /* Header trên cùng */
        .header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 50px;
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo img {
            height: 80px;
            width: 100px;}

        .search-box {
            display: flex;
            align-items: center;
            background: #f1f1f1;
            padding: 8px 12px;
            border-radius: 20px;
            width: 400px;
        }

        .search-box input {
            border: none;
            outline: none;
            background: transparent;
            flex: 1;
            font-size: 14px;
        }

        .search-box button {
            border: none;
            background: transparent;
            cursor: pointer;
        }

        .header-links {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .header-links a {
            text-decoration: none;
            color: #555;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .header-links a:hover {
            color: #007bff;
        }

        .icon {
            font-size: 18px;
        }

        /* Banner */
        .banner {
            width: 100%;
            margin-bottom: 20px;
        }

        .banner img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px;
        }

        /* Menu ngang */
        .navbar {
            width: 100%;
            background: linear-gradient(135deg, #007bff, #6610f2);
            display: flex;
            justify-content: center;
            padding: 15px 0;
            position: sticky;
            top: 60px;
            z-index: 999;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .navbar ul li {
            position: relative;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 12px 20px;
            transition: 0.3s;
            display: block;
        }

        .navbar ul li a:hover {
            color: #ffdd57;
            text-decoration: underline;
        }

        /* Dropdown menu */
        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            min-width: 200px;
            left: 0;
            text-align: left;
            padding: 10px;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .dropdown-content a:hover {
            background: #007bff;
            color: white;
        }

        .product-section {
            width: 90%;
            margin: auto;
            margin-top: 20px;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .product-card {
            background: white;
            width: 260px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            padding: 10px;
            text-align: left;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .product-info {
            padding: 10px;
        }

        .product-name {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #d0021b;
            margin: 5px 0;
        }

        .buy-button {
            display: block;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            background: #ff6f00;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        .buy-button:hover {
            background: #e65c00;
        }
    </style>
</head>
<body>

<!-- Header trên cùng -->
<div class="header">
    <div class="logo">
        <img src="https://scontent.fhan20-1.fna.fbcdn.net/v/t1.15752-9/482009393_1164245665249072_9144446867954694656_n.jpg?stp=dst-jpg_s480x480_tt6&_nc_cat=102&ccb=1-7&_nc_sid=0024fc&_nc_ohc=Z9iJkTFn7MkQ7kNvgGJdczT&_nc_oc=AdguTyKhOrheDkfw-B593jxxjUZO_hWyCLCxu-rg8Cd3iocVUM1ruP1WHEIjOzu4lw0&_nc_zt=23&_nc_ht=scontent.fhan20-1.fna&oh=03_Q7cD1gF6pwYPwgjnoLtPrixyPoOx9QnqE-UVNCffVzyI-ngUhQ&oe=67E6AA0F" alt="Logo">
    </div>

    <div class="search-box">
        <input type="text" placeholder="Nhập từ khóa cần tìm">
        <button><span class="icon">🔍</span></button>
    </div>

    <div class="header-links">
        <a href="#"><span class="icon">👤</span> Đăng nhập / Đăng ký</a>
        <a href="#"><span class="icon">🔔</span> Thông báo</a>
        <a href="#"><span class="icon">🛒</span> Giỏ hàng (0 sản phẩm)</a>
    </div>
</div>

<!-- Banner -->
<div class="banner">
    <img src="https://lh3.googleusercontent.com/XzEGUfZGwNS9A4Yymq0Gf-fgbZylEv3lw_GJoV4t-fVnL6_aRLFsdUfHNn12YLBH48n-iUX0wFOQY6adZnCGzsIQVv8aTgc=w1920-rw" alt="Banner quảng cáo">
</div>

<!-- Menu ngang -->
<nav class="navbar">
    <ul>
        <li><a href="#">Trang chủ</a></li>
        <li><a href="#">iPhone</a></li>
        <li><a href="#">Samsung</a></li>
        <li><a href="#">Laptop</a></li>
        <li><a href="#">Phụ kiện</a></li>
        <li class="dropdown">
            <a href="#">Khoảng giá ⬇</a>
            <div class="dropdown-content">
                <a href="#">Dưới 2 triệu</a>
                <a href="#">2 - 5 triệu</a>
                <a href="#">5 - 10 triệu</a>
                <a href="#">10 - 20 triệu</a>
                <a href="#">20 - 50 triệu</a>
                <a href="#">Trên 50 triệu</a>
            </div>
        </li>
        <li><a href="#">Liên hệ</a></li>
    </ul>
</nav>
<!-- Danh sách sản phẩm -->
<div class="product-section">
    <h2 style="text-align:center;">Danh sách sản phẩm</h2>
    <div class="product-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <img src="${product.imageURL}" alt="Product Image" class="product-img">
                <div class="product-info">
                    <p class="product-name">${product.name}</p>
                    <p class="product-price">Giá:
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="" groupingUsed="true" /> VNĐ
                    </p>
                    <a href="product?action=view&productID=${product.productID}" class="buy-button">Mua ngay</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
