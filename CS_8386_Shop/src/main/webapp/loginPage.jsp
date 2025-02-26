<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 17/02/2025
  Time: 4:18 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <a></a>
    <%--  Nhúng CSS  --%>
    <link href="<c:url value='/css/login.css'/>" rel="stylesheet" type="text/css">



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
        <div class="foot">
            <div class="finger"></div>
        </div>
        <div class="foot rgt">
            <div class="finger"></div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/login" method="post" class="panda-form bg-white p-4 shadow rounded">
        <div class="hand"></div>
        <div class="hand rgt"></div>
        <h1 class="panda-h1">Login</h1>
        <div class="form-group">
            <label for="username" class="form-label">Tài khoản:</label>
            <input type="text" id="username" name="username" class="form-control" required="required" placeholder="Nhập tài khoản">
        </div>
        <div class="form-group">
            <label for="password" class="form-label">Mật khẩu:</label>
            <input type="password" id="password" name="password" class="form-control" required="required" placeholder="Nhập mật khẩu">
        </div>
        <button type="submit" class="panda-btn">Đăng nhập</button>
        <p>Don't have an account?</p>
        <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký tại đây</a>
//
        <div class="row">
            <div class="col-12">
                <p class="mt-5 mb-4">Or continue with</p>
                <div class="d-flex gap-3 flex-column">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/logingoogleservlet
&response_type=code&client_id=918294539710-o1ifsiv5u4ugolgnhl32m7q9hnqonuqe.apps.googleusercontent.com&approval_prompt=force" class="btn bsb-btn-xl btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                            <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                        </svg>
                        <span class="ms-2 fs-6 text-uppercase">Sign in With Google</span>
                    </a>
                    <a href="#!" class="btn bsb-btn-xl btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                        </svg>
                        <span class="ms-2 fs-6 text-uppercase">Sign in With Facebook</span>
                    </a>
                    <a href="#!" class="btn bsb-btn-xl btn-info">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                        </svg>
                        <span class="ms-2 fs-6 text-uppercase">Sign in With Twitter</span>
                    </a>
                </div>
            </div>
        </div>
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
