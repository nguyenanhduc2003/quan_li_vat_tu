<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí tài khoản</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/taikhoan_admin.css">
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
                <a class="nav-link fade-link" href="${pageContext.request.contextPath}/html/trangchu_admin.jsp">
                    <i class="bi bi-heart-pulse-fill"></i>
                    <span class="ms-2">VẬT TƯ Y TẾ</span>
                </a>               
            </div>

        </div>

        
        <div class="dashboard mt-5 ms-3">
            <ul class="navbar-nav">
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/taikhoan_admin.jsp">
                        <i class="bi bi-person-circle me-2"></i>
                        Quản lí tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/vattu_admin.jsp">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/kho_admin.jsp">
                        <i class="bi bi-archive-fill me-2"></i>
                        Quản lí kho
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/duyet_admin.jsp">
                        <i class="bi bi-bookmark-fill me-2"></i>
                        Duyệt yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/html/cungcap_admin.jsp">
                        <i class="bi bi-briefcase-fill me-2"></i>
                        Quản lí nhà cung cấp
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

        <div class="btn-file">
            <button class="btn btn-success" onclick="exportToExcel()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
        </div>

        <div class="content-here">
            <div class="table-content table-responsive">
                <table id="myTable" class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Mã người dùng</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Mật khẩu</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Ngày sinh</th>
                            <th>Ngày tạo tài khoản</th>
                            <th>Vai trò</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="account" items="${accounts}">
                        <tr>
                            <td>${account.account_id}</td>
                            <td>${account.account_name}</td>
                            <td>${account.account_email}</td>
                            <td>${account.account_pass}</td>
                            <td>${account.account_phone}</td>
                            <td>${account.account_address}</td>
                            <td>${account.account_birthday}</td>
                            <td>${account.account_created_date}</td>
                            <td>${account.account_role}</td>
                            <td class="d-flex gap-2">
                                <button class="btn btn-primary">
                                <i class="bi bi-pencil-square"></i></button>
                                <button class="btn btn-danger">
                                <i class="bi bi-dash-square"></i></button>
                            </td>
                        </tr>    
                        </c:forEach>                     
                    </tbody>
                </table>
            </div>
            
        </div>

        <!--them du lieu-->
        <div class="add-data">
            <!--form title-->
            <div class="form-title">
                Thêm dữ liệu
            </div>
            <!--end form title-->
            <!--form-->
            <form id="addRowForm">
                <div class="row">
                    <div class="col-12 col-sm-3">
                        <label for="user-id" class="form-label">Mã người dùng</label>
                        <input id="user-id" name="user-id" type="text" class="form-control" required>
                    </div>

                    <div class="col-12 col-sm-4">
                        <label for="user-name" class="form-label">Tên người dùng</label>
                        <input id="user-name" name="user-name" type="name" class="form-control" required>
                    </div>

                </div>

                <div class="row">

                    <div class="col-12 col-sm-4">
                        <label for="email" class="form-label">Email</label>
                        <input id="email" name="email" type="text" class="form-control" required>
                    </div>

                    <div class="col-12 col-sm-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input id="password" name="password" type="password" class="form-control" required>
                    </div>

                </div>
                <div class="row">
                    <div class="col-12 col-sm-4">
                        <label for="phonenumber" class="form-label">Số điện thoại</label>
                        <input id="phonenumber" name="phonenumber" type="number" class="form-control" required>
                    </div>
                    <div class="col-12 col-sm-3">
                        <label for="birthday" class="form-label">Ngày sinh</label>
                        <input id="birthday" name="birthday" type="date" class="form-control" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-sm-7">
                        <label for="address" class="form-label">Địa chỉ</label> <br>
                        <textarea name="address" id="address" class="form-control" cols="10"></textarea required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-sm-3">
                        <label for="date-create" class="form-label">Ngày tạo tài khoản</label>
                        <input id="date-create" name="date-create" type="date" class="form-control" required>
                    </div>
                    <div class="col-12 col-sm-4">
                        <label for="role" class="form-label">Vai trò</label>
                        <input id="role" name="role" type="text" class="form-control" required>
                    </div>
                </div>

                <div>
                    <button type="submit" id="addRowBtn" class="btn btn-primary">Thêm dữ liệu</button>
                </div>

            </form>
            <!--end form-->
        </div>
        
        <!--end them du lieu-->

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/taikhoan_admin.js"></script>
</body>
</html>