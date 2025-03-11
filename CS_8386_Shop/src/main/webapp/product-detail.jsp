<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
  <title>8386 Shop - Chi tiết sản phẩm</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

  <style>
    /* Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Arial', sans-serif;
    }

    body {
      background-color: #f8f9fa;
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

    /* Bố cục chính */
    .main-content {
      padding-top: 100px;
    }

    .product-container {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    }

    .product-title {
      font-size: 1.8rem;
      font-weight: bold;
    }

    .price {
      font-size: 1.8rem;
      font-weight: bold;
      color: #007bff;
    }

    /* Sidebar - Chính sách bán hàng */
    .sidebar-box {
      background: white;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
      position: absolute;
      top: 100px;
    }

    .policy-list {
      list-style: none;
      padding: 0;
    }

    .policy-list li {
      padding: 5px 0;
      font-size: 0.95rem;
    }

    .policy-list a {
      text-decoration: none;
      color: #007bff;
    }

    .policy-list a:hover {
      text-decoration: underline;
    }

    /* Phần quà tặng */
    .gift-box {
      margin-top: 20px;
      padding: 15px;
      border: 2px dashed #ff4d4d;
      border-radius: 10px;
      background: #fff3f3;
    }

    .gift-box h5 {
      color: #d9534f;
      font-weight: bold;
    }

    .gift-box ul {
      list-style: none;
      padding: 0;
    }

    .gift-box ul li {
      font-size: 0.95rem;
      padding: 5px 0;
    }

    /* Logo & tên công ty */
    .company-info {
      text-align: center;
      margin-bottom: 15px;
    }

    .company-info img {
      width: 60px;
      height: auto;
      margin-bottom: 5px;
    }

    .company-info h6 {
      font-weight: bold;
      color: #333;
    }
    .review-container {
      margin-top: 30px;
      padding: 20px;
      background: white;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
      width: 100%;
    }

    /* Tiêu đề đánh giá */
    .review-container h5 {
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 15px;
    }

    /* Tổng điểm trung bình */
    .rating-summary {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 1.5rem;
      font-weight: bold;
      color: #f5c518;
    }

    .rating-summary .average-rating {
      font-size: 2.5rem;
      font-weight: bold;
    }

    /* Biểu đồ đánh giá */
    .rating-bar-container {
      display: flex;
      align-items: center;
      gap: 10px;
      margin: 5px 0;
    }

    .rating-bar {
      flex: 1;
      height: 10px;
      background: #ddd;
      border-radius: 5px;
      position: relative;
    }

    .rating-bar .filled {
      height: 100%;
      background: #f5c518;
      border-radius: 5px;
      position: absolute;
      left: 0;
    }

    /* Hộp đánh giá cá nhân */
    .review-box {
      border-bottom: 1px solid #ddd;
      padding: 15px 0;
    }

    .review-box:last-child {
      border-bottom: none;
    }

    .review-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .review-header strong {
      font-size: 1rem;
      color: #333;
    }

    .review-stars {
      color: #f5c518;
    }

    .review-comment {
      font-size: 1rem;
      color: #555;
      margin: 5px 0;
    }

    .review-date {
      font-size: 0.85rem;
      color: #777;
    }


    .review-actions button {
      padding: 10px 15px;
      font-size: 1rem;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-primary {
      background: #007bff;
      color: white;
      border: none;
    }

    .btn-outline-primary {
      background: white;
      color: #007bff;
      border: 1px solid #007bff;
    }




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
<!-- Header -->
<header class="header py-3">
  <div class="container d-flex align-items-center justify-content-between">
    <a href="${pageContext.request.contextPath}/product" class="logo">
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


<!-- Main Container -->
<div class="container main-content">
  <div class="row">
    <!-- Chi tiết sản phẩm -->
    <div class="col-lg-8">
      <div class="product-container">
        <div class="row">
          <div class="col-md-5">
            <img src="${product.imageURL}" class="img-fluid border rounded" alt="${product.name}">
          </div>

          <div class="col-md-7">
            <h2 class="product-title">${product.name}</h2>
            <p class="price">
              <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="" groupingUsed="true" /> VNĐ
            </p>
            <p class="product-info">${product.description}</p>

            <div class="mt-4">
              <a href="cart?action=add&productID=${product.productID}" class="btn btn-primary me-2">MUA NGAY</a>
              <a href="cart?action=add&productID=${product.productID}" class="btn btn-outline-primary">THÊM VÀO GIỎ HÀNG</a>
            </div>
          </div>
        </div>

        <!-- Phần quà tặng -->
        <div class="gift-box">
          <h5>🎁 Bạn sẽ nhận được:</h5>
          <ul>
            <li>🖱️ Chuột HP Z3700 Wireless</li>
            <li>🎧 Tai nghe HyperX Cloud Stinger Core II</li>
            <li>🎒 Túi đựng laptop Targus 15.6"</li>
            <li>🎟️ Giảm 200.000đ khi mua phần mềm M365 Personal</li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Chính sách bán hàng -->
    <div class="col-lg-4">
      <div class="sidebar-box">
        <div class="company-info">
          <img src="https://scontent.fdad3-5.fna.fbcdn.net/v/t1.15752-9/480148661_9011683048954377_8966679042114836256_n.jpg?stp=dst-jpg_s480x480_tt6&_nc_cat=109&ccb=1-7&_nc_sid=0024fc&_nc_ohc=59i_wTGvZt4Q7kNvgFf-FDS&_nc_oc=Adh8p3x7XEI_SzFP-8Ykz7Ra_zO3wWy4G3sBIX-_6-Senj6wHCeIdlpjtL6sr8JsUiF1PjyRFW0s3n1AE3FD9yHE&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent.fdad3-5.fna&oh=03_Q7cD1gGVnz_C_WVmf68RcLgZtv4XyTIzlRVIxRtQ5sA7OALVLw&oe=67E8F604" alt="8386 SHOP">
          <h6>CÔNG TY CỔ PHẦN THƯƠNG MẠI DỊCH VỤ 8386 SHOP ✅</h6>
        </div>
        <h6 class="fw-bold">Chính sách bán hàng</h6>
        <ul class="policy-list">
          <li>🚚 Miễn phí giao hàng từ 5 triệu <a href="#">Xem chi tiết</a></li>
          <li>✔️ Cam kết hàng chính hãng 100%</li>
          <li>🔄 Đổi trả trong vòng 10 ngày <a href="#">Xem chi tiết</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>


<div class="container mt-4">
  <div class="row">
    <!-- Đánh giá sản phẩm - Đặt chung layout với thông tin sản phẩm -->
    <div class="col-lg-8">
      <div class="review-container">
        <h5>Đánh giá sản phẩm</h5>

        <!-- Tổng điểm đánh giá -->
        <div class="d-flex align-items-center">
          <div class="rating-summary">
            <span class="average-rating">4.9</span>/5
          </div>
          <div class="ms-3">
            <span>5,4K khách hàng hài lòng</span><br>
            <span>4 đánh giá</span>
          </div>
        </div>

        <!-- Biểu đồ đánh giá -->
        <div class="mt-3">
          <c:forEach begin="5" end="1" var="star">
            <div class="rating-bar-container">
              <span>${star} ★</span>
              <div class="rating-bar">
                <div class="filled" style="width: ${star * 20}%;"></div>
              </div>
              <span>${star == 5 ? "99.9%" : "0%"}</span>
            </div>
          </c:forEach>
        </div>

        <!-- Danh sách đánh giá -->
        <c:choose>
          <c:when test="${not empty reviews}">
            <c:forEach var="review" items="${reviews}">
              <div class="review-box">
                <div class="review-header">
                  <strong>Người dùng #${review.customerID}</strong>
                  <span class="review-stars">
                    <c:forEach begin="1" end="${review.rating}">&#9733;</c:forEach>
                    <c:forEach begin="${review.rating + 1}" end="5">&#9734;</c:forEach>
                  </span>
                </div>
                <p class="review-comment">${review.comment}</p>
                <span class="review-date">
                  <fmt:formatDate value="${review.reviewDate}" pattern="dd/MM/yyyy HH:mm" />
                </span>

                <!-- Nút xóa (chỉ hiển thị nếu đúng user hoặc admin) -->
                <c:if test="${sessionScope.userId == review.customerID || sessionScope.userRole == 'admin'}">
                  <form action="delete-review" method="post" class="mt-2">
                    <input type="hidden" name="reviewID" value="${review.reviewID}">
                    <input type="hidden" name="productID" value="${product.productID}">
                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                  </form>
                </c:if>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <p class="text-muted">Chưa có đánh giá nào.</p>
          </c:otherwise>
        </c:choose>



      </div>
    </div>
  </div>
</div>





</body>
<!-- Footer -->
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
</html>
