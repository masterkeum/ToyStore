<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>InsertMap</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">
	<script type="text/javascript">
	function sendPosNum(posNum) {
		if (confirm("Would you like to register product information in that location?")) {
			location.href = "/prod/RegInfo?positionNum=" + posNum;
		}
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
                <div class="container-fluid" style="position: relative; width: 1300px; height: 600px;">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">매장 지도</h1>

					<div style="position: absolute; width: 150px; height: 300px; left: 50px;">
						<c:forEach var="pos" items="${posList }" begin="0" end="19" step="1">
							<input type="button" value="${pos.posNum }" class="btn btn-primary" 
							style="margin: 3px; width: 50px; height: 40px;" onclick="javascript:sendPosNum(${pos.posNum })">
						</c:forEach>
					</div>
					<div style="position: absolute; width: 300px; height: 300px; left: 450px;">
						<c:forEach var="pos" items="${posList }" begin="20" end="39" step="1">
							<input type="button" value="${pos.posNum }" class="btn btn-primary" 
							style="margin: 3px; width: 50px; height: 40px;" onclick="javascript:sendPosNum(${pos.posNum })">
						</c:forEach>
					</div>
					<div style="position: absolute; width: 300px; height: 100px; left: 900px;">
						<c:forEach var="pos" items="${posList }" begin="40" end="49" step="1">
							<input type="button" value="${pos.posNum }" class="btn btn-primary" 
							style="margin: 3px; width: 50px; height: 40px;" onclick="javascript:sendPosNum(${pos.posNum })">
						</c:forEach>
					</div>
					<div style="position: absolute; width: 600px; height: 100px; left: 300px; top: 350px;">
						<c:forEach var="pos" items="${posList }" begin="50" end="89" step="1">
							<input type="button" value="${pos.posNum }" class="btn btn-primary" 
							style="margin: 3px; width: 50px; height: 40px;" onclick="javascript:sendPosNum(${pos.posNum })">
						</c:forEach>
					</div>
					<div style="position: absolute; width: 150px; height: 200px; left: 1000px; top: 250px;">
						<c:forEach var="pos" items="${posList }" begin="90" end="99" step="1">
							<input type="button" value="${pos.posNum }" class="btn btn-primary" 
							style="margin: 3px; width: 50px; height: 40px;" onclick="javascript:sendPosNum(${pos.posNum })">
						</c:forEach>
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
    <script src="/resources/vendor/jquery/jquery.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.js"></script>

</body>

</html>