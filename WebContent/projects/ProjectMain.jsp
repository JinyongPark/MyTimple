<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="../js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="/css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
 <script>
	var ja = jQuery.noConflict();
</script>
	
	
<script src="/js/sidemenu/hideshow.js"></script>






<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

	
 <script>
	var js = jQuery.noConflict();
</script>
	

<script>
js(document).ready(function(){
	var total = ${percent};
	
	js("#ing").animate({
		width: total + "%"
	}, 1000);
	
	
	var width = js("#ing").css("width");	
	
	if(total != 0){
		js("#ing").css("border-right", "1px solid #333");
	}
	
});
	
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
	<section>
		<div id="content">
			<div id="progress" class="title">
				<h4>프로젝트 진행률<span>(${percent}%)</span></h4>
				<div id="box1">
					<div id="ing"></div>
				</div>
			</div>

			<%-- <div id="today" class="title">
				<h4>오늘의 팀 일정</h4>
				<div id="todo">
					<c:choose>
					<c:when test="${fn:length(list)==0}">
						<p>등록된 일정이 없습니다.</p>
					</c:when>
					<c:when test="${fn:length(list)>0}">
					<c:forEach items="${list}" var="dto">
					<p>${dto.startday} ~ ${dto.endday} ${dto.subject}</p>
					<hr />				
					</c:forEach>
					</c:when>
					</c:choose>
				</div>
			</div> --%>
			
			<div id="overview" class="title">
				<h4>OverView</h4>
				<div id="overview2" class="title">
				<c:choose>
				<c:when test="${fn:length(overview)==0}">
					<p>업데이트 된 사항이 없습니다.</p>
				</c:when>
				<c:when test="${fn:length(overview)>0}">
				<c:forEach items="${overview}" var="dto">
					<div class="viewcontents">
						<div class="label file">Task</div>
						<div class="viewTitle">
						<c:set var="ctn" value="'${dto.bname}' 업무의 '${dto.buname}' 이(가) 업데이트 되었습니다." />
				   		<c:set var="leng" value="${fn:length(ctn)}" />
				   		<c:if test="${leng > 50}">
				    		<c:set var="ctn2" value="${fn:substring(ctn, 0, 50)}" />
				    		${ctn2}..
				    	</c:if>
				    	<c:if test="${leng <= 50}">
				    		${ctn}
				    	</c:if>
				    	</div>
						<div class="viewDate" style="float: right;">${dto.editdate}</div>
						<!-- <div class="viewUser">by 안상욱</div> -->
					</div>
					</c:forEach>
				</c:when>
				</c:choose>
					
					<!-- <div class="viewcontents">
						<div class="label task">Task</div>
						<div class="viewTitle">신촌에서 회의하기</div>
						<div class="viewDate">13:05</div>
						<div class="viewUser">by 안상욱</div>
					</div>
					<div class="viewcontents">
						<div class="label tasklist">Task List</div>
						<div class="viewTitle">신촌에서 회의하기</div>
						<div class="viewDate">13:05</div>
						<div class="viewUser">by 안상욱</div>
					</div>
					<div class="viewcontents">
						<div class="label project">Project</div>
						<div class="viewTitle">신촌에서 회의하기</div>
						<div class="viewDate">13:05</div>
						<div class="viewUser">by 안상욱</div>
					</div>
					<div class="viewcontents">
						<div class="label file">File</div>
						<div class="viewTitle">신촌에서 회의하기</div>
						<div class="viewDate">13:05</div>
						<div class="viewUser">by 안상욱</div>
					</div> -->
				</div>
			</div>

		</div>
	</section>
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>
