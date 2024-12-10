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
                <li id="checked" class="nav-item">
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
        
        <div class="container mt-2">
    <div class="card shadow-lg rounded-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Phiếu Thống Kê Vật Tư</h5>
        </div>
        <div class="card-body">
            <!-- Thông tin tổng quan -->
            <div class="row mb-4">
                <!-- Tổng số vật tư -->
                <div class="col-md-4">
                    <div class="card border-primary">
                        <div class="card-body text-center">
                            <h6>Tổng Số Vật Tư</h6>
                            <h4 id="totalMaterials" class="text-primary">${totalMaterials}</h4>
                        </div>
                    </div>
                </div>
                <!-- Tổng số lượng nhập -->
                <div class="col-md-4">
                    <div class="card border-success">
                        <div class="card-body text-center">
                            <h6>Tổng Số Lượng Nhập</h6>
                            <h4 id="totalImported" class="text-success">${totalImported}</h4>
                        </div>
                    </div>
                </div>
                <!-- Tổng số lượng xuất -->
                <div class="col-md-4">
                    <div class="card border-danger">
                        <div class="card-body text-center">
                            <h6>Tổng Số Lượng Xuất</h6>
                            <h4 id="totalExported" class="text-danger">${totalExported}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

        

        <div class="content-here ms-3 me-3">
            <div class="btn-file">           
                <button class="btn btn-info text-white mb-3 mt-3 ms-2" data-bs-toggle="modal" data-bs-target="#AddImport"> <i class="bi bi-plus"></i> Tạo phiếu nhập</button>
                <button class="btn btn-warning text-white mb-3 mt-3 ms-2" data-bs-toggle="modal" data-bs-target="#AddExport"> <i class="bi bi-plus"></i> Tạo phiếu xuất</button>
            </div>
        </div>
        <div class="filter-container ms-3 me-3">
        <div class="row">
        <div class="col-6 col-sm-3">
        	 <label for="fromDate">Từ ngày:</label>
		    <input type="date" id="fromDate" class="form-control">
        </div>
        <div class="col-6 col-sm-3">
        	 <label for="toDate">Đến ngày:</label>
		    <input type="date" id="toDate" class="form-control">
        </div>
         <div class="col-6 col-sm-2 pt-2">
        	 <button class="btn btn-primary mt-3" onclick="filterTransactions()">Lọc dữ liệu</button>
        </div>
        </div>
		</div>
        
        
         <div class="container mt-4">
    <!-- Quản lí phiếu nhập Section -->
    <div class="row">
        <div class="col bg-primary text-center rounded text-white p-3 mb-3 shadow-sm">
            <h4>Quản lí phiếu nhập</h4>
        </div>
    </div>

    <div class="d-flex justify-content-end mb-3">
        <button class="btn btn-success" onclick="exportToExcel1()">
            Tải xuống
            <i class="bi bi-box-arrow-in-down ms-2"></i>
        </button>
    </div>

    <div class="table-responsive shadow-sm">
        <table id="myTable1" class="table table-striped table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Mã phiếu nhập</th>
                    <th>Tên phiếu nhập</th>
                    <th>Ngày nhập</th>
                    <th>Tên người nhập</th>
                    <th>Số điện thoại</th>
                    <th>Mã phòng ban</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="importt" items="${importts}">
                    <tr>
                        <td>${importt.import_id}</td>
                        <td>${importt.import_name}</td>
                        <td>${importt.import_date}</td>
                        <td>${importt.import_receiver}</td>
                        <td>${importt.import_phone}</td>
                        <td>${importt.import_department}</td>
                        <td>${importt.import_quantity}</td>
                        <td class="text-center">
                            <form action="DeleteImport" method="post" style="display: inline;">
                                <input type="hidden" name="importId" value="${importt.import_id}">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
                                    <i class="bi bi-dash-square"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Quản lí phiếu xuất Section -->
    <div class="row mt-5">
        <div class="col bg-warning text-center rounded text-white p-3 mb-3 shadow-sm">
            <h4>Quản lí phiếu xuất</h4>
        </div>
    </div>

    <div class="d-flex justify-content-end mb-3">
        <button class="btn btn-success" onclick="exportToExcel2()">
            Tải xuống
            <i class="bi bi-box-arrow-in-down ms-2"></i>
        </button>
    </div>

    <div class="table-responsive shadow-sm">
        <table id="myTable2" class="table table-striped table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Mã phiếu xuất</th>
                    <th>Tên phiếu xuất</th>
                    <th>Ngày xuất</th>
                    <th>Tên người nhận</th>
                    <th>Số điện thoại</th>
                    <th>Mã phòng ban</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="exportt" items="${exportts}">
                    <tr>
                        <td>${exportt.export_id}</td>
                        <td>${exportt.export_name}</td>
                        <td>${exportt.export_date}</td>
                        <td>${exportt.export_receiver}</td>
                        <td>${exportt.export_phone}</td>
                        <td>${exportt.export_department}</td>
                        <td>${exportt.export_quantity}</td>
                        <td class="text-center">
                            <form action="DeleteExport" method="post" style="display: inline;">
                                <input type="hidden" name="exportId" value="${exportt.export_id}">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">
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
		        
		        <div class="modal fade" id="transactionModal" tabindex="-1" aria-labelledby="transactionModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="transactionModalLabel">Thông tin giao dịch</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <table class="table table-bordered">
				                    <thead class="table-primary">
				                        <tr>
				                            <th>Ngày giao dịch</th>
				                            <th>Loại giao dịch</th>
				                            <th>Tên vật tư</th>
				                            <th>Số lượng</th>
				                        </tr>
				                    </thead>
				                    <tbody id="transactionTableBody">
				                       
				                    </tbody>
				                </table>
				            </div>
				        </div>
				    </div>
				</div>
			<!-- Modal -->
			<div class="modal fade" id="AddImport" tabindex="-1" aria-labelledby="AddImportExportLabel" aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content rounded-4 shadow-lg">
			            <div class="modal-header border-0 pb-2">
			                <h5 class="modal-title fs-5" id="AddImportExportLabel">Tạo phiếu nhập</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!-- Form để chỉnh sửa thông tin -->
			                <form action="ImportServlet" method="POST">
			                    <div class="row mb-3">
			                        <div class="col-md-6">
			                            <label for="material_name" class="form-label">Tên vật tư:</label>
			                            <select id="material_name" name="material_name" class="form-select" required>
			                                <option value="">--Chọn vật tư--</option>
			                                <c:forEach var="material" items="${materialList}">
			                                    <option value="${material.material_name}">${material.material_name}</option>
			                                </c:forEach>
			                            </select>
			                        </div>
			                        <div class="col-md-6">
			                            <label for="import_name" class="form-label">Tên phiếu nhập:</label>
			                            <input type="text" id="import_name" name="import_name" class="form-control" required>
			                        </div>
			                    </div>
			
			                    <div class="row mb-3">
			                        <div class="col-md-6">
			                            <label for="import_date" class="form-label">Ngày nhập:</label>
			                            <input type="date" id="import_date" name="import_date" class="form-control" required>
			                        </div>
			                        <div class="col-md-6">
			                            <label for="import_receiver" class="form-label">Tên người nhập:</label>
			                            <input type="text" id="import_receiver" name="import_receiver" class="form-control" required>
			                        </div>
			                    </div>
			
			                    <div class="row mb-3">
			                        <div class="col-md-6">
			                            <label for="import_phone" class="form-label">Số điện thoại:</label>
			                            <input type="number" id="import_phone" name="import_phone" class="form-control" required>
			                        </div>
			                        <div class="col-md-6">
			                            <label for="import_department" class="form-label">Phòng ban:</label>
			                            <select id="import_department" name="import_department" class="form-select" required>
			                                <option value="">--Chọn phòng ban--</option>
			                                <c:forEach var="department" items="${departments}">
			                                    <option value="${department.department_id}">${department.department_name}</option>
			                                </c:forEach>
			                            </select>
			                        </div>
			                    </div>
			
			                    <div class="row mb-3">
			                        <div class="col-md-6">
			                            <label for="import_quantity" class="form-label">Số lượng nhập:</label>
			                            <input type="number" id="import_quantity" name="import_quantity" class="form-control" required>
			                        </div>
			                    </div>
			
			                    <div class="text-center">
			                        <button type="submit" class="btn btn-primary">Nhập kho</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Modal -->
			<!-- Modal -->
				<div class="modal fade" id="AddExport" tabindex="-1" aria-labelledby="AddExportLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-0 pb-2">
				                <h5 class="modal-title fs-5" id="AddExportLabel">Tạo phiếu xuất</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <!-- Form để chỉnh sửa thông tin -->
				                <form action="ExportServlet" method="POST">
				                    <div class="row mb-3">
				                        <div class="col-md-6">
				                            <label for="material_name" class="form-label">Tên vật tư:</label>
				                            <select id="material_name" name="material_name" class="form-select" required>
				                                <option value="">--Chọn vật tư--</option>
				                                <c:forEach var="material" items="${materialList}">
				                                    <option value="${material.material_name}">${material.material_name}</option>
				                                </c:forEach>
				                            </select>
				                        </div>
				                        <div class="col-md-6">
				                            <label for="export_name" class="form-label">Tên phiếu xuất:</label>
				                            <input type="text" id="export_name" name="export_name" class="form-control" required>
				                        </div>
				                    </div>
				
				                    <div class="row mb-3">
				                        <div class="col-md-6">
				                            <label for="export_date" class="form-label">Ngày xuất:</label>
				                            <input type="date" id="export_date" name="export_date" class="form-control" required>
				                        </div>
				                        <div class="col-md-6">
				                            <label for="export_receiver" class="form-label">Tên người xuất:</label>
				                            <input type="text" id="export_receiver" name="export_receiver" class="form-control" required>
				                        </div>
				                    </div>
				
				                    <div class="row mb-3">
				                        <div class="col-md-6">
				                            <label for="export_phone" class="form-label">Số điện thoại:</label>
				                            <input type="number" id="export_phone" name="export_phone" class="form-control" required>
				                        </div>
				                        <div class="col-md-6">
				                            <label for="export_department" class="form-label">Phòng ban:</label>
				                            <select id="export_department" name="export_department" class="form-select" required>
				                                <option value="">--Chọn phòng ban--</option>
				                                <c:forEach var="department" items="${departments}">
				                                    <option value="${department.department_id}">${department.department_name}</option>
				                                </c:forEach>
				                            </select>
				                        </div>
				                    </div>
				
				                    <div class="row mb-3">
				                        <div class="col-md-6">
				                            <label for="export_quantity" class="form-label">Số lượng xuất:</label>
				                            <input type="number" id="export_quantity" name="export_quantity" class="form-control" required>
				                        </div>
				                    </div>
				
				                    <div class="text-center">
				                        <button type="submit" class="btn btn-primary">Xuất kho</button>
				                    </div>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal -->
			




    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/kho_admin.js"></script>
</body>
</html>