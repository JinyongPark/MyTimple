<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${loginName }'s Mypage</title>
<style type="text/css">
	h2 { text-align: center; }
	
	#tblBoard {
		display: block;
		border-collapse: collapse;
		margin: auto;
		table-layout: fixed;	
		width: 83%;	
	}
	
	#tblBoard th, #tblBoard td {
		padding: 3px;
		font-size: 0.8125rem;
		text-align: center;
		border-bottom: 1px solid #ECEFF3;
	}
	#tblBoard th {
		background-color: #eff3f4;
		border-bottom: 1px solid #d8dfe2;
		font-weight: bold;
	}
	
	#tblBoard td a { color: black; }
	#tblBoard td a:hover { color: #4DAFCF; }
	#tblBoard .nt { background-color: #ECF7F8; }
	#tblBoard .nt .nt-subject a { color: #46808a; }

	#tblBoard th:nth-child(1) { width: 100px; }
	#tblBoard th:nth-child(2) { width: 200px; }
	#tblBoard th:nth-child(3) { width: 200px; }
	/* #tblBoard th:nth-child(4) { width: 10%; }
	#tblBoard th:nth-child(5) { width: 10%; }
	#tblBoard th:nth-child(6) { width: 5%; }
	#tblBoard th:nth-child(7) { width: 5%; } */
	
	/* #tblBoard td:nth-child(3) { text-align: left; } */
	
	#btnList {
		height: 30px;
		margin: 0 100px;
		text-align: center;
	}
	
	#btnList2 {
		height: 30px;
		margin: 0 100px;
		text-align: center;
	}
	
	#writeBtn {
		float: right;
	}
	
	#genre, #content {
		display: inline-block;
		margin-right: 5px;
		width: 90px; height: 34px;
		text-align: center;
	}
	
	#txtSearch {
		display: inline-block;
		width: 600px; height: 34px;
	}

	.projectName {
		float: left;
		margin-top: 10px;
	}
	
	.projectDate{
	
	}
	
	.projectName, .projectDate, .project{
		border: 1px solid gray;
	}
</style>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="/css/mypage.css" />
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
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
	<h2 style="margin-top:20px;">${loginName }의 프로젝트 목록</h2>
	<c:if test="${fn:length(myprojectlist) != 0 }">
	<table id="tblBoard" style="width:500px; margin-bottom: 20px;">
		<tr>
			<th style="text-align: left; padding:10px;">프로젝트명</th>
		 	<th>시작일자</th>
			<th>종료일자</th>
		</tr>
		<c:forEach items="${myprojectlist }" var="dto">
			<tr class="project">
			<td style="width:400px; text-align: left; margin:10px; padding: 10px;">
			<span class="mb-wrap"><a class="mb-name" href="/projects/ProjectMain.vs?projectid=${dto.projectId }">${dto.projectname }</a></span></td>
			<td style="width:200px;"><span>${dto.projectStart}</span></td>
			<td style="width:200px;"><span>${dto.projectEnd }</span></td>
		</tr>
		</c:forEach>
		</table>
		
	</c:if>
<%@ include file="/base/footer.jsp"%>
<script src="js/header.js"></script>
</c:if>
</body>
</html>