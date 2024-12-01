<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí vật tư</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vattu_admin.css">
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
                <li id="checked" class="nav-item">
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
                <li class="nav-item">
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

        <div class="info-display ms-3 me-3">
            <div>
		        <label for="total-display" class="form-label">Tổng số vật tư</label>
		        <input id="total-display" name="total-display" type="text" class="form-control" 
		               value="${totalMaterials}" readonly>
		               
		    </div>
        </div>

        <div class="btn-add d-flex ms-3 me-3">
            <div class="me-2">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addMaterialModal">
                    <i class="bi bi-plus"></i>
                    Thêm vật tư
            </div>
                <div class="btn-file">
                    <button class="btn btn-success" onclick="exportToExcel()">
                        Tải xuống
                        <i class="bi bi-box-arrow-in-down ms-2"></i>
                    </button>
                </div>
            </button>


            <!--modal-->
            <div class="modal fade" id="addMaterialModal" tabindex="-1" aria-labelledby="addMaterialModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addMaterialModalLabel">Thêm Vật Tư</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="materialForm">
                                <div class="mb-3">
                                    <label for="maVatTu" class="form-label">Mã Vật Tư</label>
                                    <input type="text" class="form-control" id="maVatTu" required>
                                </div>
                                <div class="mb-3">
                                    <label for="tenVatTu" class="form-label">Tên Vật Tư</label>
                                    <input type="text" class="form-control" id="tenVatTu" required>
                                </div>
                                <div class="mb-3">
                                    <label for="moTa" class="form-label">Mô Tả</label>
                                    <textarea class="form-control" id="moTa" rows="3"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="donViTinh" class="form-label">Đơn Vị Tính</label>
                                    <input type="text" class="form-control" id="donViTinh">
                                </div>
                                <div class="mb-3">
                                    <label for="ngaySanXuat" class="form-label">Ngày Sản Xuất</label>
                                    <input type="date" class="form-control" id="ngaySanXuat">
                                </div>
                                <div class="mb-3">
                                    <label for="hanSuDung" class="form-label">Hạn Sử Dụng</label>
                                    <input type="date" class="form-control" id="hanSuDung">
                                </div>
                                <div class="mb-3">
                                    <label for="cachSuDung" class="form-label">Cách sử dụng</label>
                                    <textarea class="form-control" id="cachSuDung" rows="3"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="nhaCungCap" class="form-label">Nhà Cung Cấp</label>
                                    <input type="text" class="form-control" id="nhaCungCap">
                                </div>
                                <div class="mb-3">
                                    <label for="quocGiaSanXuat" class="form-label">Quốc Gia Sản Xuất</label>
                                    <input type="text" class="form-control" id="quocGiaSanXuat">
                                </div>
                                <div class="mb-3">
                                    <label for="giaTien" class="form-label">Giá Tiền</label>
                                    <input type="number" class="form-control" id="giaTien" min="0">
                                </div>
                                <div class="mb-3">
                                    <label for="anh" class="form-label">Ảnh</label>
                                    <input type="file" class="form-control" id="anh">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary" id="confirmAdd">Xác Nhận</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--end modal-->
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr class="table-dark">                      
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
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody  id="materialTableBody">
                    	<c:forEach var="material" items="${materials}">
                        <tr>
                            <td>${material.material_id}</td>
                            <td>${material.material_name}</td>
                            <td>
                            <abbr title="${material.material_describe}">Xem chi tiết</abbr>
                            </td>
                            <td>${material.material_unit}</td>
                            <td>${material.material_date}</td>
                            <td>${material.material_expiry}</td>
                            <td>
                            <abbr title="${material.material_use}">Xem chi tiết</abbr>
                            </td>
                            <td>${material.material_supplier}</td>
                            <td>${material.material_country}</td>
                            <td>${material.material_value}</td>
                            <td><img src="${material.material_image}" atl=""></td>
                            <td>
                                <button class="btn btn-primary">
                                <i class="bi bi-pencil-square"></i></button>
                                <button class="btn btn-danger mt-1">
                                <i class="bi bi-dash-square"></i>
                                </button>
                            </td>
                        </tr> 
                        </c:forEach>                                      
                    </tbody>
                </table>
            </div>
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/vattu_admin.js"></script>
</body>
</html>