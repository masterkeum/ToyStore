<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>InsertForm</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
    
<script type="text/javascript">

function formCheck() {
	
	let num = $("#prodNum").val();
	let name = $("#prodName").val();
	let price = $("#prodPrice").val();
	let stock = $("#prodStock").val();
	let boxea = $("#prodBoxea").val();
	
	if (num == "") {
		alert("Please enter product number");
		return false;
	}
	
	if (name == "") {
		alert("Please enter product name");
		return false;
	}
	
	if (isNaN(price)) {
		alert("Please enter the product price only in numbers");
		return false;
	}
	
	if (isNaN(stock)) {
		alert("Please enter the product stock only in numbers");
		return false;
	}
	
	if (isNaN(boxea)) {
		alert("Please enter the product boxQuantity only in numbers");
		return false;
	}
	
	return true;
}
	
</script>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-text mx-3">ToyWorld</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Menu</h6>
                        <a class="collapse-item" href="/prod/listForm">상품 리스트</a>
                        <a class="collapse-item" href="/prod/insertForm">상품 등록</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-dark" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>
				<c:choose>
					<c:when test="${empty sessionScope.loginId }">
						<li class="nav-item dropdown no-arrow">
                            <a class="nav-link" href="/emp/loginForm">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Login</span>
                            </a>
						</li>
						
						<div class="topbar-divider d-none d-sm-block"></div>
						
						<li class="nav-item dropdown no-arrow">
                            <a class="nav-link" href="/emp/joinForm">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Join</span>
                            </a>
						</li>
					</c:when>
					<c:otherwise>
						<!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginId }</span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-item"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
					</c:otherwise>
				</c:choose>
                        

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">상품 등록</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3"></div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form action="/prod/insert" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
	                                <table class="table table-bordered" width="100%" cellspacing="0">
		                              	<tr>
		                              		<th>상품 번호</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodNum"
                                        				name="prodNum" placeholder="ex) A001">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 이름</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodName"
                                        				name="prodName">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 분류</th>
		                              		<td>
		                              			<select name="prodCategory">
		                              				<option value="Boy">남아</option>
		                              				<option value="Girl">여아</option>
		                              				<option value="RC">RC카</option>
		                              				<option value="PM">프라모델</option>
		                              				<option value="Lego">레고</option>
		                              			</select>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 제조사</th>
		                              		<td>
		                              			<select name="prodManufacturer">
		                              				<option value="Mimi">미미월드</option>
		                              				<option value="Sonogong">손오공</option>
		                              				<option value="Academy">아카데미</option>
		                              				<option value="Young">영실업</option>
		                              				<option value="Lego">레고</option>
		                              			</select>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 내용</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodContents"
                                        				name="prodContents">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 가격</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodPrice"
                                        				name="prodPrice">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 재고</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodStock"
                                        				name="prodStock">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 입수</th>
		                              		<td>
		                              			<div class="form-group">
                                    				<input type="text" class="form-control form-control-user" id="prodBoxea"
                                        				name="prodBoxea">
                                				</div>
											</td>
		                              	</tr>
		                              	<tr>
		                              		<th>상품 이미지</th>
		                              		<td>
		                              			<input type="file" name="upload">
											</td>
		                              	</tr>
		                              	<tr>
		                              		<td colspan="2">
		                              			<input type="submit" class="btn btn-primary btn-user btn-block" value="상품 등록">
		                              		</td>
		                              	</tr>
	                                </table>
	                            </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; ToyWolrd 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">알림</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-success" href="/emp/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>

</body>

</html>