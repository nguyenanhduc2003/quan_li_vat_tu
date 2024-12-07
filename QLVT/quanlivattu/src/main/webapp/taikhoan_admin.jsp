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
                    <a class="nav-link ms-3 fade-link" href="${pageContext.request.contextPath}/Department_admin">
                        <i class="bi bi-hospital-fill me-2"></i>
                        Phòng ban & nhân sự
                    </a>
                </li>
                <li id="checked" class="nav-item">
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
        
        	<div class="ms-3 mt-3 mb-2 col-6 col-sm-3">
        	<div class="thongke1">
        	 Tổng số tài khoản
        	 <p>
                 <i class="bi bi-people-fill"></i>
                 <span>${totalAccounts}</span>
             </p>
        	</div>     	     
        	</div>
        	
        	
        	<div class="ms-3 mt-3 mb-2 col-6 col-sm-3">
        	<div class="thongke1">
        	Tổng số Admin
        	 <p>
                 <i class="bi bi-person-workspace"></i>
                 <span>${totalAdmins}</span>
             </p>	     
        	</div>
        	
        	</div>
        	  	
        	<div class="ms-3 mt-3 mb-2 col-6 col-sm-3">
     	     <div class="thongke1">
     	     	 Tổng số User
        	 <p>
                 <i class="bi bi-person-fill"></i>
                 <span>${totalUsers}</span>
             </p> 
     	     </div>	   
        	</div>
        	
        	
        </div>
         

        <div class="btn-file ms-3 me-3">
            <button class="btn btn-success" onclick="exportToExcel()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
             <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddAccount">
                     <i class="bi bi-plus"></i> Thêm tài khoản mới
             </button>
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                 <table id="myTable" class="table table-bordered" style="font-size: 14px;">
		            <thead class="table-primary">
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
		                            <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateAccount">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
		                            <form action="DeleteAccount" method="post" style="display: inline;">
								        <input type="hidden" name="accountId" value="${account.account_id}">
								        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này không?')">
								            <i class="bi bi-dash-square"></i>
								        </button>
								    </form>
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		        
		       <!-- Modal -->
				<div class="modal fade" id="UpdateAccount" tabindex="-1" aria-labelledby="UpdateAccountLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-0 d-flex justify-content-between align-items-center">
				                <h5 class="modal-title text-primary" id="UpdateAccountLabel">Chỉnh sửa tài khoản</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <form id="updateInfoForm" action="UpdateAccount" method="post">
				                    <input type="hidden" name="accountId1" value="${account.account_id}">
				
				                    <!-- Họ và tên & Email -->
				                    <div class="row mb-4">
				                        <div class="col-12 col-sm-6">
				                            <label for="fullName1" class="form-label">Họ và tên</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="fullName1" name="fullName1" required>
				                        </div>
				                        <div class="col-12 col-sm-6">
				                            <label for="email1" class="form-label">Email</label>
				                            <input type="email" class="form-control form-control-lg border-2 rounded-3 p-2" id="email1" name="email1" required>
				                        </div>
				                    </div>
				
				                    <!-- Mật khẩu & Số điện thoại -->
				                    <div class="row mb-4">
				                        <div class="col-12 col-sm-6">
				                            <label for="pass1" class="form-label">Mật khẩu</label>
				                            <input type="password" class="form-control form-control-lg border-2 rounded-3 p-2" id="pass1" name="pass1" required>
				                        </div>
				                        <div class="col-12 col-sm-6">
				                            <label for="phoneNumber1" class="form-label">Số điện thoại</label>
				                            <input type="tel" class="form-control form-control-lg border-2 rounded-3 p-2" id="phoneNumber1" name="phoneNumber1" required>
				                        </div>
				                    </div>
				
				                    <!-- Ngày sinh & Vai trò -->
				                    <div class="row mb-4">
				                        <div class="col-12 col-sm-6">
				                            <label for="birthDate1" class="form-label">Ngày sinh</label>
				                            <input type="text" class="form-control form-control-lg border-2 rounded-3 p-2" id="birthDate1" name="birthDate1" required>
				                        </div>
				                        <div class="col-12 col-sm-6">
				                            <label for="role1" class="form-label">Vai trò</label>
				                            <select id="role1" name="role1" class="form-select form-select-lg border-2 rounded-3 p-2" required>
				                                <option value="">Chọn vai trò</option>
				                                <option value="admin">admin</option>
				                                <option value="user">user</option>
				                            </select>
				                        </div>
				                    </div>
				
				                    <!-- Địa chỉ liên hệ -->
				                    <div class="mb-4">
				                        <label for="address1" class="form-label">Địa chỉ liên hệ</label>
				                        <textarea class="form-control form-control-lg border-2 rounded-3 p-2" id="address1" name="address1" rows="3" required></textarea>
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
            </div>
            
        </div>

        <!--them du lieu-->
        <div class="add-data ms-3 me-3">
           
          <!-- Modal -->
			<div class="modal fade" id="AddAccount" tabindex="-1" aria-labelledby="AddAccountLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered modal-lg">
			        <div class="modal-content border-0 shadow-lg rounded-3">
			            <div class="modal-header">
			                <h5 class="modal-title" id="AddAccountLabel">Thêm tài khoản mới</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!-- Form -->
			                <form id="addRowForm" action="Taikhoan_admin" method="POST" onsubmit="return confirmSubmit()">
			                    <div class="row g-3">
			                        <div class="col-12 col-sm-4">
			                            <label for="user-id" class="form-label">Mã người dùng</label>
			                            <input id="user-id" name="user-id" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			
			                        <div class="col-12 col-sm-8">
			                            <label for="user-name" class="form-label">Tên người dùng</label>
			                            <input id="user-name" name="user-name" type="text" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12 col-sm-7">
			                            <label for="email" class="form-label">Email</label>
			                            <input id="email" name="email" type="email" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			
			                        <div class="col-12 col-sm-5">
			                            <label for="password" class="form-label">Mật khẩu</label>
			                            <input id="password" name="password" type="password" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12 col-sm-6">
			                            <label for="phonenumber" class="form-label">Số điện thoại</label>
			                            <input id="phonenumber" name="phonenumber" type="tel" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-6">
			                            <label for="birthday" class="form-label">Ngày sinh</label>
			                            <input id="birthday" name="birthday" type="date" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12">
			                            <label for="address" class="form-label">Địa chỉ</label>
			                            <textarea name="address" id="address" class="form-control rounded-3 border-primary p-2" rows="3" required></textarea>
			                        </div>
			                    </div>
			
			                    <div class="row g-3">
			                        <div class="col-12 col-sm-6">
			                            <label for="date-create" class="form-label">Ngày tạo tài khoản</label>
			                            <input id="date-create" name="date-create" type="date" class="form-control rounded-pill border-primary p-2" required>
			                        </div>
			                        <div class="col-12 col-sm-6">
			                            <label for="role" class="form-label">Vai trò</label>
			                            <select id="role" name="role" class="form-select rounded-pill border-primary p-2" required>
			                                <option value="">Chọn vai trò</option>
			                                <option value="admin">admin</option>
			                                <option value="user">user</option>
			                            </select>
			                        </div>
			                    </div>
			
			                    <div class="mt-4">
			                        <button type="submit" id="addRowBtn" class="btn btn-primary w-100 py-2 rounded-pill">Thêm dữ liệu</button>
			                    </div>
			                </form>
			                <!-- End Form -->
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Modal -->
          
           
            <!--end form title-->
            
        </div>
        
        <!--end them du lieu-->

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/taikhoan_admin.js"></script>
</body>
</html>