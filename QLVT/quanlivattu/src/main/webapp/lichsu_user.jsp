<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử yêu cầu</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lichsu_user.css">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>

</head>
<body style="font-family: 'Noto Serif', serif;">
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
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/Vattu_user">
                        <i class="bi bi-database-fill me-2"></i>
                        Vật tư & thiết bị
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/yeucau_user.jsp">
                        <i class="bi bi-hand-index-fill me-2"></i>
                        Yêu cầu vật tư
                    </a>
                </li>
                <li id="checked" class="nav-item">
                    <a class="nav-link ms-3 m-2 fade-link" href="${pageContext.request.contextPath}/History_user">
                        <i class="bi bi-clock-history me-2"></i>
                        Lịch sử yêu cầu
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
    <main id="main-content" class="main-content h-100">

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

        <div class="content-here mt-3">

            <div class="thongke row">

                <div class="mt-3 col-12 col-sm-4">
                    <div class="thongke1">
                        Tổng phiếu đã tạo
                        <p>
                            <i class="bi bi-envelope-plus-fill"></i>
                            <span>${Tong}</span>
                        </p>
                    </div>
                </div>

                <div class="mt-3 col-12 col-sm-8">
                    <div class="row">

                       <div class="col-12 col-sm-3 thongke2 bg-success text-white">
                        Đã duyệt
                        <p>
                            <i class="bi bi-clipboard-check-fill"></i>
                            <span>${DaDuyet}</span>
                        </p>
                         
                       </div>
                       <div class="col-12 col-sm-3 thongke2 bg-primary text-white">
                            Chưa duyệt
                            <p>
                                <i class="bi bi-clipboard-minus-fill"></i>
                                <span>${DangCho}</span>
                            </p>
                       </div>
                       <div class="col-12 col-sm-3 thongke2 bg-danger text-white">
                        Không duyệt
                            <p>
                                <i class="bi bi-clipboard-x-fill"></i>
                                <span>${TuChoi}</span>
                            </p>
                       </div>
                    </div>
                </div>


            </div>

            <div class="btn-file">
                <button class="btn btn-success btn-sm" onclick="exportToExcel()">
                    Tải xuống
                    <i class="bi bi-box-arrow-in-down ms-2"></i>
                </button>
            </div>

            <div class="table-set ms-3 me-3">
                <table id="myTable" class="table table-bordered table-bordered table-striped table-hover" style="font-size:14px">
                    <thead class="table-primary">
                        <tr class="text-center">
                            <th>Email</th>
                            <th>Họ và tên</th>
                            <th>Số điện thoại</th>
                            <th>Ngày yêu cầu</th>
                            <th>Tên vật tư</th>
                            <th>Số lượng</th>
                            <th>Lý do</th>
                            <th>Ghi chú</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="request" items="${requests}">
                        <tr class="text-center">
                            <td>${request.request_email}</td>
                            <td>${request.request_name}</td>
                            <td>${request.request_phone}</td>
                            <td>${request.request_date}</td>
                            <td>${request.request_materialname}</td>
                            <td>${request.request_quantity}</td>
                            <td>${request.request_reason}</td>
                            <td>${request.request_note}</td>
                            <td class="${request.request_status == 'Đã duyệt' ? 'text-primary' : (request.request_status == 'Từ chối' ? 'text-danger' : '')}">
							    ${request.request_status}
							</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/lichsu_user.js"></script>
</body>
</html>