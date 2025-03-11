<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>8386 Shop - Laptop & PC</title>

    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: #f0f2f5;
            color: #212529;
            overflow-x: hidden;
        }

        /* Header */
        .header {
            background: linear-gradient(90deg, #007bff, #00c4ff);
            padding: 1rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            position: sticky;
            top: 0;
            z-index: 1030;
        }

        .header .logo img {
            height: 70px;
            transition: transform 0.3s ease;
            border-radius: 20px;
        }

        .header .logo img:hover {
            transform: scale(1.1);
        }

        .search-box {
            display: flex;
            align-items: center;
            background: #ffffff;
            padding: 10px 20px;
            border-radius: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 400px;
            transition: all 0.4s ease;
        }

        .search-box input {
            border: none;
            outline: none;
            background: transparent;
            font-size: 16px;
            width: 100%;
            color: #333;
        }

        .search-box button {
            background: none;
            border: none;
            font-size: 18px;
            color: #2a5298;
            cursor: pointer;
            transition: color 0.3s;
        }

        .search-box button:hover {
            color: #ff6f00; /* Màu cam nổi bật khi hover */
        }

        .search-box:focus-within {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 450px;
        }


        .nav-links .nav-link {
            color: #fff;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .nav-links .nav-link:hover {
            background: rgba(255, 255, 255, 0.25);
            color: #fff;
        }

        .cart-badge {
            background: #ff2d55;
            font-size: 12px;
            width: 22px;
            height: 22px;
            line-height: 22px;
        }



        .banner-wrapper {
            padding: 0; /* Xóa padding để banner full width */
            margin: 2rem 0;
            width: 100%; /* Đảm bảo full width */
        }

        .banner-container {
            height: 500px; /* Tăng chiều cao để trông đẹp hơn */
            border-radius: 0; /* Xóa border-radius để full width */
            overflow: hidden;
            box-shadow: none; /* Xóa shadow để phù hợp với full width */
            width: 100%; /* Full width */
        }

        .carousel-item img {
            height: 100%;
            width: 100%; /* Đảm bảo ảnh full width */
            object-fit: cover; /* Giữ tỷ lệ ảnh */
            transition: transform 0.6s ease;
        }

        .carousel-item:hover img {
            transform: scale(1.05);
        }

        .carousel-caption {
            background: rgba(0, 0, 0, 0.6);
            border-radius: 15px;
            padding: 1.5rem;
            bottom: 20%;
            left: 5%; /* Giảm left để gần mép trái hơn */
            right: auto;
            text-align: left;
            transform: translateY(0);
            max-width: 40%; /* Giới hạn chiều rộng của caption */
        }

        .carousel-caption h5 {
            font-size: 2rem; /* Tăng kích thước chữ cho nổi bật */
            margin-bottom: 0.75rem;
        }

        .carousel-caption p {
            font-size: 1.25rem; /* Tăng kích thước chữ */
            margin-bottom: 1.5rem;
        }

        .carousel-control-prev, .carousel-control-next {
            width: 5%;
            opacity: 0.8;
        }

        .carousel-control-prev-icon, .carousel-control-next-icon {
            font-size: 2.5rem; /* Tăng kích thước mũi tên */
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.3));
        }

        /* Sidebar */
        .sidebar {
            background: #fff;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        }

        .sidebar h3 {
            font-size: 1.3rem;
            font-weight: 700;
            color: #007bff;
            margin-bottom: 1rem;
        }

        .sidebar .list-group-item {
            border: none;
            padding: 0.8rem 0;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .sidebar .list-group-item:hover {
            color: #ff2d55;
            padding-left: 0.5rem;
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
            gap: 1.5rem;
        }

        .product-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .product-img {
            height: 220px;
            object-fit: contain;
            padding: 1rem;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-img {
            transform: scale(1.1);
        }

        .product-name {
            font-size: 1.1rem;
            font-weight: 500;
            height: 50px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .btn-buy {
            background: #ff2d55;
            border: none;
            border-radius: 25px;
            padding: 0.6rem 1.5rem;
        }

        .btn-cart {
            background: #007bff;
            border: none;
            border-radius: 25px;
            padding: 0.6rem 1.5rem;
        }

        /* Footer */
        footer {
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            color: #fff;
            padding: 3rem 0;
        }

        footer h6 {
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #fff;
        }

        footer a {
            color: #e5e7eb;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #ff2d55;
        }

        /* Back to Top */
        .back-to-top {
            background: #ff2d55;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            line-height: 50px;
            text-align: center; /* Căn giữa icon */
            color: #fff; /* Đảm bảo icon trắng để nổi trên nền đỏ */
            position: absolute; /* Đổi sang absolute để nằm trong footer */
            bottom: 20px; /* Khoảng cách từ dưới footer */
            right: 20px; /* Khoảng cách từ mép phải footer */
            transition: opacity 0.3s ease; /* Thêm hiệu ứng mượt mà */
            z-index: 1000; /* Đảm bảo nút luôn nằm trên cùng */
        }

        /* Điều chỉnh footer để chứa back-to-top */
        footer {
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            color: #f8f9fa;
            padding: 30px 0;
        }

        footer h6 {
            font-size: 1rem;
            margin-bottom: 15px;
        }

        footer ul {
            padding: 0;
        }

        footer ul li {
            list-style: none;
            margin-bottom: 8px;
        }

        footer ul li a {
            color: #bbb;
            text-decoration: none;
            transition: color 0.3s;
        }

        footer ul li a:hover {
            color: #007bff;
            text-decoration: underline;
        }

        footer .border-top {
            border-color: rgba(255, 255, 255, 0.2) !important;
        }
        .text-center img{
            height: 50px;
            border-radius: 50px;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="header py-3">
    <div class="container d-flex align-items-center justify-content-between">
        <a href="#" class="logo">
            <img src="https://scontent.fdad3-5.fna.fbcdn.net/v/t1.15752-9/480148661_9011683048954377_8966679042114836256_n.jpg?stp=dst-jpg_s480x480_tt6&_nc_cat=109&ccb=1-7&_nc_sid=0024fc&_nc_ohc=59i_wTGvZt4Q7kNvgG1OR4k&_nc_oc=Adi6BVy88iPaGJmoV-DO0OWECBCkY2Ty_kHigT43IS5jeouOT48j6PAGtKjHEXj1ChwxMaUAoPUWa54FCMJEmz4z&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent.fdad3-5.fna&oh=03_Q7cD1gF0WgRyL1OUp36J4UCDBM0YKOuIuydm1fDlCT8VluNHYw&oe=67E81504" alt="8386 Shop Logo">
        </a>
        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm sản phẩm...">
            <button><i class="fas fa-search"></i></button>
        </div>

        <nav class="nav-links d-flex align-items-center gap-2">
            <a href="loginPage.jsp" class="nav-link"><i class="fas fa-user me-1"></i> Đăng Nhập</a>
            <a href="#" class="nav-link"><i class="fas fa-bell me-1"></i> Thông báo</a>
            <a href="#" class="nav-link position-relative">
                <i class="fas fa-shopping-cart me-1"></i> Giỏ hàng
                <span class="cart-badge rounded-circle">2</span>
            </a>
            <a href="#" class="nav-link"><i class="fas fa-headset me-1"></i> Hỗ trợ</a>
        </nav>
    </div>
</header>


<!-- Main Banner -->
<div class="banner-wrapper">
    <div id="bannerCarousel" class="carousel slide banner-container" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://lh3.googleusercontent.com/XMWKvitNn26gbTYdrH59rfSTTF-dOwmBptwOrOVfEVc2-lBgBu_-1Cyj8hh7yqQP7xrVFhdzi3Xk4zc4c3vRFVOmcKbiMW4=w1920-rw" alt="Banner 1" class="d-block w-100">

            </div>
            <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/pltIM3Eop8tAJTrz3jvGv0qCnMbnQs3EcasTdB96zdCxHu-ORTgpnAO-f0b1y_dh1Qv538RUg_sN47c7OBbwoBQBXHxfUF49=w1920-rw" alt="Banner 2" class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="https://lh3.googleusercontent.com/gVSB0hwR3PPffHSS8AFdHY-hmyooxWgDENN1rb_waJwfKGg7omvKuAcf9kZM0z8ssRNaGQOnecJzT1b05TTa_0IrxKkLOzK2=w1920-rw" alt="Banner 3" class="d-block w-100">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<!-- Main Content -->
<div class="container my-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-lg-3">
            <div class="sidebar" data-aos="fade-right">
                <h3>Danh mục sản phẩm</h3>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-laptop me-2"></i> Laptop</a>
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-desktop me-2"></i> PC Gaming</a>
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-keyboard me-2"></i> Phụ kiện</a>
                </div>
                <h3 class="mt-4">Khoảng giá</h3>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-money-bill-wave me-2"></i> 2 - 5 triệu</a>
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-money-bill-wave me-2"></i> 5 - 10 triệu</a>
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-money-bill-wave me-2"></i> 10 - 20 triệu</a>
                    <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-money-bill-wave me-2"></i> 20 - 30 triệu</a>
                </div>
            </div>
        </div>

        <!-- Product List -->
        <div class="col-lg-9">
            <h2 class="mb-4 fw-bold text-primary" data-aos="fade-left">Sản phẩm nổi bật</h2>
            <div class="product-grid">
                <c:forEach var="product" items="${products}">
                    <div class="product-card card h-100" data-aos="zoom-in">
                        <img src="${product.imageURL}" class="product-img card-img-top" alt="${product.name}">
                        <div class="card-body text-center">
                            <h5 class="product-name card-title">${product.name}</h5>
                            <p class="card-text text-danger fw-bold">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="" groupingUsed="true" /> VNĐ
                            </p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="product-detail?productID=${product.productID}" class="btn btn-buy text-white">Mua ngay</a>
                                <a href="#" class="btn btn-cart text-white"><i class="fas fa-cart-plus me-1"></i> Giỏ hàng</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Pagination -->
<div class="container my-4">
    <nav aria-label="Page navigation" class="d-flex justify-content-center">
        <ul class="pagination pagination-lg">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">«</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">»</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<!-- Footer -->
<footer class="bg-dark text-light mt-5 pt-4 pb-2">
    <div class="container">
        <div class="row">
            <!-- Hỗ trợ khách hàng -->
            <div class="col-md-3">
                <h6 class="fw-bold text-uppercase">Hỗ trợ Khách hàng</h6>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Thẻ ưu đãi</a></li>
                    <li><a href="#" class="text-light">Hướng dẫn mua online</a></li>
                    <li><a href="#" class="text-light">Ưu đãi doanh nghiệp</a></li>
                    <li><a href="#" class="text-light">Chính sách trả góp</a></li>
                    <li><a href="#" class="text-light">Dịch vụ sửa chữa</a></li>
                </ul>
            </div>

            <!-- Chính sách mua hàng -->
            <div class="col-md-3">
                <h6 class="fw-bold text-uppercase">Chính sách mua hàng</h6>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Điều kiện giao dịch</a></li>
                    <li><a href="#" class="text-light">Chính sách bảo hành</a></li>
                    <li><a href="#" class="text-light">Chính sách đổi trả</a></li>
                    <li><a href="#" class="text-light">Chính sách bảo mật</a></li>
                    <li><a href="#" class="text-light">Quy định đặt cọc</a></li>
                </ul>
            </div>

            <!-- Thông tin về cửa hàng -->
            <div class="col-md-3">
                <h6 class="fw-bold text-uppercase">Thông tin 8386 Shop</h6>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Giới thiệu 8386 Shop</a></li>
                    <li><a href="#" class="text-light">Hệ thống cửa hàng</a></li>
                    <li><a href="#" class="text-light">Trung tâm bảo hành</a></li>
                    <li><a href="#" class="text-light">Hỏi đáp</a></li>
                    <li><a href="#" class="text-light">Tuyển dụng</a></li>
                </ul>
            </div>

            <!-- Liên hệ -->
            <div class="col-md-3">
                <h6 class="fw-bold text-uppercase">Liên hệ</h6>
                <ul class="list-unstyled">
                    <li>Email: <a href="mailto:cskh@8386shop.vn" class="text-light">cskh@8386shop.vn</a></li>
                    <li>Hotline: <a href="tel:18006867" class="text-light">18006867</a></li>
                    <li>Facebook: <a href="#" class="text-light">8386 Shop</a></li>
                    <li>Zalo: <a href="#" class="text-light">OA 8386 Shop</a></li>
                </ul>
            </div>
        </div>

        <!-- Phương thức thanh toán -->
        <div class="text-center mt-4">
            <h6 class="fw-bold text-uppercase">Phương thức thanh toán</h6>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqTUF7qFMSIVVx1kJ7OIvLlIcX_g9E36llUg&s" alt="Phương thức thanh toán" class="img-fluid" style="max-width: 300px;">
        </div>

        <!-- Bản quyền -->
        <div class="text-center mt-3 border-top pt-3">
            <p class="mb-0 text-light">&copy; 1997 - 2024 CÔNG TY CỔ PHẦN THƯƠNG MẠI - DỊCH VỤ 8386 SHOP. All Rights Reserved.</p>
        </div>
    </div>
</footer>

<!-- Back to Top -->
<a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true
    });

    window.addEventListener('scroll', () => {
        const header = document.querySelector('.header');
        header.classList.toggle('shadow-lg', window.scrollY > 0);

        const backToTop = document.querySelector('.back-to-top');
        const footer = document.querySelector('footer');
        const footerTop = footer.getBoundingClientRect().top;

        // Hiển thị nút khi footer xuất hiện trong viewport
        if (footerTop < window.innerHeight) {
            backToTop.style.opacity = '1';
        } else {
            backToTop.style.opacity = '0';
        }
    });

    document.querySelector('.back-to-top').addEventListener('click', (e) => {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>
</body>
</html>