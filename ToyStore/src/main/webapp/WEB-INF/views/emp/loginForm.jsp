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

<title>LoginForm</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">

function formCheck() {
	let id = $("#empId").val();
	let pw = $("#empPw").val();
	
	if (id == "") {
		alert("Please enter your ID.");
		return false;
	}
    
	if (pw == "") {
		alert("Please enter your PW.");
		return false;
	}
	
	return true;
}
	
function empJoin() {
	location.href = "/emp/loginForm";
}

</script>

<style type="text/css">
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: #4e73df;
}
.content {
	font-family: system-ui, serif;
	font-size: 2rem;
	padding: 3rem;
	border-radius: 1rem;
	background: #ffffff;
	width: 35rem;
}
</style>

</head>

<body>

<div class="wrapper">
	<div class="content">
		<div class="text-center">
			<button class="btn btn-primary" onclick="empJoin();">직원 로그인</button>
 			<button class="btn btn-primary">고객 로그인</button>
		</div>
		<hr>
		<form class="user" action="/emp/login" method="post" onsubmit="return formCheck();">
		    <div class="form-group">
		        <input type="text" class="form-control form-control-user" id="empId" name="empId" placeholder="ID">
		    </div>
		    <div class="form-group">
		        <input type="password" class="form-control form-control-user" id="empPw" name="empPw" placeholder="Password">
		    </div>
		   		<input type="submit" class="btn btn-primary btn-user btn-block" value="Login">
		    <hr>
		</form>
	</div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>