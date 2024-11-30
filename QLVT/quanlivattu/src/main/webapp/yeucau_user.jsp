<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yêu cầu vật tư</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yeucau_user.css">
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
                <a class="nav-link fade-link" href="${pageContext.request.contextPath}/trangchu_user.jsp">
                    <i class="bi bi-heart-pulse-fill"></i>
                    <span class="ms-2">VẬT TƯ Y TẾ</span>
                </a>               
            </div>

        </div>

        
        <div class="dashboard mt-5 ms-3">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/vattu_user.jsp">
                        <i class="bi bi-database-fill me-2"></i>
                        Vật tư & thiết bị
                    </a>
                </li>
                <li  id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/yeucau_user.jsp">
                        <i class="bi bi-hand-index-fill me-2"></i>
                        Yêu cầu vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/lichsu_user.jsp">
                        <i class="bi bi-clock-history me-2"></i>
                        Lịch sử yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/nhan_user.jsp">
                        <i class="bi bi-inboxes-fill me-2"></i>
                        Nhận vật tư
                    </a>
                </li>
            </ul>
        </div>

        <div class="log-out">
            <a class="nav-link" href="${pageContext.request.contextPath}/dangnhap.jsp">
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
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateInfoModal">
                        Cập nhật thông tin cá nhân
                    </button>
                </div>
                
                 <!-- Modal -->
			        <div class="modal fade" id="updateInfoModal" tabindex="-1" aria-labelledby="updateInfoModalLabel" aria-hidden="true">
			            <div class="modal-dialog">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <h5 class="modal-title" id="updateInfoModalLabel">Cập nhật thông tin cá nhân</h5>
			                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                    </div>
			                    <div class="modal-body">
			                        <form id="updateInfoForm" action="UpdateInfoServlet" method="post">
			                            <div class="mb-3">
			                                <label for="fullName" class="form-label">Full Name</label>
			                                <input type="text" class="form-control" id="fullName" name="fullName" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="phoneNumber" class="form-label">Phone Number</label>
			                                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="birthDate" class="form-label">Date of Birth</label>
			                                <input type="text" class="form-control" id="birthDate" name="birthDate" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="address" class="form-label">Address</label>
			                                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
			                            </div>
			                            <button type="submit" class="btn btn-primary">Submit</button>
			                        </form>
			                    </div>
			                </div>
			            </div>
			        </div>
			    
                <!-- end Modal -->
    
                <div class="hello col-12 col-sm-4">
                    <span id="hello">Xin chào!</span>
                    <span id="name">
                     <c:choose>
				        <c:when test="${not empty sessionScope.account_name}">
				            ${sessionScope.account_name}
				        </c:when>
				        <c:otherwise>
				            Chưa có tên
				        </c:otherwise>
					   </c:choose>
                    </span>
                    <span><img src="https://png.pngtree.com/png-vector/20220429/ourlarge/pngtree-human-template-doctor-avatar-white-individual-vector-png-image_27845716.jpg" alt=""></span>
                </div>
                
            </div>

        </div>

        <div class="content-here">

            <div class="form-title">
                <img src="${pageContext.request.contextPath}/image/icon-medical.avif" alt="">
                <div id="div1">YÊU CẦU VẬT TƯ</div>
                <div id="div2">Điền đầy đủ thông tin vào trường bên dưới để yêu cầu xin vật tư.</div>
            </div>

            <div class="form-content">
                <div class="form-content-child">
                    <form id="myForm" action="#" method="post">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <label for="email" class="form-lable">Email</label>
                                <input id="email" name="email" type="text" class="form-control" required>
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="fullname" class="form-lable">Họ và tên</label>
                                <input id="fullname" name="name" type="name" class="form-control" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <label for="phonenumber" class="form-lable">Số điện thoại</label>
                                <input id="phonenumber" name="phonenumber" type="number" class="form-control" required>
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="daterq" class="form-lable">Ngày yêu cầu</label>
                                <input id="daterq" name="date-rq" type="date" class="form-control" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <label for="materialname" class="form-lable">Tên vật tư</label>
                                <input id="materialname" name="materialname" type="text" class="form-control" required>
                            </div>
                            <div class="col-12 col-sm-6">
                                <label for="quantity" class="form-lable">Số lượng</label>
                                <input id="quantity" name="quantity" type="number" class="form-control" required>
                            </div>
                        </div>

                        <div>
                            <label for="reason" class="form-lable">Lý do</label> <br>
                            <textarea class="form-control" name="reason" id="reason" rows="4" cols="91" required></textarea>
                        </div>

                        <div>
                            <label for="note" class="form-lable">Ghi chú</label>
                            <textarea class="form-control" name="reason" id="reason" rows="2" cols="91"></textarea>
                        </div>

                        <div class="btn-submit">
                            <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                        </div>

                    </form>
                </div>
            </div>

        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/vattu_user.js"></script>
</body>
</html>