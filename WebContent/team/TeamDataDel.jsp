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

	function realDel() {
		var form = document.getElementById("del1");
		var del = document.getElementById("del");
		
		if (del.value == ""){
			alert("삭제할 파일을 선택해주세요.");
		}
		
		if (del.value != ""){
			if(confirm("정말 삭제하시겠습니까?")){
				form.submit();	
			} else {
				return false;
			}		
		}
	}
</script>

</head>
<body>
<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq != null }">
		
	<jsp:include page="/header.vs"></jsp:include>
	<div id="title">
		<p>${title}</p>
	</div>
	<!-- Side Menu Start -->
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>
	<div style="margin-left: 380px; margin-right:100px; text-align: center; min-width: 600px">
		<h2>자 료 삭 제</h2>
		<div>
		<input style="margin-left: 400px;"type="button" class="button tiny" value="삭제" onclick="realDel();"/>
		<input type="button" value="목록으로" class="button  tiny" onclick="location.href='/TeamData.vs'" />
		</div>
	<form method="POST" id ="del1" name="del1" action="/DataDelOk.vs">
	<div>
		<div style="float: left; overflow-y: scroll; height: 600px; width: 720px; ">
			<c:forEach items="${list}" var="dto">
			<div style="float:left; width: 160px;">
			<input type="checkbox" name="del" id="del" value="${dto.dataId}"/>
			<label for="del">
			<div style="text-align: center; width: 100px; margin: 0px; margin-left:10px; float: left;">
			<img src="/team/images/datafile.png" alt="${dto.orgFileName}" name="${dto.orgFileName}" />
			<p>${dto.orgFileName}</p>
			</div>
			</label>
			</div>
			</c:forEach>
		</div>
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