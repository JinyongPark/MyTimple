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
<script src="/js/vendor/modernizr.js"></script>
<style type="text/css">
	#content {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#content tr, td { border: 1px solid black;}
	
	#commentlist { border: 1px solid black; border-collapse: collapse;}
	
	#comment td, tr { border: 1px solid black;}	
	
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
		
	<jsp:include page="/header.vs"></jsp:include>
	<div id="title">
		<p>${projectname}</p>
	</div>
	<!-- Side Menu Start -->
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>	
	<h3>템플릿입니다.</h3>
	<div>
		<table id="content">
			<tr>
				<td>제목</td>
				<td>${dto.subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<td>다운로드</td>
				<td><a href="/TeamBoardDown.vs?fileName=${dto.fileName}&orgFileName=${dto.orgFileName}">${dto.orgFileName}</a></td>
			</tr>			
		</table>
	</div>
	<c:if test="${!empty list}">
	<div>
		<table id="commentlist">
			<c:forEach items="${list}" var="cdto">
			<tr>
				<td>${cdto.teamseq}</td>				
				<td>${cdto.teamcomment}</td>
				<td>${cdto.regdate}</td>
				<td><a href="/TeamBoardCommentDel.vs?teamcommentId=${cdto.teamcommentId}&teamboardseq=${dto.teamboardId}&TeamBoardSortSeq=${TeamBoardSortSeq}">삭제하숑</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</c:if>
	<c:if test="${empty list}">
	<input type="hidden" name="nomal" value="nomal" style="display: none;" />
	</c:if>
	<div id="commentWrite">
		<form method="POST" action="/CommentWrite.vs">
			<input type="text" name="teamcomment" id="teamcomment" />
			<input type="hidden" name="teamboardseq" value="${dto.teamboardId}" />
			<input type="hidden" name="TeamBoardSortSeq" value="${TeamBoardSortSeq}" />
			<input type="submit" value="댓글쓰기" />
		</form>
	</div>
	
	<input type="button" value="수정하기" onclick="location.href='/TeamBoardEdit.vs?teamboardId=${dto.teamboardId}&TeamBoardSortSeq=${TeamBoardSortSeq}'" />
	<input type="button" value="삭제하기" onclick="location.href='/TeamBoardDel.vs?teamboardId=${dto.teamboardId}&TeamBoardSortSeq=${TeamBoardSortSeq}'" />
	<input type="button" value="목록으로" onclick="location.href='/TeamBoard.vs?teamboardid=${dto.teamboardId}&TeamBoardSortSeq=${TeamBoardSortSeq}'" />
	</section>
	<%@ include file="/base/footer.jsp"%>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
	</c:if>
</body>
</html>
