<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyệt yêu cầu</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/duyet_admin.css">
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
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Taikhoan_admin">
                        <i class="bi bi-person-circle me-2"></i>
                        Quản lí tài khoản
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Vattu_admin">
                        <i class="bi bi-layers-fill me-2"></i>
                        Quản lí vật tư
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Kho_admin">
                        <i class="bi bi-archive-fill me-2"></i>
                        Quản lí kho
                    </a>
                </li>
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Duyet_admin">
                        <i class="bi bi-bookmark-fill me-2"></i>
                        Duyệt yêu cầu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Cungcap_admin">
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
        
         <div class="mt-3 col-12 col-sm-8">
                    <div class="row">

                       <div class="ms-3 col-12 col-sm-3 thongke2 bg-success text-white">
                        Yêu cầu đã duyệt
                        <p>
                            <i class="bi bi-clipboard-check-fill"></i>
                            <span>${totalDuyet}</span>
                        </p>
                         
                       </div>
                       <div class="col-12 col-sm-3 thongke2 bg-primary text-white">
                            Yêu cầu đã từ chối
                            <p>
                                <i class="bi bi-clipboard-minus-fill"></i>
                                <span>${totalTuchoi}</span>
                            </p>
                       </div>
                       <div class="col-12 col-sm-3 thongke2 bg-danger text-white">
                        Yêu cầu đang chờ
                            <p>
                                <i class="bi bi-clipboard-x-fill"></i>
                                <span>${totalCho}</span>
                            </p>
                       </div>
                    </div>
                </div>

        <div class="content-here ms-3 me-3">
            <div class="btn-file mt-4">
                <button class="btn btn-success" onclick="exportToExcel()">
                    Tải xuống
                    <i class="bi bi-box-arrow-in-down ms-2"></i>
                </button>
            </div>
            <div class="table-content mt-4">
                <table id="myTable" class="table table-bordered table-striped" style="font-size: 14px;">
                    <thead class="table-primary">
                    <tr>
                    	<th>Mã</th>
                        <th>Họ và Tên</th>
                        <th>Email</th>
                        <th>Số Điện Thoại</th>
                        <th>Ngày Yêu Cầu</th>
                        <th>Tên Vật Tư</th>
                        <th>Số Lượng</th>
                        <th>Lý Do</th>
                        <th>Ghi Chú</th>
                        <th>Trạng Thái</th>
                        <th>Thao Tác</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="request" items="${requests}">
                        <tr>
                            <td>${request.request_id}</td>
                            <td>${request.request_name}</td>
                            <td>${request.request_email}</td>
                            <td>${request.request_phone}</td>
                            <td>${request.request_date}</td>
                            <td>${request.request_materialname}</td>
                            <td>${request.request_quantity}</td>
                            <td>${request.request_reason}</td>
                            <td>${request.request_note}</td>
                            <td class="${request.request_status == 'Đã duyệt' ? 'text-primary' : (request.request_status == 'Từ chối' ? 'text-danger' : '')}">
							    ${request.request_status}
							</td>

                            <td class="action-cell">
                                <button class="btn btn-primary btn-sm btn-edit" data-bs-toggle="modal" data-bs-target="#Duyet"><i class="bi bi-pencil-square"></i></button>                              
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Modal -->
			        <div class="modal fade" id="Duyet" tabindex="-1" aria-labelledby="DuyetLabel" aria-hidden="true">
			            <div class="modal-dialog">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <h5 class="modal-title" id="DuyetLabel">Chọn thao tác</h5>
			                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                    </div>
			                    <div class="modal-body">
			                        <form id="Duyet" action="Duyet" method="post">
			                        <input type="hidden" id="request_id" name="request_id" value="${request.request_id}">
			                        	<select id="request_status" name="request_status" class="form-select" required>
								                <option value="">Chọn thao tác</option>
								                <option value="Đã duyệt">Duyệt</option>
								                <option value="Từ chối">Từ chối</option>
								            </select>			                        
			                            <button type="submit" class="btn btn-primary mt-3">Xác nhận</button>
			                            			                       
			                        </form>
			                    </div>
			                </div>
			            </div>
			        </div>
			    
                <!-- end Modal -->

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/duyet_admin.js"></script>
</body>
</html>