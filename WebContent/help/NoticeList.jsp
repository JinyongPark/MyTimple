<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/js/header.js"></script>
<script src="/js/foundation.min.js"></script>
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
	
	#genre, #content {
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
		width: 800px;
		height: 30px;
	}
	
	#searchBtn { width: 80px; margin-left: 5px;}
	

	#txtSearch:active { background-color: lightblue; }
	#searchBtn:active { background-color: lightblue; }
		
	/* 페이징 처리 CSS */
	#pageList { width: 500px; margin: 0 auto; text-align: center; }
	
</style>	
<script type="text/javascript">

	function typeSel() {
		var sel = document.getElementById("content");
		var content = sel.options[sel.selectedIndex].text;
		var txtSearch = document.getElementById("txtSearch").value;
		
		document.getElementById("frm").submit();
	}

</script>
</head>
<body>
<c:if test="${empty loginSeq}">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${null != loginSeq }">
	<jsp:include page="/header.vs"></jsp:include>
	
	<br />
	
	<h2>N O T I C E</h2>
	
	<hr /> <br />
	
	<table id="tblBoard">
		<tr>
			<th>종류</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
	<c:forEach items="${list}" var="dto">
		<tr class="nt" id="tr1">
			<td><span class="label radius">공지</span></td>
			<td>${dto.noticeId}</td>
			<td class="nt-subject"><a href="/help/NoticeView.vs?noticeId=${dto.noticeId}">${dto.subject}</a></td>
			<td style="font-weight: bold;">관리자</td>
			<td><a href="/help/NoticeView.vs?noticeId=${dto.noticeId}">${dto.subject}</a><span style="display: inline-block;">&nbsp;${dto.newImg}</span></td>
			<td>${dto.id}</td>
			<td class="nt-subject"><a href="/help/NoticeView.vs?noticeId=${dto.noticeId}">${dto.subject}</a><span style="display: inline-block;">&nbsp;${dto.newImg}</span></td>
			<td style="font-weight: bold;">관리자</td>
			<td>${dto.regDate}</td>
		</tr>
	</c:forEach>
	
	</table> <br />
	
	<div id="btnList2">
		<!-- 관리자 아이디 로그인 할 경우 메뉴 보이도록 수정해야함 -->
		<c:if test="${memSeq == '0'}">
			<input type="button" id="writeBtn" value="글쓰기" onclick="location.href='/help/NoticeWriter.vs'"/>
		</c:if>

	</div>
	<!-- 페이징 버튼 위치 -->
	<div id="pageList" style="width:600px; margin:20px auto; text-align:center;">
		${pageBar}
	</div>
	
	<div id="btnList">
		<form method="GET" name="frm" id="frm" action="/help/NoticeList.vs">
			
			<select name="content" id="content">
				<option value="제목+내용">제목+내용</option>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
				
			<input type="text" name="txtSearch" id="txtSearch" placeholder="이곳에 검색어를 입력하세요." />
					
			<input class="button tiny" type="button" id="searchBtn" value="검색" onclick="typeSel();" />
			
		</form>
	</div>
	<br />

	<%@ include file="/base/footer.jsp" %>
</c:if>
<script src="/js/header.js"></script>
</body>
</html>





















