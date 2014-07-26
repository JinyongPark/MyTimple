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
<script src="/js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	
<script>
	var ja = jQuery.noConflict();
</script>
	
	
<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

<style type="text/css">

</style>

<script>
	function realDown() {
		var form = document.getElementById("down");
		
		if(confirm("정말 다운받으시겠습니까?")){
			form.submit();	
		} else {
			return false;
		}		
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
		<p>${title}</p>
	</div>
	
		
<script>
	var js = jQuery.noConflict();
</script>
	
	
	<!-- Side Menu Start -->
	
	
	<jsp:include page="/sidemenu.vs"></jsp:include>
	
	<!-- Side Menu End -->
	<section>
	<div style="margin-left: 380px; margin-right:100px; text-align: center; min-width: 600px">
		<h2>자 료 실</h2>
		<div>
			<input style="float: left; margin-left: 600px;"type="button" class="button tiny" value="자료올리기"  onclick="location.href='/DataUpload.vs'" />
			<input type="button" class="button tiny" value="자료삭제" onclick="location.href='/DataDel.vs'" />
		</div>
		<form method=POST id="down" name="down" action="/DataDownload.vs">
		<div style="overflow-y: scroll; height: 600px; ">
			<c:forEach items="${list}" var="dto">
			<div style="text-align: center; width: 100px; margin: 0px; margin-left:10px; float: left; max-height: 150px;">
			<a href="/DataDownload.vs?fileName=${dto.fileName}&orgFileName=${dto.orgFileName}"><img src="/team/images/datafile.png" alt="${dto.orgFileName}" name="${dto.orgFileName}"  style="cursor:pointer; width: 100px;"/></a>
			<p>${dto.orgFileName}</p>
			</div>
			</c:forEach>
		</div>
		<input type="hidden" value="${dto.dataId}" />
		<input type="hidden" value="${dto.orgFileName}" />
		<input type="hidden" value="${dto.fileName}" />
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