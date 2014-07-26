<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/timple.css" />
		<link rel="stylesheet" href="css/common.css" />
		<script src="js/vendor/modernizr.js"></script>
		<style>
			body { background-color: #383838; }
			.popup-login { display: block; }
			#main-overlay { background-color: rgba(56, 56, 56, 0.95); }
		</style>
	</head>
<body>
	<div class="popup-wrap popup-login">
		<a class="popup-close" href="#">
			<img src="images/popup_close.png" />
		</a>
		<h3>로그인</h3>
		<div class="left">
			<h6>이메일주소로 로그인</h6>
			<form method="post" id="loginForm">
				 <div class="input-wrap">			 
					<input type="text" placeholder="이메일" name="email" />
				 </div>
				 <div class="input-wrap">			 
					<input type="password" placeholder="비밀번호" name="pw" />
				 </div>
				<input class="button popup" type="submit" value="로그인" />
			</form>
 		</div>
		<div class="right">
			<h6>소셜 네트워크로 간편하게 로그인</h6>
			<button class="btn fb">
 				<span class="icon ic-fb"></span><span> Facebook</span>
 			</button>
			<button class="btn gg">
				<span class="icon ic-gg"></span><span> Google</span>
			</button>
		</div>
		<div class="bottom">
			<a href="#" id="findPwBtn">비밀번호를 잊어버리셨나요?</a> |
			<a href="#" onclick="goEmail();">아직 회원이 아니신가요?</a>
		</div>
	</div>
	<div id="container-wrap">
		<div class="main container">
			<div id="main-overlay"></div>
		</div>
	</div>	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script src="js/header.js"></script>
	<script type="text/javascript">
		var $loginEmail = $("#loginForm input[name='email']");
	//function login() {
		
		
		//메인에서 로그인 버튼 누르면 자동포커스가게 하기
		$("#loginForm").submit(function(e) {
							
			e.preventDefault();
			
			var flag = true;
			var $email = $(this).find("input[name='email']");
			var $loginPw = $(this).find("input[name='pw']");
			
			if ($email.val() == "") {
				$email.showWarning("empty").focus();
				flag = false;
			} else if (!$email.isValidEmail()) {
				$email.showWarning("wrong").focus();
				flag = false;
			}
			
			if ($loginPw.val() == "") {
				$loginPw.showWarning("empty");
				
				if ($email.val() == "") {
					$email.focus();
				} else {
					$loginPw.focus();
				}
				
				flag = false;
			}
			
			if (flag) {
				
				$.ajax({
					url: "/login.vs",
					data: $.param({
						email: $email.val(), 
						pw: $loginPw.val()
					}),
					success: function(xml) {
						var result = $(xml).find("result").text();
						if (result == 0) $email.showWarning("none");
						else if (result == 1) {
							$email.removeWarning("none");
							$loginPw.showWarning("loginFail");
						} else {
							location.replace("/projects/ProjectList.vs");
						}
					},
					error: function() {
						alert("에러 발생! 관리자에게 문의하세요.");
					}
				});
				
			}
			
		});
	//}
	
	$(".enterDefault").keypress(function(e) {
		if (e.keyCode == 13) return false;
	});

	$loginEmail.blur(function() {
		if ($(this).val() != "") {
			if ($(this).isValidEmail()) {
				$(this).removeWarning("wrong");
			} else {
				$(this).showWarning("wrong");
			}
		} else {
			$(this).removeWarning("wrong");
		}
	});
	 
	$loginEmail.on("input", function() {
		$(this).removeWarning("empty");
		$(this).removeWarning("none");
	});

	$("#loginForm input[name='pw']").on("input", function() {
		if ($(this).val != "") {
			$(this).removeWarning("empty");
			$(this).removeWarning("loginFail");
		}
	});

	</script>
</body>
</html>