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
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/sidemenu/hideshow.js"></script>
<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

<style>
body {
	min-width: 500px;
	height: 450px;
}

h3 {
	text-align: center;
}

#tblList,tr,th,td {
	border: 1px solid #333;
	text-align: center;
}

#tblList {
	margin: 10px auto;
	width: 600px;
}

th {
	height: 30px;
}

td {
	height: 50px;
}

tr th:nth-child(1) {
	width: 80px;
}

tr th:nth-child(2) {
	width: 150px;
}

tr th:nth-child(3) {
	width: 140px;
}

tr th:nth-child(4) {
	width: 60px;
}

tr th:nth-child(5) {
	width: 170px;
}

#close {
	margin: 10px auto;
	display: block;
}
</style>

<script>
	function close2() {
		window.close();
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
		
	<div>
		<h3>신청 리스트</h3>
		<table id="tblList">
			<tr>
				<th>이름</th>
				<th>Email</th>
				<th>연락처</th>
				<th>경력</th>
				<th colspan="2">선택</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(memberList)==0}">
					<tr>
						<td colspan="6">지원자가 없습니다.</td>
					</tr>
				</c:when>
				<c:when test="${fn:length(memberList)!=0}">
				<c:forEach items="${memberList}" var="dto">
					<tr>
						<td>${dto.aname}</td>
						<td>${dto.aemail}</td>
						<td>${dto.atel}</td>
						<td>${dto.acareer}년</td>
						<td><input type="button" value=" 수락 "
							onclick="location.href='/projects/ApplyYes.vs?aseq=${dto.aseq}&acceptanceid=${dto.acceptanceid}'" /></td>
						<td><input type="button" value=" 거부 "
							onclick="location.href='/projects/ApplyNo.vs?acceptanceid=${dto.acceptanceid}'" /></td>
					</tr>
				</c:forEach>
				</c:when>
			</c:choose>
		</table>
		<input type="button" id="close" value=" 닫기 " class="button secondary" onclick="close2();" style="width:120;height:35px;padding:inherit;" />
	</div>
</c:if>
</body>
</html>