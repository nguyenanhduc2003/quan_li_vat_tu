<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí kho</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kho_admin.css">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

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
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/taikhoan_admin.jsp">
                        <i class="bi bi-person-circle me-2"></i>
                        Quản lí tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/vattu_admin.jsp">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/kho_admin.jsp">
                        <i class="bi bi-archive-fill me-2"></i>
                        Quản lí kho
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/duyet_admin.jsp">
                        <i class="bi bi-bookmark-fill me-2"></i>
                        Duyệt yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/cungcap_admin.jsp">
                        <i class="bi bi-briefcase-fill me-2"></i>
                        Quản lí nhà cung cấp
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
                    <input type="text" class="form-control" placeholder="Tìm kiếm gì đó...">
                </div>
    
                <div class="hello col-12 col-sm-4">
                    <span id="hello">Xin chào!</span>
                    <span id="name">Nguyễn Anh Đức</span>
                    <span><img src="https://png.pngtree.com/png-vector/20220429/ourlarge/pngtree-human-template-doctor-avatar-white-individual-vector-png-image_27845716.jpg" alt=""></span>
                </div>
                
            </div>

        </div>

        <div class="content-here">
            <div class="btn-file">
                <button class="btn btn-primary mb-3 mt-3" onclick="handleAddNew()">Thêm vật tư mới</button>
                <button class="btn btn-success" onclick="exportToExcel()">
                    Tải xuống
                    <i class="bi bi-box-arrow-in-down ms-2"></i>
                </button>
            </div>
            <div class="table-content">
                <table id="myTable" class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Mã vật tư</th>
                            <th>Tên vật tư</th>
                            <th>Nhà cung cấp</th>
                            <th>Số lượng</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>             
                        <c:forEach var="warehouse" items="${warehouses}">
                        <tr>
                            <td>${material_id}</td>
                            <td>${warehouse_name}</td>
                            <td>${warehouse_supplier}</td>
                            <td>${warehouse_quantity}</td>
                            <td class="${warehouse_quantity < 10 ? 'textdanger' : 'text-success'}">
                            	${warehouse_quantity < 10 ? 'Cần bổ sung' : 'Bình thường'}
                            </td>
                            <td>
                                <button class="btn btn-primary" onclick="handleNhap(this)">Nhập</button>
                                <button class="btn btn-success" onclick="handleXuat(this)">Xuất</button>
                                <button class="btn btn-danger">Xóa</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/kho_admin.js"></script>
</body>
</html>