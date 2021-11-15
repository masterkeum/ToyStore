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

<title>JoinForm</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<script type="text/javascript">

function formCheck() {
	
	let id = $("#empId").val();
	let pw = $("#empPw").val();
	let checkPW = $("#checkPw").val();
	let name = $("#empName").val();
	let email = $("#empEmail").val();
	
	if (id == "") {
		alert("아이디를 입력해주세요");
		return false;
	} else if (id.trim().length < 3 || id.trim().length > 6) {
		alert("아이디는 3~6글자로 입력해주세요");
		return false;
	}
	
	if (pw == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	} else if (pw.trim().length < 3 || pw.trim().length > 6) {
		alert("비밀번호는 3~6글자로 입력해주세요")
		return false;
	} else if (checkPW == "") {
		alert("비밀번호를 다시 입력해주세요");
		return false;
	} else if (pw != checkPW) {
		alert("비밀번호가 일치하지 않습니다")
		return false;
	}
	
	if (name == "") {
		alert("이름을 입력해주세요");
		return false;
	}
	
	if (email == "") {
		alert("이메일을 입력해주세요");
		return false;
	}
  		
	return true;
}
   	
function empLogin() {
	location.href = "/emp/joinForm";
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
			<button class="btn btn-primary" onclick="empLogin();">직원 가입</button>
 			<button class="btn btn-primary">고객 가입</button>
		</div>
		<hr>

	<form action="/emp/join" method="post" onsubmit="return formCheck();" class="user">
	    <div class="form-group">
	        <input type="text" class="form-control form-control-user" id="empId" name="empId" placeholder="ID">
	    </div>
	    <div class="form-group">
	        <input type="password" class="form-control form-control-user" id="empPw" name="empPw" placeholder="Password">
	    </div>
	    <div class="form-group">
	        <input type="password" class="form-control form-control-user" id="checkPw" placeholder="Repeat Password">
	    </div>
	    <div class="form-group">
	        <input type="text" class="form-control form-control-user" id="empName" name="empName" placeholder="name">
	    </div>
	    <div class="form-group">
	        <input type="email" class="form-control form-control-user" id="empEmail" name="empEmail" placeholder="Email">
	    </div>
    		<input type="submit" class="btn btn-primary btn-user btn-block" value="회원 가입">
	</form>
		<hr>
		
	</div>
</div>

</body>

</html>