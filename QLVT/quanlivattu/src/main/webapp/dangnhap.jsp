<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dangnhap.css">
    <!--boostrap-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css">
    <!--icon-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icon/font/bootstrap-icons.min.css">
    <!--js bootstrap-->
    <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Mona+Sans:ital,wght@0,200..900;1,200..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">
</head>
<body style="font-family: 'Mona Sans', serif;">

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="RegisterServlet" method="post">
			<h1 class="pb-5">Tạo tài khoản mới</h1>
			<input name="fullname" class="form-control mb-2" type="text" placeholder="Họ và tên" required/>
			<input name="email" class="form-control mb-2" type="email" placeholder="Email" required/>
			<input name="password" class="form-control mb-2" type="password" placeholder="Mật khẩu" required/>
			<input name="confirmPassword" class="form-control mb-2" type="password" placeholder="Xác nhận mật khẩu" required/>
			<button type="submit" class="btn btn-primary">Đăng ký</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="LoginServlet" method="post">
			<h1 class="pb-5">Đăng nhập</h1>
			<input name="email" class="form-control mb-2" type="email" placeholder="Email" required/>
			<input name="password" class="form-control" type="password" placeholder="Mật khẩu" required/>
			<a href="#">Quên mật khẩu?</a>
			<button type="submit" class="btn btn-primary">Đăng nhập</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Bạn đã có tài khoản!</h1>
				<p>Đăng nhập ngay</p>
				<button class="ghost" id="signIn">Đăng nhập</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Bạn chưa có tài khoản!</h1>
				<p>Tạo tài khoản ngay</p>
				<button class="ghost" id="signUp">Đăng ký</button>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid text-center">
    <a class="nav-link back" href="${pageContext.request.contextPath}/index.jsp">Quay lại trang chủ</a>
</div>

<script src="${pageContext.request.contextPath}/js/dangnhap.js"></script>
</body>
</html>
