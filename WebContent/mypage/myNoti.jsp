<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>
<!-- <style type="text/css">
	
	h2 { text-align: center; }
	
	#tblBoard {
		border-collapse: collapse;
		border: 1px solid gray;
		width: 1000px;
		margin: 0 auto;			
	}
	
	#tblBoard th, #tblBoard td {
		border: 1px solid red;
		padding: 3px;
	}
	
	#tblBoard th { border-bottom: 5px solid gray; }
	#tblBoard td { 
		text-align: center; 
		font-size: 12pt;
	}
	
	#tblBoard th:nth-child(1) { width: 80px; }
	#tblBoard th:nth-child(2) { width: 50px; }
	#tblBoard th:nth-child(3) { width: 520px; }
	#tblBoard th:nth-child(4) { width: 100px; }
	#tblBoard th:nth-child(5) { width: 100px; }
	#tblBoard th:nth-child(6) { width: 40px; }
	#tblBoard th:nth-child(7) { width: 40px; }
	
	#tblBoard td:nth-child(2) { font-size: 10pt; }
	#tblBoard td:nth-child(5) { font-size: 10pt; }
	#tblBoard td:nth-child(6) { font-size: 10pt; }
	#tblBoard td:nth-child(7) { font-size: 10pt; }
	
	#btnList {
		width: 1000px;
		height: 30px;
		margin: 0 auto;
		text-align: center;
	}
	
	#btnList2 {
		width: 1000px;
		height: 30px;
		margin: 0 auto;
		text-align: center;
	}
	
	#writeBtn {
		float: right;
	}
	
	#termSel, #kindSel {
		display: inline-block;
		padding: 1px;
		padding-left: 3px;
		margin-right: 5px;
		width: 90px;
		height: 30px;
		text-align: center;
	}
	
	#txtSearch {
		display: inline-block;
		width: 600px;
		height: 30px;
	}
	
	#searchBtn { width: 80px; margin-left: 5px;}
	
	#kindSel:active { background-color: lightblue; }
	#termSel:active { background-color: lightblue; }
	#txtSearch:active { background-color: lightblue; }
	#searchBtn:active { background-color: lightblue; }
		
	/* 페이징 처리 CSS */
	#pageList { width: 500px; margin: 0 auto; text-align: center; }
	
}
	
</style>	 -->


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

	#tblBoard th:nth-child(1) { width: 5%; }
	#tblBoard th:nth-child(2) { width: 5%; }
	#tblBoard th:nth-child(3) { width: 60%; }
	#tblBoard th:nth-child(4) { width: 10%; }
	#tblBoard th:nth-child(5) { width: 10%; }
	#tblBoard th:nth-child(6) { width: 5%; }
	#tblBoard th:nth-child(7) { width: 5%; }
	
	#tblBoard td:nth-child(3) { text-align: left; }
	
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
	
	#searchBtn { top: -2px; margin-left: 5px; }

	#pageList { width: 500px; margin: 0 auto; text-align: center; }
	
}
	
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
	
	<h2>전체알림</h2>
	
	<hr /> <br />
	
	<table id="tblBoard">
		<tr>
			<th>번호</th>
			<th>내용</th>
			
		</tr>
	<c:if test="${nlist != null && fn:length(nlist) != 0}">
	<c:forEach items="${nlist}" var="dto">
		<tr>
			
			<td>${dto.notificationId}</td>
			<td><span class="mb-wrap"><a href="#" class="mb-name" id="nid=${dto.notificationId }&memseq=${dto.memseq}">${dto.content}</a></span></td>
			<%-- <td>${dto.regdate}</td> --%>
			<!-- <td></td> -->
		</tr>
	</c:forEach>
	</c:if>
	<%-- <c:if test="${paper == null || fn:length(paper) == 0}">
		<tr>
			<td colspan="5">알림이 없습니다.</td>
		</tr>
	</c:if> --%>
	</table> <br />
	<!-- 
	<div id="btnList2">
		<input type="button" id="writeBtn" value="글쓰기" onclick="location.href='/bbs/BbsWriter.vs'"/>
	</div>
	
	페이징 버튼 위치
	<div id="pageList" style="width:600px; margin:20px auto; text-align:center;"> -->
		${pageBar}
<%-- 	
	<!-- 
			1 ~ 마지막 페이지(총 게시물 수 / 한페이지 게시물 수) 
			현재 페이지가 아닌 페이지번호에 링크 태그		
	-->
		<c:forEach begin="1" end="${pages}" var="i">
			<c:if test="${nowPage != i}">
				<a href="/bbs/BbsList.vs?page=${i}"> ${i} </a>
			</c:if>
			<c:if test="${nowPage == i}">
				${i}
			</c:if>
		</c:forEach>
	 --%>	
	<!-- </div> -->
	
	<!-- 검색 버튼 위치 -->
	
	<hr />
	
	<!-- <div id="btnList">
		<input type="text" list="list" id="termSel" placeholder="기간 선택"/>
		<datalist id="list">
			<option value="전체기간"></option>
			<option value="아무게"></option>
			<option value="하하하"></option>
			<option value="호호호"></option>
		</datalist>
		
		<input type="text" list="list2" id="kindSel" placeholder="내용 선택"/>
		<datalist id="list2">
			<option value="제목+내용"></option>
			<option value="제  목"></option>
			<option value="내  용"></option>
		</datalist>
			
		<input type="text" name="txtSearch" id="txtSearch" placeholder="이곳에 검색어를 입력하세요." />
		
		<input type="button" id="searchBtn" value="검 색" />
	</div>
	 -->
	<br />
	
	<%@ include file="/base/footer.jsp" %>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="js/header.js"></script>
	<script>
	
	$(document).on('click', function(e) {
		var $target = $(e.target).attr('class');
		if ($target != 'mb-layer' && $target != 'mb-wrap' && $target != 'mb-name sel') {
			$('.mb-layer').remove();
		}
	});
	</script>
	</c:if>
</body>
</html>