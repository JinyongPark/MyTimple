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
<script>
	function editcheck() {
		var grade = document.getElementById("grade").value;
		var noticeId = document.getElementById("noticeId").value;
		if (grade == "1") {
			location.href='/TeamNoticeEdit.vs?noticeId='+ noticeId;
		}		
		if (grade == "2") {
			alert("팀장만 공지 가능합니다.");
		}
	}
	
	function delcheck() {
		var grade = document.getElementById("grade").value;
		var noticeId = document.getElementById("noticeId").value;
		if (grade == "1") {
			location.href='/TeamNoticeDel.vs?noticeId='+ noticeId;
		}		
		if (grade == "2") {
			alert("팀장만 공지 가능합니다.");
		}
	}
	
</script>
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
		</table>
	</div>	
	<input type="button" value="수정하기" onclick="editcheck();" />
	<input type="button" value="삭제하기" onclick="delcheck();" />
	<input type="button" value="목록으로" onclick="location.href='/TeamNotice.vs'" />
	<input type="hidden" value="${grade}" name="grade" id="grade" />
	<input type="hidden" value="${dto.noticeId}" name="noticeId" id="noticeId" />
	<%@ include file="/base/footer.jsp"%>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
</body>
</html>