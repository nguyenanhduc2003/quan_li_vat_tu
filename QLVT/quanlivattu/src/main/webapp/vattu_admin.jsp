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
                <a class="nav-link fade-link" href="${pageContext.request.contextPath}/Department_admin">
                    <i class="bi bi-heart-pulse-fill"></i>
                    <span class="ms-2">VẬT TƯ Y TẾ</span>
                </a>               
            </div>

        </div>

        
        <div class="dashboard mt-5 ms-3">
            <ul class="navbar-nav">
            	 <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Department_admin">
                        <i class="bi bi-hospital-fill me-2"></i>
                        Phòng ban & nhân sự
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Taikhoan_admin">
                        <i class="bi bi-person-circle me-2"></i>
                        Quản lí tài khoản
                    </a>
                </li>
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Vattu_admin">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Kho_admin">
                        <i class="bi bi-archive-fill me-2"></i>
                        Quản lí kho
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Duyet_admin">
                        <i class="bi bi-bookmark-fill me-2"></i>
                        Duyệt yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Cungcap_admin">
                        <i class="bi bi-briefcase-fill me-2"></i>
                        Quản lí nhà cung cấp
                    </a>
                </li>
            </ul>
        </div>

        <div class="log-out">
            <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">
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
    
                <div class="search-bar col-11 col-sm-7 d-flex justify-content-center">
				    <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#updateInfoModal">
				        <span class="btn-text"> <i class="bi bi-person-fill"></i>
				         Cập nhật thông tin cá nhân</span>
				    </button>
				</div>
                
                 <!-- Modal -->
				<div class="modal fade" id="updateInfoModal" tabindex="-1" aria-labelledby="updateInfoModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content shadow-lg border-0 rounded-3">
				            <div class="modal-header border-0 d-flex justify-content-between align-items-center">
				                <h5 class="modal-title text-primary" id="updateInfoModalLabel">Cập nhật thông tin cá nhân</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <form id="updateInfoForm" action="UpdateInfoServlet" method="post">
				                    <div class="mb-4">
				                        <label for="fullName" class="form-label">Họ và tên</label>
				                        <input type="text" class="form-control form-control-lg border-primary rounded-pill" id="fullName" name="fullName" required>
				                    </div>
				                    <div class="mb-4">
				                        <label for="phoneNumber" class="form-label">Số điện thoại</label>
				                        <input type="number" class="form-control form-control-lg border-primary rounded-pill" id="phoneNumber" name="phoneNumber" required>
				                    </div>
				                    <div class="mb-4">
				                        <label for="birthDate" class="form-label">Ngày sinh</label>
				                        <input type="date" class="form-control form-control-lg border-primary rounded-pill" id="birthDate" name="birthDate" required>
				                    </div>
				                    <div class="mb-4">
				                        <label for="address" class="form-label">Địa chỉ</label>
				                        <textarea class="form-control form-control-lg border-primary rounded-3" id="address" name="address" rows="3" required></textarea>
				                    </div>
				                    <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill">Cập nhật</button>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal -->
    
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
        
        <div class="row">
        	        <div class="ms-3 me-3 mt-3 mb-2 col-12 col-sm-3">
        	<div class="thongke1">
        	Tổng số vật tư
        	 <p>
                 <i class="bi bi-archive-fill"></i>
                 <span>${totalMaterials}</span>
             </p>	     
        	</div>    
        </div>
        </div>

        <div class="btn-add d-flex ms-3 me-3">
            <div class="me-2">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddMaterial">
                    <i class="bi bi-plus"></i>
                    Thêm vật tư
                    </button>
            </div>
                <div class="btn-file">
                    <button class="btn btn-success" onclick="exportToExcel()">
                        Tải xuống
                        <i class="bi bi-box-arrow-in-down ms-2"></i>
                    </button>
                </div>
            
        </div>
        
         <!-- Modal -->
			<div class="modal fade" id="AddMaterial" tabindex="-1" aria-labelledby="AddMaterialtLabel" aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content rounded-3 shadow-lg border-0">
			            <div class="modal-header bg-primary text-white">
			                <h5 class="modal-title" id="AddMaterialtLabel">Thêm vật tư mới</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!-- Form -->
			                <form id="addRowForm" action="Vattu_admin" method="POST" onsubmit="return confirmSubmit()">
			                    <div class="row g-3 mb-3">
			                        <div class="col-12 col-sm-3">
			                            <label for="material_id" class="form-label">Mã vật tư</label>
			                            <input id="material_id" name="material_id" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-6">
			                            <label for="material_name" class="form-label">Tên vật tư</label>
			                            <input id="material_name" name="material_name" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-3">
			                            <label for="material_unit" class="form-label">Đơn vị tính</label>
			                            <input id="material_unit" name="material_unit" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="mb-3">
			                        <label for="material_describe" class="form-label">Mô tả</label>
			                        <textarea name="material_describe" id="material_describe" class="form-control rounded-3 border-primary p-2" rows="2" required></textarea>
			                    </div>
			
			                    <div class="row g-3 mb-3">
			                        <div class="col-12 col-sm-6">
			                            <label for="material_date" class="form-label">Ngày sản xuất</label>
			                            <input id="material_date" name="material_date" type="date" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-6">
			                            <label for="material_expiry" class="form-label">Hạn sử dụng</label>
			                            <input id="material_expiry" name="material_expiry" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="mb-3">
			                        <label for="material_use" class="form-label">Cách sử dụng</label>
			                        <textarea name="material_use" id="material_use" class="form-control rounded-3 border-primary p-2" rows="2" required></textarea>
			                    </div>
			
			                    <div class="row g-3 mb-3">
			                        <div class="col-12 col-sm-9">
			                            <label for="material_supplier" class="form-label">Nhà cung cấp</label>
			                            <input id="material_supplier" name="material_supplier" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-3">
			                            <label for="material_country" class="form-label">Quốc gia sản xuất</label>
			                            <input id="material_country" name="material_country" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3 mb-4">
			                        <div class="col-12 col-sm-4">
			                            <label for="material_value" class="form-label">Giá tiền</label>
			                            <input id="material_value" name="material_value" type="number" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-8">
			                            <label for="material_image" class="form-label">Link ảnh</label>
			                            <input id="material_image" name="material_image" type="url" class="form-control rounded-pill border-primary p-2">
			                        </div>
			                    </div>
			
			                    <div>
			                        <button type="submit" id="addRowBtn" class="btn btn-primary w-100 py-2 rounded-pill">Thêm vật tư</button>
			                    </div>
			                </form>
			                <!-- End Form -->
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Modal -->


        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                <table id="myTable" class="table table-bordered table-striped table-hover" style="font-size: 14px;">
                    <thead>
                        <tr class="table-primary">                      
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
                            <td><img src="${material.material_image}" alt="image"></td>
                            <td>
                                <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateMaterial">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
		                            <form action="DeleteMaterial" method="post" style="display: inline;">
								        <input type="hidden" name="materialId" value="${material.material_id}">
								        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa vật tư này không?')">
								            <i class="bi bi-dash-square"></i>
								        </button>
								    </form>
                            </td>
                        </tr> 
                        </c:forEach>                                      
                    </tbody>
                </table>
            </div>
        </div>
        
      <!-- Modal -->
		<div class="modal fade" id="UpdateMaterial" tabindex="-1" aria-labelledby="UpdateMaterialLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content rounded-4 shadow-lg">
		            <div class="modal-header">
		                <h5 class="modal-title" id="UpdateMaterialLabel">Chỉnh sửa vật tư</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <form id="updateInfoForm" action="UpdateMaterial" method="post">
		                    <input type="hidden" id="material_id1" name="material_id1" value="${material.material_id}">
		
		                    <!-- Material Name & Unit -->
		                    <div class="row g-3 mb-3">
		                        <div class="col-12 col-sm-6">
		                            <label for="material_name1" class="form-label">Tên vật tư</label>
		                            <input id="material_name1" name="material_name1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                        <div class="col-12 col-sm-3">
		                            <label for="material_unit1" class="form-label">Đơn vị tính</label>
		                            <input id="material_unit1" name="material_unit1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                    </div>
		
		                    <!-- Material Description -->
		                    <div class="mb-3">
		                        <label for="material_describe1" class="form-label">Mô tả</label>
		                        <textarea name="material_describe1" id="material_describe1" class="form-control border-2 rounded-3 p-2" rows="4" required></textarea>
		                    </div>
		
		                    <!-- Production Date & Expiry -->
		                    <div class="row g-3 mb-3">
		                        <div class="col-12 col-sm-6">
		                            <label for="material_date1" class="form-label">Ngày sản xuất</label>
		                            <input id="material_date1" name="material_date1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                        <div class="col-12 col-sm-6">
		                            <label for="material_expiry1" class="form-label">Hạn sử dụng</label>
		                            <input id="material_expiry1" name="material_expiry1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                    </div>
		
		                    <!-- Usage Instructions -->
		                    <div class="mb-3">
		                        <label for="material_use1" class="form-label">Cách sử dụng</label>
		                        <textarea name="material_use1" id="material_use1" class="form-control border-2 rounded-3 p-2" rows="4" required></textarea>
		                    </div>
		
		                    <!-- Supplier & Country -->
		                    <div class="row g-3 mb-3">
		                        <div class="col-12 col-sm-9">
		                            <label for="material_supplier1" class="form-label">Nhà cung cấp</label>
		                            <input id="material_supplier1" name="material_supplier1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                        <div class="col-12 col-sm-3">
		                            <label for="material_country1" class="form-label">Quốc gia sản xuất</label>
		                            <input id="material_country1" name="material_country1" type="text" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                    </div>
		
		                    <!-- Price & Image -->
		                    <div class="row g-3 mb-4">
		                        <div class="col-12 col-sm-4">
		                            <label for="material_value1" class="form-label">Giá tiền</label>
		                            <input id="material_value1" name="material_value1" type="number" class="form-control border-2 rounded-3 p-2" required>
		                        </div>
		                        <div class="col-12 col-sm-8">
		                            <label for="material_image1" class="form-label">Link ảnh</label>
		                            <input id="material_image1" name="material_image1" type="url" class="form-control border-2 rounded-3 p-2">
		                        </div>
		                    </div>
		
		                    <!-- Submit Button -->
		                    <div>
		                        <button type="submit" class="btn btn-primary w-100 py-2 rounded-3">Xác nhận</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- End Modal -->



    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/vattu_admin.js"></script>
</body>
</html>