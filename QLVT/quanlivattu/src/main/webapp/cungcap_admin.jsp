<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí nhà cung cấp</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cungcap_admin.css">
    <!--boostrap-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css">
    <!--icon-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icon/font/bootstrap-icons.min.css">
    <!--js bootstrap-->
    <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    <!--font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Mona+Sans:ital,wght@0,200..900;1,200..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Noto+Serif:ital,wght@0,100..900;1,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Playwrite+DE+Grund:wght@100..400&display=swap" rel="stylesheet">
    <!--datatable-->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!--xuatfile-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

</head>
<body style="font-family: 'Noto Serif', serif;">
    <!--sidebar-->
    <div id="sidebar" class="sidebar">
        <div class="m-3 mt-3">

            <div class="logo d-flex align-items-center">
                <a class="nav-link fade-link" href="${pageContext.request.contextPath}/trangchu_admin.jsp">
                    <i class="bi bi-heart-pulse-fill"></i>
                    <span class="ms-2">VẬT TƯ Y TẾ</span>
                </a>               
            </div>

        </div>

        
        <div class="dashboard mt-5 ms-3">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="Taikhoan_admin">
                        <i class="bi bi-person-circle me-2"></i>
                        Quản lí tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="Vattu_admin">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="Kho_admin">
                        <i class="bi bi-archive-fill me-2"></i>
                        Quản lí kho
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="Duyet_admin">
                        <i class="bi bi-bookmark-fill me-2"></i>
                        Duyệt yêu cầu
                    </a>
                </li>
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="Cungcap_admin">
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
            <div class="table-content table-responsive">
                <div class="btn-file mt-4 mb-4">
                    <button class="btn btn-primary" id="btnAdd">Thêm mới</button>
                    <button class="btn btn-success" onclick="exportToExcel()">
                        Tải xuống
                        <i class="bi bi-box-arrow-in-down ms-2"></i>
                    </button>
                </div>
                <table id="myTable" class="table table-bordered table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                        	<th>Mã nhà cung cấp</th>
                            <th>Tên nhà cung cấp</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Website</th>
                            <th>Mô tả</th>
                            <th>Ngày tạo</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody id="dataTableBody">
                    	<c:forEach var="supplier" items="${suppliers}">
                        <tr>
                        	<td>${supplier.supplier_id}</td>
                            <td>${supplier.supplier_name}</td>
                            <td>${supplier.supplier_email}</td>
                            <td>${supplier.supplier_phone}</td>
                            <td>${supplier.supplier_address}</td>
                            <td>
                             <a class="nav-link" href="${supplier.supplier_website}">Truy cập website</a>
                            </td>
                            <td>
                            <abbr title="${supplier.supplier_describe}">Xem chi tiết</abbr>
                            </td>
                            <td>${supplier.supplier_date_created}</td>
                            <td>
                                <button class="btn btn-primary btnEdit">
                                <i class="bi bi-pencil-square"></i></button>
                                <button class="btn btn-danger btnDelete">
                                <i class="bi bi-dash-square"></i></button>
                            </td>
                        </tr> 
                        </c:forEach>         
                    </tbody>
                </table>
            </div>
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/cungcap_admin.js"></script>
</body>
</html>
