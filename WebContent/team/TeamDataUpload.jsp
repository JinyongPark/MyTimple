<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="../js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/sidemenu/hideshow.js"></script>
<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

<style type="text/css">

</style>

<script>
	
	function realupload(){
		var form = document.forms[0];
		var attach = document.getElementById("attach");
		var orgFileName = document.getElementById("orgFileName");
		var filexplanation = document.getElementById("filexplanation");
				
		//유효성 검사(잘못된 부분 검사)
		if (attach.value == "") {
			alert("파일을 선택해주세요.");
			name.focus();
			return;
		}
		
		if (orgFileName.value == "") {
			alert("파일명을 입력하세요.");
			subject.focus();
			return;
		}
		
		if (filexplanation.value == "") {
			alert("파일설명을 입력하세요.");
			content.focus();
			return;
		}
				
		//여기까지..
		form.submit();//글쓰기(데이터 전송)
		
	}
</script>

</head>
<body>
<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">
		
	<jsp:include page="/header.vs"></jsp:include>
	<div id="title">
		<p>파일 올리기</p>
	</div>
	<!-- Side Menu Start -->
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>
		<div>
		<form method="POST" action="/DataUploadOk.vs" enctype="multipart/form-data">
		<div style="min-width:600px; margin: 20px auto; margin: 20px auto; margin-left: 400;">
			<table>
				<tr>
					<td>파일</td>
					<td class="right">
					<input type="file" name="attach" id="attach" style="margin:0; margin-left: 20;">
					</td>
				</tr>
				<tr>	
					<td style="padding-top: 20px;">자료명</td>
					<td><input type="text" name="orgFileName" id="orgFileName" style="width: 500px; margin-bottom: 0px; margin-top:20px; margin-left: 20px; padding: 0px; height: 27px;"></td>
				</tr>
				<tr>
					<td >설명</td>
					<td ><textarea name="filexplanation" id="filexplanation"style="width: 500px; height: 500px; margin: 20px;"></textarea></td>
				</tr>
			</table>
			<input style="margin-left: 390px; " class="button tiny" type="button" value="자료올리기" onclick="realupload();" />
			<input type="button" value="목록으로" class="button  tiny" onclick="location.href='/TeamData.vs'" />
		</div>
		</form>
		</div>
	</section>
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>