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
	body{min-width: 500px; height: 450px;}
	h3{ text-align: center;}
	#tblList, tr, th, td{ border: 1px solid #333; text-align: center;}
	#tblList{ margin: 10px auto; width: 500px; }
	th{ height: 30px;}
	td{ height: 50px;}
	tr th:nth-child(1) { width: 87px;}
	tr th:nth-child(2) { width: 242px;}
	tr th:nth-child(3) { width: 170px;}
	#back{ margin: 10px auto; display: block;}
		
</style>

<script>
function back(){
	location.href="SearchMember.vs";
	
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
		
	<h3>검색 결과</h3>
	<table id="tblList">	
		<tr>
			<th>이름</th>
			<th>Email</th>
			<th>보내기</th>
		</tr>
		<c:choose>
		<c:when test="${fn:length(list)==0}">
		<tr>
			<td colspan="3">검색 결과가 없습니다.</td>
		</tr>
		</c:when>
		<c:when test="${fn:length(list)!=0}">
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.name}</td>
			<td>${dto.email}</td>
			<td><input type="button" value=" 요청하기 " onclick="location.href='/projects/Invite.vs?rseq=${dto.memberId}'"
			class="button success"style="width: 120px; height: 35px;padding:0px;margin-bottom: 0px; margin:10px;" /></td>
		</tr>
		</c:forEach>
		</c:when>
		</c:choose>
	</table>
		<input type="button" id="back" value=" 다시찾기 " class="button success" onclick="back();" style="width: 120px;
    height: 35px;padding:0px;"/>
		</c:if>
</body>
</html>