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

        <div class="content-here ms-3 me-3">
            <div class="btn-file">
                <button class="btn btn-primary mb-3 mt-3" data-bs-toggle="modal" data-bs-target="#AddWarehouse"> <i class="bi bi-plus"></i> Thêm vật tư</button>
                <button class="btn btn-success" onclick="exportToExcel()">
                    Tải xuống
                    <i class="bi bi-box-arrow-in-down ms-2"></i>
                </button>
                <button class="btn btn-info text-white mb-3 mt-3 ms-5" data-bs-toggle="modal" data-bs-target="#AddImport"> <i class="bi bi-plus"></i> Tạo phiếu nhập</button>
                <button class="btn btn-warning text-white mb-3 mt-3" data-bs-toggle="modal" data-bs-target="#AddExport"> <i class="bi bi-plus"></i> Tạo phiếu xuất</button>
            </div>
            <div class="table-content">
                <table id="myTable" class="table table-bordered table-striped table-hover" style="font-size: 14px;">
                    <thead class="table-primary">
                        <tr>
                            <th>Mã vật tư kho</th>
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
                            <td>${warehouse.warehouse_id}</td>
                            <td>${warehouse.warehouse_name}</td>
                            <td>${warehouse.warehouse_supplier}</td>
                            <td>${warehouse.warehouse_quantity}</td>
                            <td class="${warehouse.warehouse_quantity < 10 ? 'text-danger' : 'text-success'}">
                            	${warehouse.warehouse_quantity < 10 ? 'Cần bổ sung' : 'Bình thường'}
                            </td>
                            <td>
                                 <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateWarehouse">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
		                            <form action="DeleteWarehouse" method="post" style="display: inline;">
								        <input type="hidden" name="warehouseId" value="${warehouse.warehouse_id}">
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
        
         <div class="row">
         	<div class="col bg-primary text-center ms-3 me-3 rounded text-white p-3 mt-4" style="font-size: 20px;">Quản lí phiếu nhập</div>
         </div>

        <div class="btn-file ms-3 me-3 mt-3">
            <button class="btn btn-success" onclick="exportToExcel1()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                 <table id="myTable1" class="table table-bordered" style="font-size: 14px;">
		            <thead class="table-primary">
		                <tr>
		                    <th>Mã phiếu nhập</th>
		                    <th>Tên phiếu nhập</th>
		                    <th>Ngày nhập</th>
		                    <th>Tên người nhập</th>
		                    <th>Số điện thoại</th>
		                    <th>Thuộc phòng ban</th>
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
		                        <td class="d-flex gap-2">
		                            <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateImport">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
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
		        </div>
		        
		        <div class="row">
         	<div class="col bg-warning text-center ms-3 me-3 rounded text-white p-3 mt-4" style="font-size: 20px;">Quản lí phiếu xuất</div>
         </div>

        <div class="btn-file ms-3 me-3 mt-3">
            <button class="btn btn-success" onclick="exportToExcel2()">
                Tải xuống
                <i class="bi bi-box-arrow-in-down ms-2"></i>
            </button>
        </div>

        <div class="content-here ms-3 me-3">
            <div class="table-content table-responsive">
                 <table id="myTable2" class="table table-bordered" style="font-size: 14px;">
		            <thead class="table-primary">
		                <tr>
		                    <th>Mã phiếu xuất</th>
		                    <th>Tên phiếu xuất</th>
		                    <th>Ngày xuất</th>
		                    <th>Tên người xuất</th>
		                    <th>Số điện thoại</th>
		                    <th>Thuộc phòng ban</th>
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
		                        <td class="d-flex gap-2">
		                            <button class="btn btn-primary btn-edit" data-bs-toggle="modal" data-bs-target="#UpdateExport">
		                                <i class="bi bi-pencil-square"></i>
		                            </button>
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
			<div class="modal fade" id="AddWarehouse" tabindex="-1" aria-labelledby="AddWarehouseLabel" aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content rounded-4 shadow-lg">
			            <div class="modal-header border-4 pb-2">
			                <h5 class="modal-title fs-5" id="AddWarehouseLabel">Thêm vật tư mới</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!-- Form -->
			                <form id="addRowForm" action="Kho_admin" method="POST" onsubmit="return confirmSubmit()">
			                    <div class="row">
			                        <div class="col-12 col-sm-6 mb-3">
			                            <label for="warehouse_id" class="form-label">Mã vật tư kho</label>
			                            <input id="warehouse_id" name="warehouse_id" type="text" class="form-control border-2 border-primary rounded-4" required>
			                        </div>
			
			                        <div class="col-12 col-sm-6 mb-3">
			                            <label for="material_id" class="form-label">Mã vật tư</label>
			                            <input id="material_id" name="material_id" type="text" class="form-control border-2 border-primary rounded-4" required>
			                        </div>
			
			                        <div class="col-12 col-sm-6 mb-3">
			                            <label for="warehouse_quantity" class="form-label">Số lượng</label>
			                            <input id="warehouse_quantity" name="warehouse_quantity" type="number" class="form-control border-2 border-primary rounded-4" required>
			                        </div>
			                        
			                        <div class="col-12 col-sm-6 mb-3">
			                            <label for="warehouse_supplier" class="form-label">Nhà cung cấp</label>
			                            <input id="warehouse_supplier" name="warehouse_supplier" type="text" class="form-control border-2 border-primary rounded-4" required>
			                        </div>
			
			                        <div class="col-12 col-sm-6 mb-3">
			                            <label for="warehouse_name" class="form-label">Tên vật tư</label>
			                            <input id="warehouse_name" name="warehouse_name" type="text" class="form-control border-2 border-primary rounded-4" required>
			                        </div>
			                    </div>
			                    
			                    <div class="d-flex justify-content-end">
			                        <button type="submit" id="addRowBtn" class="btn btn-primary px-4 py-2">Thêm dữ liệu</button>
			                    </div>
			                </form>
			                <!-- End Form -->
			            </div>
			        </div>
			    </div>
			</div>
			<!-- End Modal -->
			<!-- Modal Import -->
				<div class="modal fade" id="AddImport" tabindex="-1" aria-labelledby="ImportModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-4 pb-2">
				                <h5 class="modal-title fs-5" id="ImportModalLabel">Tạo phiếu nhập</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <!-- Form -->
				                <form id="addImportForm" action="Kho_admin1" method="POST" onsubmit="return confirmSubmit()">
				                    <div class="row">
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_id" class="form-label">Mã phiếu nhập</label>
				                            <input id="import_id" name="import_id" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_name" class="form-label">Tên phiếu nhập</label>
				                            <input id="import_name" name="import_name" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_date" class="form-label">Ngày nhập</label>
				                            <input id="import_date" name="import_date" type="date" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				                        
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_receiver" class="form-label">Tên người nhập</label>
				                            <input id="import_receiver" name="import_receiver" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_department" class="form-label">Thuộc phòng ban</label>
				                            <input id="import_department" name="import_department" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_phone" class="form-label">Số điện thoại</label>
				                            <input id="import_phone" name="import_phone" type="number" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="import_quantity" class="form-label">Số lượng</label>
				                            <input id="import_quantity" name="import_quantity" type="number" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				                    </div>
				                    
				                    <div class="d-flex justify-content-end">
				                        <button type="submit" id="addImportBtn" class="btn btn-primary px-4 py-2">Thêm phiếu nhập</button>
				                    </div>
				                </form>
				                <!-- End Form -->
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal Import -->
				<!-- Modal Export -->
				<div class="modal fade" id="AddExport" tabindex="-1" aria-labelledby="ExportModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content rounded-4 shadow-lg">
				            <div class="modal-header border-4 pb-2">
				                <h5 class="modal-title fs-5" id="ExportModalLabel">Tạo phiếu xuất</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <!-- Form -->
				                <form id="addExportForm" action="Kho_admin2" method="POST" onsubmit="return confirmSubmit()">
				                    <div class="row">
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_id" class="form-label">Mã phiếu xuất</label>
				                            <input id="export_id" name="export_id" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_name" class="form-label">Tên phiếu xuất</label>
				                            <input id="export_name" name="export_name" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_date" class="form-label">Ngày xuất</label>
				                            <input id="export_date" name="export_date" type="date" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				                        
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_receiver" class="form-label">Tên người xuất</label>
				                            <input id="export_receiver" name="export_receiver" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_department" class="form-label">Thuộc phòng ban</label>
				                            <input id="export_department" name="export_department" type="text" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_phone" class="form-label">Số điện thoại</label>
				                            <input id="export_phone" name="export_phone" type="number" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				
				                        <div class="col-12 col-sm-6 mb-3">
				                            <label for="export_quantity" class="form-label">Số lượng</label>
				                            <input id="export_quantity" name="export_quantity" type="number" class="form-control border-2 border-primary rounded-4" required>
				                        </div>
				                    </div>
				                    
				                    <div class="d-flex justify-content-end">
				                        <button type="submit" id="addExportBtn" class="btn btn-primary px-4 py-2">Thêm phiếu xuất</button>
				                    </div>
				                </form>
				                <!-- End Form -->
				            </div>
				        </div>
				    </div>
				</div>
				<!-- End Modal Export -->
				
			


	
	<!-- Modal -->
		<div class="modal fade" id="UpdateWarehouse" tabindex="-1" aria-labelledby="UpdateWarehouseLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content rounded-4 shadow-lg">
		            <div class="modal-header border-0 pb-2">
		                <h5 class="modal-title fs-5" id="UpdateWarehouseLabel">Chỉnh sửa vật tư</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <!-- Form để chỉnh sửa thông tin -->
		                <form id="UpdateWarehouse" action="UpdateWarehouse" method="POST" onsubmit="return confirmSubmit()">
		                    <div class="row">
		                        <input id="warehouse_id1" name="warehouse_id1" type="hidden" class="form-control" value="${warehouse.warehouse_id}" required>   
		                        
		                        <div class="col-12 col-sm-8 mb-3">
		                            <label for="warehouse_name1" class="form-label">Tên vật tư</label>
		                            <input id="warehouse_name1" name="warehouse_name1" type="text" class="form-control border-2 border-secondary rounded-3" required>
		                        </div>                          
		
		                        <div class="col-12 col-sm-4 mb-3">
		                            <label for="warehouse_quantity1" class="form-label">Số lượng</label>
		                            <input id="warehouse_quantity1" name="warehouse_quantity1" type="number" class="form-control border-2 border-secondary rounded-3" required>
		                        </div>
		                    </div>
		
		                    <div class="row mb-3">
		                        <div class="col-12">
		                            <label for="warehouse_supplier1" class="form-label">Nhà cung cấp</label>
		                            <input id="warehouse_supplier1" name="warehouse_supplier1" type="text" class="form-control border-2 border-secondary rounded-3" required>
		                        </div>
		                    </div>
		
		                    <div class="d-flex justify-content-end">
		                        <button type="submit" id="addRowBtn" class="btn btn-success px-4 py-2">Cập nhật</button>
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