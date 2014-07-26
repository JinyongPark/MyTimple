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
<script src="/js/vendor/modernizr.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/pepper-grinder/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- JavaScript Start -->
<script>
	
</script>
<!-- JavaScript End -->
<style>
	
	h1 {
		text-align: center;
		margin: 10px;
	}
	
	#edit {
		height: 400px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#edit tr, td { border: 1px solid black ;}
</style>
</head>
<body>
<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">

	<header>
		<jsp:include page="/header.vs"></jsp:include>
	</header>
	<section style="clear: both;">
		<h1>수정</h1>
		<form method="POST" action="/TeamBoardEditOk.vs">
		<div>
			<table id="edit">
			<tr>
				<td class="left">제목</td>
				<td class="right">
				<input type="text" name="subject" value="${dto.subject}"/>
				</td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td class="right">
					<textarea name="content">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="left">게시판 이름</td>
				<td><p>${TeamBoardSortName}</p><input type="hidden" value="${TeamBoardSortSeq}" id="${TeamBoardSortSeq}" name="TeamBoardSortSeq"/></td>
			</tr>	
			<tr>
				<td class="left">등급</td>
				<c:if test="${dto.teamBoardGrade == 1}">
				<td class="right">
					<input type="radio" name="teamBoardGrade" value="1" checked="checked"/>1등급<input type="radio" name="teamBoardGrade" value="2" />2등급
				</td>
				</c:if>
				<c:if test="${dto.teamBoardGrade == 2}">
				<td class="right">
					<input type="radio" name="teamBoardGrade" value="1" />1등급<input type="radio" name="teamBoardGrade" value="2" checked="checked" />2등급
				</td>
				</c:if>
				<c:if test="${dto.teamBoardGrade == 0}">
				<td>등급따위</td>
				</c:if>
			</tr>
		</table>
		<input type="hidden" value="${dto.teamboardId}" id = "teamboardId" name = "teamboardId" />
		</div>	
		<input type="submit" value="수정하기" />
		</form>
	</section>

	<input type="text" />
	<input type="text" />
	<footer>
		<%@ include file="/base/footer.jsp"%>
	</footer>
	</c:if>
</body>
</html>
