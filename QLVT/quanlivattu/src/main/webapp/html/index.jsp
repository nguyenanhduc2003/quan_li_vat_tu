<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icon/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Mona+Sans:ital,wght@0,200..900;1,200..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">

    <title>Màn hình trang chủ</title>
</head>
<body style="font-family: 'Mona Sans', serif;">
    <!--thanh điều hướng-->
   <nav class="navbar navbar-expand-sm container-fluid" style="background-color: #3c8de4;">
        <!--logo và tên-->
        <div class="justify-content-start container">
            <a href="/html/index.jsp" class="nav-link">
                <ul class="navbar-nav d-flex">
                    <li class="nav-item container d-flex">
                        <i class="bi bi-heart-pulse-fill text-danger" style="font-size: 29px;"></i>
                        <span class="vattuyte pt-2 ps-2">VẬT TƯ Y TẾ</span>
                    </li>
                    <li class="nav-item"></li>
                </ul>
            </a>
           
        </div>
        <!--kết thúc logo và tên-->
        <!--thanh tìm kiếm-->
        <div class="justify-content-center container">
            <input class="form-control" type="text" id="searchInput" placeholder="Nhập từ khóa tìm kiếm" onkeyup="searchText()">
        </div>
        
        <!--kêt thúc -->
          
        <!--đăng nhập đăng kí-->
        <div class="justify-content-end container">
            <ul class="navbar-nav">
                <li class="nav-item">
                   <a class="nav-link dangnhap" href="${pageContext.request.contextPath}/html/dangnhap.jsp" style="color: white;">Đăng nhập</a>
                </li>
                 <li class="nav-iem">
                    <a class="nav-link dangnhap" href="#gioithieu" style="color: white;">Giới thiệu</a>
                </li>
                <li class="nav-iem">
                    <a class="nav-link dangnhap" href="#lienhe" style="color: white;">Liên hệ</a>
                </li>
            </ul>
        </div>
        <!--kết thúc-->
   </nav>
   <!--kết thúc thanh điều hướng-->

   <div class="container" style="width: 80%; border: 2px solid white;">
      <!--casourel-->
   <div class="container">
    <div id="demo" class="carousel slide p-2" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button title="gotoslide1" type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
          <button title="gotoslide2" type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
          <button title="gotoslide3" type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
          <button title="gotoslide4" type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/image/cs1.png" alt="" class="d-block w-100 rounded" style="max-height: 600px;">
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/image/cs2.webp" alt="" class="d-block w-100 rounded" style="max-height: 600px;">
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/image/cs3.png" alt="" class="d-block w-100 rounded" style="max-height: 600px;">
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/image/cs4.jpg" alt="" class="d-block w-100 rounded" style="max-height: 600px;">
          </div>
        </div>
        <button title="prev" class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button title="next" class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
   </div>
  
   <!--kết thúc-->
   <!--giới thiệu website-->
   <div id="gioithieu" class="container rounded mt-1 intro" style="background-image: url(${pageContext.request.contextPath}/image/hero-bg.png);">
        <div class="text-center text-white" style="font-size: 30px; font-weight: bold; padding-top: 50px;">
            GIỚI THIỆU WEBSITE QUẢN LÍ VẬT TƯ Y TẾ
        </div>
        <div class="text-center text-white mt-5" style="font-size: 20px; padding-left: 100px; padding-right: 100px; ">
            <i>
                Website quản lý vật tư y tế là một giải pháp phần mềm hiện đại, được thiết kế nhằm hỗ trợ các cơ sở y tế trong việc quản lý nguồn lực vật tư và thiết bị y tế một cách hiệu quả và chính xác. Với sự phát triển không ngừng của công nghệ, việc áp dụng các công cụ quản lý trực tuyến không chỉ giúp tối ưu hóa quy trình vận hành mà còn nâng cao chất lượng dịch vụ chăm sóc sức khỏe.
            </i>
        </div>
        <div class="row text-white" style="margin-top: 40px; font-weight: bold; font-size: 20px;">
            <div class="col" style="width: 450px; height: 450px;">
                <div class="container rounded-pill d-flex align-items-center justify-content-center" 
                     style="background-color: #2d67db; margin-top: 10%; margin-bottom: 10%; margin-left: 10%; margin-right: 10%; height: 80%; width: 80%; box-shadow: 15px -15px 20px rgba(53, 111, 237, 0.5); opacity: 0.9; border: 2px solid #87cefa;">
                     <div><i class="bi bi-bookmark-star-fill" style="font-size: 50px; color: rgb(221, 235, 19);"></i>
                     </div>
                    <div class="ps-2">Cung cấp các chức năng quan trọng</div>
                </div>
            </div>
            <div class="col" style="width: 450px; height: 450px;">
                <div class="container rounded-pill d-flex align-items-center justify-content-center" 
                     style="background-color: #2d67db; margin-top: 10%; margin-bottom: 10%; margin-left: 10%; margin-right: 10%; height: 80%; width: 80%; box-shadow: 15px -15px 20px rgba(53, 111, 237, 0.5); opacity: 0.9; border: 2px solid #87cefa;">
                     <div><i class="bi bi-floppy-fill" style="font-size: 50px; color: rgb(221, 235, 19);"></i>
                     </div>
                    <div class="ps-2">Lưu trữ thông tin chi tiết</div>
                </div>
            </div>
            <div class="col" style="width: 450px; height: 450px;">
                <div class="container rounded-pill d-flex align-items-center justify-content-center" 
                     style="background-color: #2d67db; margin-top: 10%; margin-bottom: 10%; margin-left: 10%; margin-right: 10%; height: 80%; width: 80%; box-shadow: 15px -15px 20px rgba(53, 111, 237, 0.5); opacity: 0.9; border: 2px solid #87cefa;">
                     <div><i class="bi bi-globe" style="font-size: 50px; color: rgb(221, 235, 19);"></i>
                     </div>
                    <div class="ps-2">Giao diện trực quan</div>
                </div>
            </div>
            
            </div>
        </div>
        
   </div>
   <!--kết thúc-->
   <!--liên hệ-->
   <div class="container text-white" style="background-color: #178066;">
    <div id="lienhe" class="row" style="height: 300px;">
      <div class="col text-center">
          <div style="font-size: 25px; padding-top: 50px;">
              <i class="bi bi-person-rolodex pe-2"></i>Liên hệ với chúng tôi
          </div>
          <div style="padding-top: 50px; font-size: 13px;">
              <i class="bi bi-geo-alt-fill me-2"></i>Trường Đại Học Công Nghiệp Hà Nội
          </div>
          <div style="padding-top: 20px; font-size: 13px;">
              <i class="bi bi-telephone-fill me-2"></i>0123456789
          </div>
          <div style="padding-top: 20px; font-size: 13px;">
              <i class="bi bi-envelope-fill me-2"></i>abc@gmail.com
          </div>
      </div>
  
      <div class="col text-center">
          <div style="font-size: 25px; padding-top: 50px;">
              <i class="bi bi-info-circle-fill pe-2"></i>Về chúng tôi
          </div>
          <div style="padding-top: 50px; font-size: 13px;">
              <i class="bi bi-person-circle me-2"></i>Nhóm sinh viên Công nghệ thông tin
          </div>
          <div style="padding-top: 20px; font-size: 13px;">
              <i class="bi bi-person-vcard-fill me-2"></i>Khóa 16
          </div>
          <div style="padding-top: 20px; font-size: 13px;">
              <i class="bi bi-alarm-fill me-2"></i>Niên khóa 2021-2025
          </div>
      </div>
  
      <div class="col text-center">
          <div style="font-size: 25px; padding-top: 50px;">
              <i class="bi bi-browser-chrome pe-2"></i>Mạng xã hội
          </div>
          <div class="d-flex justify-content-center pt-5" style="font-size: 25px;">
              <a class="nav-link" href="https://www.facebook.com/">
                  <i class="bi bi-facebook"></i>
              </a>
              <a class="nav-link" href="https://discord.com/">
                  <i class="bi bi-discord"></i>
              </a>
              <a class="nav-link" href="https://github.com/">
                  <i class="bi bi-github"></i>
              </a>
              <a class="nav-link" href="https://instagram.com/">
                  <i class="bi bi-instagram"></i>
              </a>
              <a class="nav-link" href="https://twitch.com/">
                  <i class="bi bi-twitch"></i>
              </a>
              <a class="nav-link" href="https://tiktok.com/">
                  <i class="bi bi-tiktok"></i>
              </a>
          </div>
      </div>
  </div>

     <!--kết thúc liên hệ-->
     </div>

     <!--đầu trang-->
     <div class="container-fluid">
        <div class="text-center" style="margin-left: 35%; margin-right: 35%;">
          <span><a class="nav-link" href="${pageContext.request.contextPath}/html/index.jsp">Quay lại đầu trang</a></span>
        </div>
     </div>
     <!--end đầu trang-->
   </div>

   <script src="${pageContext.request.contextPath}/js/index.js"></script>
   
</body>
</html>

