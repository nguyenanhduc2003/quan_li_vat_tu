<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trang chủ người dùng</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trangchu_user.css">
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
    <!--sidebar-->
    <div id="sidebar" class="sidebar">
        <div class="m-3 mt-3">

            <div class="logo d-flex align-items-center">
                <a class="nav-link fade-link" href="${pageContext.request.contextPath}/html/trangchu_user.jsp">
                    <i class="bi bi-heart-pulse-fill"></i>
                    <span class="ms-2">VẬT TƯ Y TẾ</span>
                </a> 
            </div>

        </div>

        
        <div class="dashboard mt-5 ms-3">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/vattu_user.jsp">
                        <i class="bi bi-database-fill me-2"></i>
                        Vật tư & thiết bị
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/yeucau_user.jsp">
                        <i class="bi bi-hand-index-fill me-2"></i>
                        Yêu cầu vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/lichsu_user.jsp">
                        <i class="bi bi-clock-history me-2"></i>
                        Lịch sử yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/nhan_user.jsp">
                        <i class="bi bi-inboxes-fill me-2"></i>
                        Nhận vật tư
                    </a>
                </li>
            </ul>
        </div>

        <div class="log-out">
            <a class="nav-link" href="${pageContext.request.contextPath}/html/dangnhap.jsp">
                Đăng Xuất
                <i class="bi bi-box-arrow-right"></i>
            </a>
        </div>
       
    </div>
    <!--end sidebar-->
    <!--main content-->
    <main id="main-content" class="main-content">

        <div class="header">

            <div class="row w-100">

                <div class="toggle col-1 col-sm-1">
                    <button id="toggle">☰</button>
                </div>
    
                <div class="search-bar col-11 col-sm-7">
                    <input type="text" class="form-control" placeholder="Tìm kiếm gì đó...">
                </div>
    
                <div class="hello col-12 col-sm-4">
                    <span id="hello">Xin chào!</span>
                    <span id="name">Nguyễn Anh Đức</span>
                    <span><img src="https://png.pngtree.com/png-vector/20220429/ourlarge/pngtree-human-template-doctor-avatar-white-individual-vector-png-image_27845716.jpg" alt=""></span>
                </div>
                
            </div>

        </div>
        <div class="banner">
            <div class="row">
                <div id="myCarousel" class="carousel slide col" data-bs-ride="carousel">
                    <!-- Indicators -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="5" aria-label="Slide 6"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="6" aria-label="Slide 7"></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="7" aria-label="Slide 8"></button>
                    </div>
            
                    <!-- Slides -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/image/slide-1.jpg" class="d-block w-100" alt="Slide 1">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-2.jpg" class="d-block w-100" alt="Slide 2">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-3.jpg" class="d-block w-100" alt="Slide 3">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-4.jpg" class="d-block w-100" alt="Slide 4">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-5.jpg" class="d-block w-100" alt="Slide 5">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-6.jpg" class="d-block w-100" alt="Slide 6">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-7.jpg" class="d-block w-100" alt="Slide 7">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/slide-8.jpg" class="d-block w-100" alt="Slide 8">
                        </div>
                    </div>
            
                    <!-- Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/trangchu_user.js"></script>
</body>
</html>