<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../css/timple.css" />
		<link rel="stylesheet" href="../css/common.css" />
		<script src="../js/vendor/modernizr.js"></script>
		<style>
			#modify-wrap { padding: 100px; }
			.fm-box input, .fm-box select { width: 275px; margin: 0px; }
			#editMemberForm .left { width: 120px; height: 37px; line-height: 37px; margin-right: 20px; text-align: right; }
			.fm-box { width: 700px; height: 70px; border-bottom: 1px solid #EBE8E8; padding: 16px 0;}
		</style>
	</head>
<body>
<c:if test="${loginSeq != null }">
	<jsp:include page="/header.vs"></jsp:include>
	
	<div id="modify-wrap">
		<h3>회원정보 설정</h3>
		
		<form action="/editMemberOk.vs" method="post" id="editMemberForm" enctype="multipart/form-data">
			
			<div class="fm-box">
				<label class="left">프로필 사진</label>
				<div class="input-wrap">
					<input type="file" value="사진올리기" name="attach" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">이메일</label>
				<div class="input-wrap">
					<input class="enterDefault" type="text" name="email" id="email" value="${member.email}"/>
				</div>
			</div>
			<div class="fm-box">
				<label class="left">이름</label>
				<div class="input-wrap">
					<input class="enterDefault" type="text" name="name" id="name" value="${member.name}"/>
				</div>
			</div>
			<div class="fm-box">
				<label class="left">현재 비밀번호</label>
				<div class="input-wrap">
					<input class="enterDefault" type="password" name="crt_pw" id="crt_pw" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">비밀번호</label>
				<div class="input-wrap">
					<input class="enterDefault" type="password" name="pw" id="pw" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">비밀번호 확인</label>
				<div class="input-wrap">
					<input class="enterDefault" type="password" name="check_pw" id="check_pw" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">비밀번호 재설정 질문</label>
				<div class="input-wrap">
					<select class="enterDefault" name="questionId" id="questionId">
					 	<option value="0" selected="selected">비밀번호 재설정 질문을 선택해주세요!</option>
					 	<c:forEach items="${questionList}" var="content" varStatus="loop">
						<option value="${loop.index + 1}">${content}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="fm-box">
				<label class="left">질문 답변</label>
				<div class="input-wrap">
					<input class="enterDefault" type="text" name="quereply" id="quereply" value="${member.quereply}" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">전화번호</label>
				<select class="tel_first enterDefault" name="tel_first" id="tel_first" style="width: 70px; float: left; margin-right: 16px;"></select>
				<div class="input-wrap">
					<input class="enterDefault" type="text" name="tel_second" id="tel_second" maxlength="4" style="width: 86px; float: left; margin-right: 16px;" />
				</div>
				<div class="input-wrap">
					<input class="enterDefault" type="text" name="tel_last" id="tel_last" maxlength="4" style="width: 86px;" />
				</div>
			</div>
			<div class="fm-box">
				<label class="left">업종 대분류</label>
				<div class="input-wrap">
					<select class="enterDefault" name="oneCategory" id="oneCategory">
						<option value="0">업종 대분류</option>
						<c:forEach items="${oneCategoryList}" var="oneName" varStatus="loop">
						<option value="${loop.index + 1}">${oneName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="fm-box">
				<label class="left">업종 소분류</label>
				<div class="input-wrap">
					<select class="enterDefault" name="twoCategory" id="twoCategory">
						<option value="0">업종 소분류</option>
						<c:forEach items="${twoCategoryList}" var="dto">
						<option value="${dto.twoCategoryId}">${dto.twoName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="fm-box">
				<label class="left">경력</label>
				<div class="input-wrap">
					<select name="career" id="career">
						<option value="0">경력</option>
						<option value="1">1년 이하</option>
						<option value="2">2년 이하</option>
						<option value="3">3년 이하</option>
						<option value="4">4년 이하</option>
						<option value="5">5년 이하</option>
					</select>
				</div>
			</div>
			
			<input class="button" type="submit" value="회원정보 수정" style="margin: 16px;"/>
			
		</form>
		
	</div>
	<%@ include file="../base/footer.jsp" %>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="../js/foundation.min.js"></script>
	<script src="../js/timple.js"></script>
	<script src="../js/header.js"></script>
	<script>
		$("#questionId option[value='" + "${member.questionSeq}" + "']").prop("selected", true);
		$("#oneCategory option[value='" + "${member.oneCategorySeq}" + "']").prop("selected", true);
		$("#twoCategory option[value='" + "${member.twoCategoryId}" + "']").prop("selected", true);
		$("#career option[value='" + "${member.career}" + "']").prop("selected", true);
		
		$.each(tel_array, function(index, arr) {
		    $(".tel_first").append($("<option/>", {
		        value: arr, text: arr
		    }));
		});
	 	
 		<c:set var="tel" value="${member.tel}"/>
		<c:set var="tel_split" value="${fn:split(tel, '-')}" />
		<c:forEach var="s1" items="${tel_split}" varStatus="s">
			<c:if test="${s.count == 1}">
				<c:set var="tf" value="${s1}"/>
				$("#tel_first option[text='" + "${s1}" + "']").prop("selected", true);
			</c:if>
			<c:if test="${s.count == 2}">
				<c:set var="tf" value="${s1}"/>
				$("#tel_second").attr("value", "${s1}");
			</c:if>
			<c:if test="${s.count == 3}">
				<c:set var="tf" value="${s1}"/>
				$("#tel_last").attr("value", "${s1}");	
			</c:if>
		</c:forEach> 
		 
		$("#oneCategory").change(function() {
			
			$(this).removeWarning("notSelect");
			$("#twoCategory option").each(function() {
				if ($(this).val() > 0) $(this).remove();
			});
			$("#twoCategory option[value='" + 0 + "']").prop("selected", true);
			
			if ($(this).val() != 0) {

				$.ajax({
					url: "/ajax_twocategory.vs?oneCategorySeq=" + $(this).val(),
					success: function(xml) {
						$(xml).find("twoName").each(function(index) {
							$("#twoCategory").append($("<option/>", {
								value: index + 1, text: $(this).text()
							}));
						});
					}
				});
			}
		});
		
		$("#editMemberForm").submit(function(e) {
			e.preventDefault();
						
			if ($("#email").val() == "") $("#email").showWarning("empty").focus();
			if ($("#name").val() == "") $("#name").showWarning("empty").focus();
			if ($("#crt_pw").val() == "") $("#crt_pw").showWarning("empty").focus();
			if ($("#pw").val() == "") $("#pw").showWarning("empty").focus();
			if ($("#check_pw").val() == "") $("#check_pw").showWarning("empty").focus();
			if ($("#questionId").find("option:selected").val() == "0") $("#questionId").showWarning("empty").focus();
			if ($("#quereply").val() == "") $("#quereply").showWarning("empty").focus();
			
			
			// 유효성 나머지 추가해야함...
			
			if ($(".war-state").length == 0) {
				this.submit();
			}
		});
		
		
	</script>
	</c:if>
	<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
</body>
</html>