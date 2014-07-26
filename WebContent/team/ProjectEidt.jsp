<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="/js/vendor/modernizr.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="/css/sidemenu/layout.css" media="screen" />

<script>
	var ja = jQuery.noConflict();
</script>

<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>

<script>
	var js = jQuery.noConflict();
</script>

<!-- Side Menu Script End -->

<script type="text/javascript">
	function sub() {
		
		var name = $("#name").val();
		
		 $.ajax({
				type: "get",
				url: "/proupdate.vs",
				data: "name=" + name,
				success:callBack
		});
	}
	
	function callBack() {
		location.href="/ProjectEidt.vs";
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
	
	<!-- Side Menu Start -->
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	
		<div id="menu" style="margin-left: 380px;">
		<input type="button" value="테마 변경" onclick="location.href='Theme.vs'" class="button"/>
		<input type="button" value="순서 변경" onclick="location.href='Order.vs'" class="button"/>
		<input type="button" value="BusinessPlan명 변경" onclick="location.href='BpSelect.vs'" class="button"/>
		<input type="button" value="Project명 변경" onclick="location.href='ProjectEidt.vs'" class="button"/>
		</div>
	
	<c:forEach items="${list}" var="dto">
	<div id="content" style="margin-left: 70px; border-left: none; min-height: inherit;">
			<h2 style="margin-top: 50px;">Project명 수정하기</h2>
			<form id="formList" method="GET" action="/proupdate.vs">
				<div class="row">
					<div class="large-12 columns">
						<label style="margin-top: 20px;">Project명 : ${dto.name}
						<input type="text" id="name" maxlength="20" style="margin-top: 10px; width: 720px;"/>
						</label>
						<input type="button" value="수정" class="button success small" onclick="sub();" style="margin-right: 20px; margin-top: 20px;"/>
						<input type="button" value="취소" class="button secondary small" onclick="location.href='ProjectEidt.vs'"/>
					</div>
				</div>
			</form>
			</div>	
	</c:forEach>
	<%@ include file="/base/footer.jsp" %>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script src="js/header.js"></script>
	</c:if>
</body>
</html>


