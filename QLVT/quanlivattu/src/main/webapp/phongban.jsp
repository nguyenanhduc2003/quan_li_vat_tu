<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí tài khoản</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/phongban.css">
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
            	 <li  id="checked" class="nav-item">
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
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Vattu_admin">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Kho_admin">
                        <i class="bi bi-archive-fill me-2"></i>
                        Nhập xuất
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
				                <form id="UpdateInfoServlet" action="UpdateInfoServlet" method="post">
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
        
        	<div class="ms-3 mt-3 mb-2 col-6 col-sm-3">
        	<div class="thongke1">
        	 Tổng số phòng ban
        	 <p>
                 <i class="bi bi-people-fill"></i>
                 <span>${totalDepartments}</span>
             </p>
        	</div>     	     
        	</div>
        	
        	
        	<div class="ms-3 mt-3 mb-2 col-6 col-sm-3">
        	<div class="thongke1">
        	Tổng số Nhân sự
        	 <p>
                 <i class="bi bi-person-workspace"></i>
                 <span>${totalPersonnel}</span>
             </p>	     
        	</div>
        	
        	</div>
        	
        	
        </div>
         
         <div class="row">
         	<div class="col bg-success text-center ms-3 me-3 rounded text-white p-3 mt-4" style="font-size: 20px;">Quản lí phòng ban</div>
         </div>

        <div class="btn-file ms-3 me-3">
            <button class="btn btn-success" onclick="exportToExcel()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
             <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddDepartment">
                     <i class="bi bi-plus"></i> Thêm phòng ban
             </button>
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                 <table id="myTable" class="table table-bordered" style="font-size: 14px;">
		            <thead class="table-primary">
		                <tr>
		                    <th>Mã phòng ban</th>
		                    <th>Tên phòng ban</th>
		                    <th>Đơn vị trực thuộc</th>
		                    <th>Chuyên ngành</th>
		                    <th>Thao tác</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="department" items="${departments}">
		                    <tr>
		                        <td>${department.department_id}</td>
		                        <td>${department.department_name}</td>
		                        <td>${department.department_unit}</td>
		                        <td>${department.department_specialized}</td>
		                        <td class="d-flex gap-2">
		                            <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateDepartment">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
		                            <form action="DeleteDepartment" method="post" style="display: inline;">
								        <input type="hidden" name="departmentId" value="${department.department_id}">
								        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa phòng ban này không?')">
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
		        
		        
		        <!-- table 2 -->
		         <div class="row">
         	<div class="col bg-success text-center ms-3 me-3 rounded text-white p-3 mt-4" style="font-size: 20px;">Quản lí nhân sự</div>
         </div>

        <div class="btn-file ms-3 me-3">
            <button class="btn btn-success" onclick="exportToExcel1()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
             <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddPersonnel">
                     <i class="bi bi-plus"></i> Thêm nhân sự
             </button>
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                 <table id="myTable1" class="table table-bordered" style="font-size: 14px;">
		            <thead class="table-primary">
		                <tr>
		                    <th>Mã nhân sự</th>
		                    <th>Tên nhân sự</th>
		                    <th>Giới tính</th>
		                    <th>Ngày sinh</th>
		                    <th>Số điện thoại</th>
		                    <th>Địa chỉ</th>
		                    <th>Mã phòng ban</th>
		                    <th>Thao tác</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="personnel" items="${personnels}">
		                    <tr>
		                        <td>${personnel.personnel_id}</td>
								<td>${personnel.personnel_name}</td>
								<td>${personnel.personnel_gender}</td>
								<td>${personnel.personnel_birthday}</td>
								<td>${personnel.personnel_phone}</td>
								<td>${personnel.personnel_address}</td>
								<td>${personnel.department_id}</td>
		                        <td class="d-flex gap-2">
		                            <button class="btn btn-primary btn-edit1" data-bs-toggle="modal" data-bs-target="#UpdatePersonnel">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
		                            <form action="DeletePersonnel" method="post" style="display: inline;">
								        <input type="hidden" name="personnelId" value="${personnel.personnel_id}">
								        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa nhân sự này không?')">
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
		        <!-- end table e -->
		        
		        
		       <!-- Modal -->
				<div class="modal fade" id="UpdateDepartment" tabindex="-1" aria-labelledby="UpdateDepartmentLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-0 d-flex justify-content-between align-items-center">
				                <h5 class="modal-title text-primary" id="UpdateDepartmentLabel">Chỉnh sửa phòng ban</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <form id="updateInfoForm" action="UpdateDepartment" method="post">
				                    <input type="hidden" id="department_id1" name="department_id1" value="${department.department_id}">
				
				                    <!-- Họ và tên & Email -->
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="department_name1" class="form-label">Tên phòng ban</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="department_name1" name="department_name1" required>
				                        </div>
				                    </div>
				
				                    <!-- Mật khẩu & Số điện thoại -->
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="department_unit1" class="form-label">Đơn vị trực thuộc</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="department_unit1" name="department_unit1" required>
				                        </div>
				                    </div>
				
				                    <!-- Ngày sinh & Vai trò -->
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="department_specialized1" class="form-label">Chuyên ngành</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="department_specialized1" name="department_specialized1" required>
				                        </div>
				                    </div>								
				                    <!-- Nút Xác nhận -->
				                    <div>
				                        <button type="submit" class="btn btn-primary btn-lg w-100 rounded-3 py-2">Xác nhận</button>
				                    </div>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal -->	 
				
				<!-- Modal -->
				<div class="modal fade" id="UpdatePersonnel" tabindex="-1" aria-labelledby="UpdatePersonnelLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-0 d-flex justify-content-between align-items-center">
				                <h5 class="modal-title text-primary" id="UpdatePersonnelLabel">Chỉnh sửa nhân sự</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <form id="updateInfoForm1" action="UpdatePersonnel" method="post">
				                    <input type="hidden" id="personnel_id1" name="personnel_id1" value="${personnel.personnel_id}">
				
				                    <!-- Họ và tên & Email -->
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="personnel_name1" class="form-label">Tên nhân sự</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="personnel_name1" name="personnel_name1" required>
				                        </div>
				                    </div>
				

				                    <div class="row mb-4">
				                        <div class="col-12 col-sm-6">
				                            <label for="personnel_gender1" class="form-label">Giới tính</label>
				                            <select id="personnel_gender1" name="personnel_gender1" class="form-select form-select-lg border-2 rounded-3 p-2" required>
				                                <option value="">Chọn giới tính</option>
				                                <option value="Nam">Nam</option>
				                                <option value="Nữ">Nữ</option>
				                                <option value="Khác">Khác</option>
				                            </select>
				                        </div>
				                         <div class="col-12 col-sm-6">
				                            <label for="personnel_birthday1" class="form-label">Ngày sinh</label>
				                            <input type="date" class="form-control form-control-lg border-2 rounded-3 p-2" id="personnel_birthday1" name="personnel_birthday1" required>
				                        </div>
				                    </div>
				
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="personnel_phone1" class="form-label">Số điện thoại</label>
				                            <input type="number" class="form-control form-control-lg border-2 rounded-3 p-2" id="personnel_phone1" name="personnel_phone1" required>
				                        </div>
				                    </div>	
				                    
				                     <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="personnel_address1" class="form-label">Địa chỉ</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="personnel_address1" name="personnel_address1" required>
				                        </div>
				                    </div>		
				                    
				                    <div class="row mb-4">
				                        <div class="col-12">
				                            <label for="department_id11" class="form-label">Mã phòng ban</label>
				                            <input type="number" class="form-control form-control-lg border-2 rounded-3 p-2" id="department_id11" name="department_id11" required>
				                        </div>
				                    </div>					


				                    <div>
				                        <button type="submit" class="btn btn-primary btn-lg w-100 rounded-3 py-2">Xác nhận</button>
				                    </div>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal -->       

        <!--them du lieu-->
        <div class="add-data ms-3 me-3">
           
          <!-- Modal -->
			<div class="modal fade" id="AddDepartment" tabindex="-1" aria-labelledby="AddDepartmentLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content border-0 shadow-lg rounded-3">
			            <div class="modal-header">
			                <h5 class="modal-title" id="AddDepartmentLabel">Thêm phòng ban mới</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!-- Form -->
			                <form id="addDepartmentForm" action="Department_admin" method="POST" onsubmit="return confirmSubmit()">
			                    <div class="row g-3">
			                        <div class="col-12 col-sm-4">
			                            <label for="department_id" class="form-label">Mã phòng ban</label>
			                            <input id="department_id" name="department_id" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			
			                        <div class="col-12 col-sm-8">
			                            <label for="department_name" class="form_label">Tên phòng ban</label>
			                            <input id="department_name" name="department_name" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12">
			                            <label for="department_unit" class="form-label">Đơn vị trực thuộc</label>
			                            <input id="department_unit" name="department_unit" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12">
			                            <label for="department_specialized" class="form-label">Chuyên ngành</label>
			                            <textarea id="department_specialized" name="department_specialized" class="form-control rounded-3 border-primary p-2" rows="3" required></textarea>
			                        </div>
			                    </div>
			
			                    <div class="mt-4">
			                        <button type="submit" id="addDepartmentBtn" class="btn btn-primary w-100 py-2 rounded-pill">Thêm dữ liệu</button>
			                    </div>
			                </form>
			                <!-- End Form -->
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Modal -->
			
			<!-- Modal -->
				<div class="modal fade" id="AddPersonnel" tabindex="-1" aria-labelledby="AddPersonnelLabel" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content border-0 shadow-lg rounded-3">
				            <div class="modal-header">
				                <h5 class="modal-title" id="AddPersonnelLabel">Thêm nhân sự mới</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <!-- Form -->
				                <form id="addPersonnelForm" action="Personnel_admin" method="POST" onsubmit="return confirmSubmit()">
				                    <div class="row g-3">
				                        <div class="col-12 col-sm-4">
				                            <label for="personnel_id" class="form-label">Mã nhân sự</label>
				                            <input id="personnel_id" name="personnel_id" type="text" class="form-control rounded-pill border-primary p-2" required>
				                        </div>
				
				                        <div class="col-12 col-sm-8">
				                            <label for="personnel_name" class="form-label">Tên nhân sự</label>
				                            <input id="personnel_name" name="personnel_name" type="text" class="form-control rounded-pill border-primary p-2" required>
				                        </div>
				                    </div>
				
				                    <div class="row g-3">
				                        <div class="col-12 col-sm-6">
				                            <label for="personnel_gender" class="form-label">Giới tính</label>
				                            <select id="personnel_gender" name="personnel_gender" class="form-select rounded-pill border-primary p-2" required>
				                                <option value="">Chọn giới tính</option>
				                                <option value="Nam">Nam</option>
				                                <option value="Nữ">Nữ</option>
				                                <option value="Khác">Khác</option>
				                            </select>
				                        </div>
				                        <div class="col-12 col-sm-6">
				                            <label for="personnel_birthday" class="form-label">Ngày sinh</label>
				                            <input id="personnel_birthday" name="personnel_birthday" type="date" class="form-control rounded-pill border-primary p-2" required>
				                        </div>
				                    </div>
				
				                    <div class="row g-3">
				                        <div class="col-12 col-sm-6">
				                            <label for="personnel_phone" class="form-label">Số điện thoại</label>
				                            <input id="personnel_phone" name="personnel_phone" type="number" class="form-control rounded-pill border-primary p-2" required>
				                        </div>
				                         <div class="col-12 col-sm-6">
				                            <label for="department_id" class="form-label">Mã phòng ban</label>
				                            <input id="department_id" name="department_id" type="number" class="form-control rounded-pill border-primary p-2" required>
				                        </div>
				                       
				                    </div>
				
				                    <div class="row g-3">
				                     	<div class="col-12">
				                            <label for="personnel_address" class="form-label">Địa chỉ</label>
				                            <input id="personnel_address" name="personnel_address" type="text" class="form-control rounded-pill border-primary p-2" required>
				                        </div>				                  
				                    </div>			
				                    <div class="mt-4">
				                        <button type="submit" id="addPersonnelBtn" class="btn btn-primary w-100 py-2 rounded-pill">Thêm dữ liệu</button>
				                    </div>
				                </form>
				                <!-- End Form -->
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal -->
			
  
        </div>       
        <!--end them du lieu-->
    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/phongban.js"></script>
</body>
</html>