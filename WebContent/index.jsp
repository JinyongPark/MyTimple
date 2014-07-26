<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  -->

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>팀플 | Timple</title>
<link rel="stylesheet" href="css/timple.css" />
<link rel="stylesheet" href="css/common.css" />
<script src="js/vendor/modernizr.js"></script>
<style>
.profileleft {
	float: left;
	margin: 3px;
	width: 48%;
	height: 95px;
	margin-bottom: 65px;
	
}

.profileright {
	float: right;
	margin: 3px;
	width: 48%;
	height: 95px;
	margin-bottom: 65px;
}

.imgprofile {
	float: left;
	border-radius: 50%;
}

.profileleft p,.profileright p {
	float: left;
	padding-left: 10px;
	font-size: 11pt;
	width: 80%;
}
.name_pf{clear: both; position:absolute; margin-top: 80px;}
li h5{ text-align: center;}
li img{ margin-left: 40px;}

.sub.container ul li{ margin-bottom: 10px;}
</style>
</head>
<body>

	<div class="popup-mask"></div>
	<div class="popup-mask-dark"></div>

	<!-- 회원 로그인 -->
	<div class="popup-wrap popup-login">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
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
			<a href="#" id="findPwBtn">비밀번호를 잊어버리셨나요?</a> | <a href="#"
				onclick="goEmail();">아직 회원이 아니신가요?</a>
		</div>
	</div>

	<!-- 관리자 로그인 -->
	<div class="popup-wrap popup-admin">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>관리자 로그인</h3>
		<div class="middle">
			<form id="adminForm">
				<div class="input-wrap">
					<input type="text" placeholder="아이디" name="id" />
				</div>
				<div class="input-wrap">
					<input type="password" placeholder="비밀번호" name="pw" />
				</div>
				<input class="button popup alert" type="submit" value="로그인" />
			</form>
		</div>
	</div>
	
	<!-- 회원 로그인 창에서 >> 이메일 찾기 버튼-->	
	<div class="popup-wrap popup-find email">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>이메일 찾기</h3>
		<div class="middle">
			<h6>이름과 전화번호를 입력해 주세요.</h6>
			<form method="post" id="findEmailForm">
				<div class="input-wrap">
					<input class="enterDefault" type="text" placeholder="이름"
						name="name" />
				</div>
				<div class="row">
					<div class="small-3 columns" style="padding-left: 0px;">
						<select class="tel_first" name="tel_first"></select>
					</div>
					<div class="small-9 columns" style="padding: 0px;">
						<input type="text" placeholder="나머지 번호" name="tel" maxlength="8" />
					</div>
				</div>
				<input class="button popup" type="submit" value="이메일 찾기" />
			</form>
		</div>
		<div class="bottom">
			<a href="#" onclick="goLogin();">로그인 화면으로 돌아가기</a>
		</div>
	</div>

	<!-- 회원 로그인 창에서 >> 비밀번호 찾기 버튼 -->
	<!-- 1차 -->
	<div class="popup-wrap popup-find pw">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>비밀번호 찾기</h3>
		<div class="middle">
			<h6>이름과 이메일 주소를 입력해 주세요.</h6>
			<form method="get" id="findPwForm">
				<div class="input-wrap">
					<input class="enterDefault" type="text" placeholder="이름"
						name="name" />
				</div>
				<div class="input-wrap">
					<input type="text" placeholder="이메일" name="email" />
				</div>
				<input class="button popup" type="submit" value="다음 단계로" />
			</form>
		</div>
		<div class="bottom">
			<a href="#" onclick="goLogin();">로그인 화면으로 돌아가기</a>
		</div>
	</div>
	
	<!-- 회원 로그인 창에서 >> 비밀번호 찾기 버튼 -->
	<!-- 2차 -->
	<div class="popup-wrap popup-find pw2">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>비밀번호 찾기</h3>
		<div class="middle">
			<h6>회원가입시 등록한 질문과 답변을 입력해 주시면 임시 비밀번호를 발급해 드립니다. 로그인하셔서 마이페이지에서
				비밀번호 변경 꼭 해주세요!</h6>
			<form method="get" id="resetPwForm">
				<h6>
					<b>질문. </b><span id="memQuestion"></span>
				</h6>
				<div class="input-wrap">
					<input type="text" placeholder="답변" name="quereply" />
				</div>
				<input class="button popup" type="submit" value="임시 비밀번호 발급" />
			</form>
		</div>
		<div class="bottom">
			<a href="#" onclick="goLogin();">로그인 화면으로 돌아가기</a>
		</div>
	</div>
	
	<!-- 회원 로그인 창에서 >> 비밀번호 찾기 버튼 -->
	<!-- 3차 -->
	<div class="popup-wrap popup-find resetPw">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>비밀번호 찾기</h3>
		<div class="middle">
			<h6>임시 비밀번호가 발급되었습니다. 이번엔 기억하기 쉬운걸로 바꿔주세요.</h6>
			<h6>
				<b>임시 비밀번호. </b><span id="newPw"></span>
			</h6>
			<input class="button popup" type="button" value="확인" />
		</div>
	</div>
	
	<!-- 회원가입 -->
	<!-- 1차 -->
	<div class="popup-wrap popup-signup">
		<a class="popup-close" href="#"> <img src="images/popup_close.png" />
		</a>
		<h3>회원가입</h3>
		<div class="middle">
			<h6>쉽고 간단하게 팀플에 가입해보세요!</h6>
			<form action="/addMember.vs" method="post" id="signupForm">
				<div class="input-wrap">
					<input class="enterDefault required" type="text" placeholder="이름"
						name="name" />
				</div>
				<div class="input-wrap">
					<input class="enterDefault required" type="password"
						placeholder="비밀번호" name="pw" />
				</div>
				<div class="input-wrap">
					<input class="enterDefault required" type="password"
						placeholder="비밀번호 확인" name="check_pw" />
				</div>
				<div class="input-wrap">
					<select class="enterDefault" name="questionId" id="questionId">
						<option value="0" selected="selected">비밀번호 재설정 질문을
							선택해주세요!</option>
						<c:forEach items="${questionList}" var="content" varStatus="loop">
							<option value="${loop.index + 1}">${content}</option>
						</c:forEach>
					</select>
				</div>
				<div class="input-wrap">
					<input type="text" placeholder="답변" name="quereply" id="quereply" />
				</div>
				<input type="checkbox" name="inform" id="inform" checked="checked" />
				<span class="check-label">팀 프로젝트 초대 알림에 동의합니다. </span> <input
					type="hidden" name="email" /> <input class="button popup"
					type="submit" value="회원가입하기" />
			</form>
		</div>
		<div class="bottom">
			이미 회원이신가요? <a href="#" onclick="goLogin();">로그인 </a>해주세요!
		</div>
	</div>

		
	<%-- <div class="popup-wrap popup-info">
		<a class="popup-close" href="#">
			<img src="images/popup_close.png" />
		</a>
		<h3>추가 입력 정보</h3>
		<div class="middle">
			<h6>팝업창 설명 부분입니다......</h6>
			<div class="row">
				<div class="row">
					<div class="small-3 columns" style="padding-left: 0px;">
						<select class="tel_first enterDefault" name="tel_first"></select>
					</div>
					<div class="small-9 columns" style="padding: 0px;">
						<input class="required" type="text" placeholder="나머지 번호" name="tel" maxlength="8" />
					</div>
				</div>
				<div class="input-wrap">				 
					<select class="enterDefault" name="oneCategory" id="oneCategory">
						<option value="0">업종 대분류</option>
						<c:forEach items="${oneCategoryList}" var="oneName" varStatus="loop">
						<option value="${loop.index + 1}">${oneName}</option>
						</c:forEach>
					</select>
			 	</div>
				<select class="enterDefault" name="twocategory" id="twoCategory">
					<option value="0">업종 소분류</option>
				</select>
				<select class="enterDefault" name="career">
					<option value="0">경력</option>
					<option value="1">1년 이하</option>
					<option value="2">2년 이하</option>
					<option value="3">3년 이하</option>
					<option value="4">4년 이하</option>
					<option value="5">5년 이하</option>
				</select>
				<input class="button popup" type="submit" value="정보입력" />
			</div>
		</div>
	</div> --%>

	<jsp:include page="/header.vs"></jsp:include>

	<!-- 프로그램 설명부분, 프로그램 하단부 -->
	<div id="container-wrap">
		<div class="main container">
			<h2 class="ttl">팀플로 프로젝트를 관리해보세요!</h2>
			<h6 class="ttl">The Most Powerful &amp; Yet Simple Way to Manage
				Your Projects &amp; Team</h6>
			<div id="signup-container">
				<button class="btn fb">
					<span class="icon ic-fb"></span><span> Facebook</span>
				</button>
				<button class="btn gg">
					<span class="icon ic-gg"></span><span> Google</span>
				</button>
				<div class="horiz-bar">
					<span class="horiz-bar-line"></span> <span class="centered">또는</span>
					<span class="horiz-bar-line"></span>
				</div>
				<input type="text" placeholder="이메일" name="email" id="mn-email"
					autofocus /> <input class="button mn-signup" type="button"
					value="이메일로 10초만에 가입" />
			</div>
			<div id="main-overlay"></div>
		</div>
		<div class="sub container" style="height: 500px;">
			<ul class="small-block-grid-3">
				<li><img src="images/timple_f1.png" />
					<h5>체계적 업무 관리</h5>					
						<ul class="detail">
							<li>손쉽게 업무를 추가할 수 있습니다.</li>
							<li>업무등록 기간과 담당자를 설정하여 효율적인 자원관리가 가능합니다.</li>
							<li>업무의 진행 상태에 따라 Plan의 진행률과 프로젝트 진행률을 확인할 수 있습니다.</li>
							<li>Overview를 통해 실시간으로 업무 업데이트를 확인할 수 있습니다.</li>
						</ul>					
				</li>
				<li><img src="images/timple_f2.png" />
					<h5>팀원 충원</h5>
					<ul class="detail">
							<li>프로젝트의 충원여부를 통해서 새로운 팀원을 모집할 수 있고, 팀원관리를 통해 참가신청을 한 회원을 관리할 수 있습니다.</li>
							<li>팀원관리에서 정보공개를 한 회원을 검색하여 참여요청을 할 수 있습니다.</li>
						</ul>
				</li>
				<li><img src="images/timple_f3.png" />
					<h5>내 입맛에 맞는 설정</h5>
					<ul class="detail">
							<li>각종 성격에 맞는 게시판을 추가하여 권한을 부여할 수 있습니다.</li>
							<li>환경설정에서 손쉽게 프로젝트 테마를 변경할 수 있습니다.</li>
						</ul>
				</li>
			</ul>
		</div>
		<div class="sub container">
			<div>
				<h2>
					전세계에서 사용하는 팀플!<br />팀플로 성공적으로 프로젝트를 마쳤던 사람들의 이야기
				</h2>
			</div>
			<div class="profileleft">
				<img src="images/profile/teacher.jpg" alt="sein.jpg"
					class="imgprofile" />
				<p>
					팀플을 이용해서 업무효율을 200% 올릴 수 있었습니다!!<br />정말 강추!!<br /><br />
				</p>
				<div class="name_pf"><b>박세인</b> (41, Professor )</div>
			</div>
			
			<div class="profileright">
				<img src="images/profile/seungmin.png" alt="seungmin.png"
					class="imgprofile" />
				<p>
					저에게 맞는 프로젝트를 찾지 못해 원치 않는 휴가를 지내고 있었습니다. 하지만 팀플을 통해 저에게 맞는 프로젝트를 찾게 되었고 다시 일을 시작할 수 있게 되었습니다!!^^
				</p>
				<div class="name_pf"><b>이승민</b> (26, Netizen )</div>
			</div>
			<div class="profileleft">
				<img src="images/profile/mansour.jpg" alt="mansour.jpg"
					class="imgprofile" />
				<p>
					<br />هذا البرنامج هو عظيم حقا. من خلال هذا البرنامج، وقد حصل
					فريقنا أرباح هائلة فيه!<br /><br />
				</p>
				<div class="name_pf"><b>Sheikh Mansour</b> (44, ManCity Owner )</div>
			</div>
			<div class="profileright">
				<img src="images/profile/lindltaylor.JPG" alt="lindltaylor.jpg"
					class="imgprofile" />
				<p>
					Wow!! It is a very nice program!!! Using this program,<br /> our
					team won Super Fantastic Elegance Contest developing <br />new
					social network technology festival.
				</p>
				<div class="name_pf"><b>Lind.L.Taylor</b> (35, Criminal )</div>
			</div>
			<div class="profileleft">
				<img src="images/profile/sanguk.jpg" alt="sanguk.jpg"
					class="imgprofile" />
				<p>
					팀원들이 통제불가능 하여 프로젝트 진행에 차질이 많았습니다.<br /> 하지만 팀플을 통해 팀원들의 업무 진행상황을 철저히 감시할 수 있었습니다.
				</p>
				<div class="name_pf"><b>안상욱</b> (25, Project Manager )</div>
			</div>
			<div class="profileright">
				<img src="images/profile/kwangjoh.jpg" alt="kwangjoh.jpg"
					class="imgprofile" />
				<p>
					캬~!!테마를 변경할 수 있다는 것은 저에게 있어서 ‘신의 한수’<br /> 였습니다! 테마변경을 통해 우리
					프로젝트화면을 더 아기자기하게 꾸몄고 업무효율도 증대되었습니다!
				</p>
				<div class="name_pf"><b>신광조</b> (25, Gamer )</div>
			</div>
			<div class="profileleft">
				<img src="images/profile/kagawa.jpg" alt="kagawa.jpg"
					class="imgprofile" />
				<p>
					このプログラムは、本当に素晴らしいです。私たちのチームは、<br />このプログラムを通じて、莫大な収益を稼ぐかけました！<br /><br />
				</p>
				<div class="name_pf"><b>Kagawa Shinji</b> (26, Soccer player )</div>
			</div>
			<div class="profileright">
				<img src="images/profile/mingyu.jpg" alt="mingyu.jpg"
					class="imgprofile" />
				<p>
					예전에는 체계없이 프로젝트를 진행하였다 낭패를 보았습니다.<br />하지만 팀플을 이용한 후 전혀 그런 걱정을 하지 않게 되었습니다.<br /><br />
				</p>
				<div class="name_pf"><b>박민규</b> (32, Web Programmer )</div>
			</div>
		</div>
	</div>



	<div id="fb-root"></div>
	<%@ include file="base/footer.jsp"%>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/social.js"></script>
	<script src="//apis.google.com/js/client.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script src="js/header.js"></script>

	<script>
		var $mn_email = $('#mn-email'); // 메인화면 이메일 입력창

		function signUp() {

			if ($mn_email.val() == '') {
				$mn_email.showWarning("empty").focus();
			} else if ($mn_email.isValidEmail()) {

				$.ajax({
					url : "emailCheck.vs",
					data : {
						email : $mn_email.val()
					},
					success : function(xml) {
						if ($(xml).find("result").text() == 0) {
							$mn_email.removeWarningAll();
							$(".popup-mask").show();
							$(".popup-signup").show();
							$name.focus();
						} else {
							$mn_email.showWarning("duplicate");
						}
					},
					error : function() {
						alert("ERROR: mn-signup emailCheck ajax error!");
					}
				});

			} else {
				$mn_email.showWarning("wrong").focus();
			}
		}

		$('.button.mn-signup').on('click', signUp); // 메인화면에서 가입 버튼 클릭시
		$('.btn.fb').on('click', fb_login); // 페이스북 버튼 클릭시
		$('.btn.gg').on('click', auth); // 구글 버튼 클릭시

		// 가끔 제멋대로 메인에서 email_empty 에러가 나올때가 있음.
		// 메인에서 페이스북, 구글 버튼 클릭시 warning 띄우지 않게 하기.

		var $signEmail = $("#signup-container input[name='email']");
		var $loginEmail = $("#loginForm input[name='email']");

		var $name = $("#signupForm input[name='name']");
		var $pw = $("#signupForm input[name='pw']");
		var $check_pw = $("#signupForm input[name='check_pw']");
		var $tel_first = $("#signupForm select[name='tel_first']"); // option:selected
		var $tel = $("#signupForm input[name='tel']");

		$("#oneCategory").change(
				function() {

					$(this).removeWarning("notSelect");
					$("#twoCategory option").each(function() {
						if ($(this).val() > 0)
							$(this).remove();
					});
					$("#twoCategory option[value='" + 0 + "']").prop(
							"selected", true);

					if ($(this).val() != 0) {

						$.ajax({
							url : "/ajax_twocategory.vs?oneCategorySeq="
									+ $(this).val(),
							success : function(xml) {
								$(xml).find("twoName").each(function(index) {
									$("#twoCategory").append($("<option/>", {
										value : index + 1,
										text : $(this).text()
									}));
								});
							}
						});
					}

				});

		$("#twoCategory").on("click", function() {
			if ($("#oneCategory option:selected").val() == "0")
				$("#oneCategory").showWarning("notSelect");
		});

		login();

		$("#loginBtn").click(function() {
			$(".popup-mask").show();
			$(".popup-login").show();
			$loginEmail.focus();
		});

		$("#findEmailBtn").click(function(e) {
			$(".popup-wrap").hide();
			$(".popup-find.email").show();
		});

		$("#findPwBtn").click(function(e) {
			$(".popup-wrap").hide();
			$(".popup-find.pw").show();
		});

		$(".popup-find.resetPw input").click(function(e) {
			$(".popup-find.resetPw").hide();
			$(".popup-login").show();
		});

		$("#findPwForm").submit(function(e) {
			e.preventDefault();

			$fp_name = $(this).find("input[name='name']");
			$fp_email = $(this).find("input[name='email']");

			if ($fp_name.val() == "")
				$fp_name.showWarning("empty").focus();
			if ($fp_email.val() == "")
				$fp_email.showWarning("empty").focus();

			$(".war-state").each(function() {
				$thisName = $(this).attr("name");

				if ($thisName == "name") {
					$(this).focus();
					return false;
				}
				if ($thisName == "email") {
					$(this).focus();
					return false;
				}
			});

			if ($(".war-state").length == 0) {

				$.ajax({
					url : "/getMemQuestion.vs",
					data : $(this).serialize(),
					success : function(xml) {
						$("#memQuestion").text($(xml).find("result").text());
						$(".popup-find.pw").hide();
						$(".popup-find.pw2").show();
					},
					error : function() {
						alert("비밀번호 찾기 모듈 에러!");
					}
				});
			}
		});

		$("#resetPwForm").submit(function(e) {
			e.preventDefault();

			$.ajax({
				url : "/quereplyCheck.vs",
				data : $(this).serialize(),
				success : function(xml) {
					if ($(xml).find("isResult").text() == "1") {
						$("#newPw").text($(xml).find("newPw").text());
						$(".popup-find.pw2").hide();
						$(".popup-find.resetPw").show();
					} else {
						alert("틀렸습니다...");
					}
				},
				error : function() {
					alert("비밀번호 재설정 실패");
				}
			});
		});

		function login() {

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
						url : "/login.vs",
						data : $.param({
							email : $email.val(),
							pw : $loginPw.val()
						}),
						success : function(xml) {
							var result = $(xml).find("result").text();
							if (result == 0)
								$email.showWarning("none");
							else if (result == 1) {
								$email.removeWarning("none");
								$loginPw.showWarning("loginFail");
							} else {
								location.replace("/projects/ProjectList.vs");
							}
						},
						error : function() {
							alert("에러 발생! 관리자에게 문의하세요.");
						}
					});

				}

			});
		}

		$(".enterDefault").keypress(function(e) {
			if (e.keyCode == 13)
				return false;
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

		$(".popup-close").click(function(e) {

			$(".popup-wrap input[type=text]").val("");
			$(".popup-wrap input[type=password]").val("");
			$(".war-text").remove();
			$(".war-state").removeClass("war-state");

			$(".popup-mask").hide();
			$(".popup-wrap").hide();
			$(".popup-mask-dark").hide();

			$signEmail.focus(); // test 용.. 변수명 바꿔야함

		});

		$signEmail.on("keyup", function(e) {
			if (e.keyCode == 13) {
				signUp();
			} else if ($(this).val() != "") {
				$(this).removeWarning("empty");
				$(this).removeWarning("duplicate");
			}
		});

		$signEmail.blur(function() {

			if ($(this).val() != "") {
				if (!$(this).isValidEmail()) {
					if ($(".war-text").length == 0) {

						$(this).showWarning("wrong");

					}
				} else {
					$(this).removeWarning("wrong");
				}
			}
		});

		$(".check-label").click(function() {
			if ($("#inform").is(":checked"))
				$("#inform").prop("checked", false);
			else
				$("#inform").prop("checked", true);
		});

		$("#signupForm").submit(function(e) {

			e.preventDefault();

			$qi = $("#questionId");
			$qr = $(this).find("#quereply");

			if ($name.val() == "")
				$name.showWarning("empty").focus();
			if ($pw.val() == "")
				$pw.showWarning("empty").focus();
			if ($check_pw.val() == "")
				$check_pw.showWarning("mismatch").focus();
			if ($qi.find("option:selected").val() == 0)
				$qi.showWarning("empty");
			if ($qr.val() == "")
				$qr.showWarning("empty").focus();

			// 유효성 나머지 추가해야함

			$(".war-state.required").each(function() {
				$thisName = $(this).attr("name");

				if ($thisName == "name") {
					$(this).focus();
					return false;
				}
				if ($thisName == "pw") {
					$(this).focus();
					return false;
				}
				if ($thisName == "check_pw") {
					$(this).focus();
					return false;
				}
			});

			// 유효성 검사 완료. 회원가입
			if ($(".war-state.required").length == 0) {

				$("#signupForm input[type='hidden']").val($mn_email.val());
				this.submit();
			}

		});

		$("#signupFinalForm").submit(function(e) {

			e.preventDefault();

			$.ajax({
				url : "/addMember.vs",
				data : $.param({
					email : $("#email").val(),
					name : $name.val(),
					pw : $pw.val(),
					tel : $tel_first.val() + $tel.val(),
					inform : $("#inform").val(),
					quereply : $("#quereply").val()
				}),
				complete : function(xhr, data) {
					if (xhr.status == 0)
						console.log("ERROR: Add Member failed");
					else
						console.log("done");
				}
			});

		});

		$name.blur(function() {
			if ($(this).val() != "") {
				if ($(this).val().length < 2) {
					$(this).showWarning("short");
				} else if (!$(this).isValidName()) {
					$(this).showWarning("wrong");
				} else {
					$(this).removeWarning("short");
					$(this).removeWarning("wrong");
				}
			} else {
				$(this).showWarning("empty");
			}
		});

		$name.on("input", function() {
			$(this).removeWarning("empty");
		});

		$pw.blur(function() {
			if ($(this).val() != "") {
				if (!$(this).isValidPassword()) {
					$(this).showWarning("wrong");
				} else {
					$(this).removeWarning("wrong");
				}
			} else {
				$(this).showWarning("empty");
			}
		});

		$pw.on("input", function() {
			$(this).removeWarning("empty");
		});

		$check_pw.blur(function() {
			if ($(this).val() != "") {
				if ($(this).val() != $pw.val()) {
					$(this).showWarning("mismatch");
				} else {
					$(this).removeWarning("mismatch");
				}
			} else {
				$(this).showWarning("mismatch");
			}
		});

		$check_pw.on("input", function() {
			if ($(this).val() != "") {
				if ($(this).val() != $pw.val()) {
					$(this).showWarning("mismatch");
				} else {
					$(this).removeWarning("mismatch");
				}
			} else {
				$(this).showWarning("mismatch");
			}
		});

		$.each(tel_array, function(index, arr) {
			$(".tel_first").append($("<option/>", {
				value : arr,
				text : arr
			}));
		});

		$tel.blur(function() {
			if ($(this).val() != "") {
				if (!$(this).isValidTel()) {
					$(this).showWarning("wrong");
				} else {
					$(this).removeWarning("empty");
					$(this).removeWarning("wrong");
				}
			} else {
				$(this).showWarning("empty");
			}
		});

		$tel.on("input", function() {
			if ($(this).val() != "") {
				if (!$(this).isValidTel()) {
					$(this).showWarning("wrong");
				} else {
					$(this).removeWarning("empty");
					$(this).removeWarning("wrong");
				}
			} else {
				$(this).showWarning("empty");
			}
		});

		$("#footer #alpha").on("click", function() {
			$(".popup-mask-dark").show();
			$(".popup-admin").show();
			$("#adminForm input[name='id']").focus();
		});

		$("#adminForm").submit(function(e) {
			e.preventDefault();

			$.ajax({
				type : "post",
				url : "/adminLogin.vs",
				data : $(this).serialize(),
				success : function(xml) {
					if ($(xml).find("result").text() == "1")
						alert("관리자 로그인 성공!");
					else {
						alert("아이디 또는 비밀번호를 확인하세요.");
					}
				},
				error : function() {
					alert("Ajax 오류입니다. 관리자에게 문의하세요.");
				}
			});
		});

		function goEmail() {
			$(".popup-wrap input[type=text]").val("");
			$(".popup-wrap input[type=password]").val("");
			$(".war-text").remove();
			$(".war-state").removeClass("war-state");

			$(".popup-mask").hide();
			$(".popup-wrap").hide();
			$(".popup-mask-dark").hide();

			$signEmail.showWarning("empty").focus();
		}

		function goLogin() {
			$signEmail.val("");
			$(".popup-wrap input[type=text]").val("");
			$(".popup-wrap input[type=password]").val("");
			$(".war-text").remove();
			$(".war-state").removeClass("war-state");

			$(".popup-wrap").hide();
			$(".popup-login").show();
			$loginEmail.focus();
		}
	</script>

</body>
</html>
