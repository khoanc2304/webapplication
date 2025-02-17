<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 17/02/2025
  Time: 8:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <%--  Nhúng CSS  --%>
    <link rel="stylesheet" href="css/login.css">
    <%--  BOOTSTRAP --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
<%--<!-- Gọi Sidebar -->--%>
<%--<jsp:include page="common/sidebar.jsp" />--%>

<%--<!-- Gọi Toast -->--%>
<%--<%@ include file="common/toast.jsp" %>--%>

<!-- Main Content -->
<div class="main-content" style="margin-top: 6rem">
    <div class="panda">
        <div class="ear"></div>
        <div class="face">
            <div class="eye-shade"></div>
            <div class="eye-white">
                <div class="eye-ball"></div>
            </div>
            <div class="eye-shade rgt"></div>
            <div class="eye-white rgt">
                <div class="eye-ball"></div>
            </div>
            <div class="nose"></div>
            <div class="mouth"></div>
        </div>
        <div class="body"> </div>
        <div class="foot" style="top: 470px">
            <div class="finger"></div>
        </div>
        <div class="foot rgt" style="top: 470px">
            <div class="finger"></div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/register" method="post" class="panda-form bg-white p-4 shadow rounded">
        <div class="hand"></div>
        <div class="hand rgt"></div>
        <h1 class="panda-h1">Register</h1>
        <div class="form-group mb-3">
            <label for="username" class="form-label">Tài khoản:</label>
            <input type="text" id="username" name="username" class="form-control" value="${username}" required="required" placeholder="Nhập tài khoản">
        </div>
        <div class="form-group">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" id="password" name="password" class="form-control" value="${password}" required="required" placeholder="Nhập mật khẩu">
        </div>
        <div class="form-group">
            <label for="fullName" class="form-label">Tên:</label>
            <input type="text" id="fullName" name="fullName" class="form-control" value="${fullName}" required="required" placeholder="Nhập họ và tên">
        </div>
        <div class="form-group mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="text" id="email" name="email" class="form-control" value="${email}" required="required" placeholder="Nhập email">
        </div>
        <button type="submit" class="panda-btn">Đăng ký</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Hiệu ứng khi nhấn vào input password
    $('#password').focusin(function() {
        $('form').addClass('up');
    });

    $('#password').focusout(function() {
        $('form').removeClass('up');
    });

    // Hiệu ứng mắt Panda
    $(document).on("mousemove", function(event) {
        var dw = $(document).width() / 15;
        var dh = $(document).height() / 15;
        var x = (event.pageX / dw);
        var y = (event.pageY / dh);
        $('.eye-ball').css({
            width: x + 'px',
            height: y + 'px'
        });
    });
</script>

</body>
</html>
