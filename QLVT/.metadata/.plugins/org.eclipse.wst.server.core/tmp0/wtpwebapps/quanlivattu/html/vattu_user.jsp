<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật tư và thiết bị</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vattu.css">
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
    <!--datatable-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!--xuatfile-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>

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
                <li id="checked" class="nav-item">
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
    <main id="main-content" class="main-content h-100">

        <div class="header">

            <div class="row w-100">

                <div class="toggle col-1 col-sm-1">
                    <button id="toggle">☰</button>
                </div>
    
                <div class="search-bar col-11 col-sm-7">
                    <input onkeyup="searchTable()" id="searchInput" type="text" class="form-control" placeholder="Tìm kiếm gì đó...">
                </div>
    
                <div class="hello col-12 col-sm-4">
                    <span id="hello">Xin chào!</span>
                    <span id="name">Nguyễn Anh Đức</span>
                    <span><img src="https://png.pngtree.com/png-vector/20220429/ourlarge/pngtree-human-template-doctor-avatar-white-individual-vector-png-image_27845716.jpg" alt=""></span>
                </div>
                
            </div>

        </div>

        <div class="content-here mt-3">

            <div class="thongke row">

                <div class="mt-3 col-12 col-sm-4">
                    <div class="thongke1">
                        Tổng số vật tư
                        <p>
                            <i class="bi bi-basket"></i>
                            <span>100</span>
                        </p>
                    </div>
                </div>

                <div class="mt-3 col-12 col-sm-4">
                    <div class="thongke2">
                        Nhà cung cấp nổi bật
                        <p>
                            <i class="bi bi-bus-front-fill"></i>
                            <span>Nhà cung cấp A</span>
                        </p>
                    </div>
                </div>


            </div>

            <div class="btn-file">
                <button class="btn btn-success" onclick="exportToExcel()">
                    Tải xuống
                    <i class="bi bi-box-arrow-in-down ms-2"></i>
                </button>
            </div>


            <div class="table-set table-responsive">
                <table id="myTable" class="table table-bordered">
                    <thead class="bg-primary text-white">
                        <tr class="text-center">
                            <th>Mã vật tư</th>
                            <th>Tên vật tư</th>
                            <th>Mô tả</th>
                            <th>Đơn vị tính</th>
                            <th>Ngày sản xuất</th>
                            <th>Hạn sử dụng</th>
                            <th>Cách sử dụng</th>
                            <th>Nhà cung cấp</th>
                            <th>Quốc gia sản xuất</th>
                            <th>Giá tiền</th>
                            <th>Ảnh</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="material" items="${materials}">
                        <tr class="text-center">
                            <td>${material_id}</td>
                            <td>${material_name}</td>
                            <td>${material_describe}</td>
                            <td>${material_unit}</td>
                            <td>${material_date}</td>
                            <td>${material_expiry}</td>
                            <td>${material_use}</td>
                            <td>${material_supplier}</td>
                            <td>${material_country}</td>
                            <td>${material_value}</td>
                            <td>${material_image}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
    
                </table>
            </div>
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/vattu_user.js"></script>
</body>
</html>