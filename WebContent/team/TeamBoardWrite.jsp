<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style type="text/css">
	#write { 
		border: 1px solid #ECEFF3;
		display: block; 
		border-collapse: collapse;
		margin: auto;
		table-layout: fixed;
		width: 83%;
	}
	
	#write td{
		border: 1px solid #ECEFF3;
		padding: 3px;
		font-size: 0.8125rem;
		text-align: center;
	}
	
	#write td:nth-child(1) {width: 10%;}
	#write td:nth-child(2) {text-align: left;}
	#write td:nth-child(2) input {margin: 0px;}
</style>

<script>
	
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
		<p>${projectname}</p>
	</div>
	<!-- Side Menu Start -->
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>
	<div id="teamboard" style="margin-left: 300px;">
		<h3>템플릿입니다.</h3>
	<form method="POST" id="form" name="form" action="/TeamBoardWriteOk.vs" enctype="multipart/form-data">
	<div>
		<table id="write">
			<tr>
				<td class="left">제목</td>
				<td class="right">
				<input type="text" name="subject"/>
				</td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td class="right">
					<textarea style="resize: none; width: 715px;margin: 0px;height: 400px;" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td class="left">게시판 이름</td>
				<td>${TeamBoardSortName}<input type="hidden" name="TeamBoardSortSeq" value="${TeamBoardSortSeq}" /></td>
			</tr>	
			<tr>
				<td class="left">파일첨부</td>
				<td class="right">
					<input type="file" name="attach" id="attach"/> 
				</td>
			</tr>
			<tr>
				<td class="left">등급</td>
				<td class="right">
					<input type="radio" name="teamBoardGrade" value="1" />1등급<input type="radio" name="teamBoardGrade" value="2" />2등급
				</td>
			</tr>
		</table>
		<br />
		<input style="float: right; margin-right: 100px;"type="submit" value="글쓰기"/>
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
