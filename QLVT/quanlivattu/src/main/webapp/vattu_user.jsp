<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật tư và thiết bị</title>
    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vattu.css">
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
                <li id="checked" class="nav-item">
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
                <li class="nav-item">
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
			                                <label for="fullName" class="form-label">Họ và tên</label>
			                                <input type="text" class="form-control" id="fullName" name="fullName" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="phoneNumber" class="form-label">Số điện thoại</label>
			                                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="birthDate" class="form-label">Ngày sinh</label>
			                                <input type="text" class="form-control" id="birthDate" name="birthDate" required>
			                            </div>
			                            <div class="mb-3">
			                                <label for="address" class="form-label">Địa chỉ</label>
			                                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
			                            </div>
			                            <button type="submit" class="btn btn-primary">Cập nhật</button>
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

        <div class="content-here mt-3">

            <div class="thongke row">

                <div class="mt-3 col-12 col-sm-4">
                    <div class="thongke1">
                        Tổng số vật tư
                        <p>
                            <i class="bi bi-basket"></i>
                            <span>${totalMaterials}</span>
                        </p>
                    </div>
                </div>


            </div>
			
			<div class="card">

                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-3">
                            <ul class="list-group">
                                <li class="list-group-item" id="sort-asc">Sort A-Z</li>
                                <li class="list-group-item" id="sort-desc">Sort Z-A</li>
                            </ul>
                             <!-- Thanh tìm kiếm -->
						    <div class="mt-3">
						        <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm sản phẩm..." onkeyup="filterMaterials()">
						    </div>
                            
                        </div>
                        <div class="col-md-9">
                    
                            <div class="row" id="cardContainer">
                                 <c:forEach var="material" items="${materials}">
					            
									<div class="col-md-4 col-12 card-item" data-material-name="${material.material_name}">
                                    <div class="card" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#modal${material.material_id}">
                                        <img src="${material.material_image}" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <h5 class="card-title">${material.material_name}</h5>
                                            <p class="card-text">Click xem thông tin chi tiết</p>
                                        </div>
                                    </div>
                                	</div>
                                	
                                	<!-- Modal for Card 1 -->
                <div class="modal fade" id="modal${material.material_id}" tabindex="-1" aria-labelledby="modal${material.material_id}" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modal${material.material_id}">Mô tả Sản phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="row">
                                    <div class=" col-12 col-md-6">
                                        <label for="material_name" class="form-label">Tên sản phẩm</label>
                                        <input id="material_name" name="material_name" type="text" class="form-control" value="${material.material_name}" readonly>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label for="material_country" class="form-label">Quốc gia sản xuất</label>
                                        <input id="material_country" name="material_country" type="text" class="form-control" value="${material.material_country}" readonly>
                                    </div>
                                </div>

                                <label for="material_describe" class="form-label">Mô tả</label>
                                <textarea name="material_describe" id="material_describe" class="form-control" rows="4" readonly>${material.material_describe}
                                </textarea>

                                <div class="row">
                                    <div class="col-12 col-md-4">
                                        <label for="material_unit" class="form-label">Đơn vị</label>
                                        <input id="material_unit" name="material_unit" class="form-control" type="text" value="${material.material_unit}" readonly>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <label for="material_date" class="form-label">Ngày sản xuất</label>
                                        <input id="material_date" name="material_date" class="form-control" type="text" value="${material.material_date}" readonly>
                                    </div>

                                    <div class="col-12 col-md-4">
                                        <label for="material_expiry" class="form-label">Hạn sử dụng</label>
                                        <input id="material_expiry" name="material_expiry" class="form-control" type="text" value="${material.material_expiry}" readonly>
                                    </div>
                                </div>

                                <label for="material_use" class="form-label">Cách sử dụng</label>
                                <textarea name="material_use" id="material_use" rows="4" class="form-control" readonly> ${material.material_use}
                                </textarea>

                                <div class="row">
                                    <div class="col-12 col-md-6">
                                        <label for="material_supplier" class="form-label">Nhà cung cấp</label>
                                        <textarea name="material_supplier" id="material_supplier" class="form-control" readonly>${material.material_supplier}</textarea>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label for="material_value" class="form-label">Giá tiền</label>
                                        <input type="text" name="material_value" id="material_value" class="form-control" value="${material.material_value}" readonly>
                                    </div>
                                </div>
                                                             
                            </div>
                        </div>
                    </div>
                </div>
					            
        						</c:forEach>

                            </div>
                    
                        </div>
                    </div>
                </div>
            
                
            

            </div>
          </div>  
    </main>
    <!--end main content-->
    <script src="${pageContext.request.contextPath}/js/vattu_user.js"></script>
</body>
</html>