<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách người dùng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Danh sách người dùng</h2>
  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr>
      <th>UserID</th>
      <th>Username</th>
      <th>Password</th>
      <th>Full Name</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Address</th>
      <th>Avatar</th>
      <th>User Status</th>
      <th>User Role</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
      <tr>
        <td>${user.userID}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>${user.fullName}</td>
        <td>${user.email}</td>
        <td>${user.phone}</td>
        <td>${user.address}</td>
        <td><img src="${user.avatar}" alt="Avatar" width="50"></td>
        <td>${user.userStatus}</td>
        <td>${user.userRole}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
