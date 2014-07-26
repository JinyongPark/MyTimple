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
<script src="/js/foundation.min.js"></script>
<script src="/js/header.js"></script>
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
	
/* 	#kindSel:active { background-color: lightblue; }
	#termSel:active { background-color: lightblue; }
	#txtSearch:active { background-color: lightblue; }
	#searchBtn:active { background-color: lightblue; } */
		
	/* 페이징 처리 CSS */
	#pageList { width: 500px; margin: 0 auto; text-align: center; }
	
}
	
</style>	
	<script type="text/javascript">
		
		function typeSel() {
		
			var sel1 = document.getElementById("genre");
			var genre = sel1.options[sel1.selectedIndex].text;
			
			var sel2 = document.getElementById("content");
			var content = sel2.options[sel2.selectedIndex].text;
			
			var txtSearch = document.getElementById("txtSearch").value;
				
			document.getElementById("frm").submit();
			
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
	<jsp:include page="/header.vs"></jsp:include>
	<br />
	<h2>Community</h2>
	
	<hr /> <br />
	
	<table id="tblBoard">
		<tr>
			<th>종류</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
		</tr>
		<!-- 공지사항 3개 가져오기 -->
	<c:forEach items="${list1}" var="dto1">
		<tr class="nt" id="tr1">
			<!-- <td><img src="/bbs/bbs_Image/bbs_notice.jpg" style="width: 100%"/></td> -->
			<td><span class="label radius">공지</span></td>
			<td>${dto1.boardId}</td>
			<td class="nt-subject"><a href="/bbs/BbsView.vs?boardId=${dto1.boardId}">${dto1.subject}</a><span style="display: inline-block;">&nbsp;${dto1.newImg}</span></td>
			<td style="font-weight: bold;">${dto1.name}</td>
			<td>${dto1.regDate}</td>
			<td>${dto1.readCount}</td>
			<td>${dto1.recomCount}</td>
		</tr>
	</c:forEach>
		<!-- 추천글 3개 가져오기 -->
		<c:forEach items="${list2}" var="dto2">
			<tr id="tr2">
				<!-- <td><img src="/bbs/bbs_Image/bbs_named.jpg" style="width: 100%"/></td> -->
				<td><span class="label radius success">추천</span></td>
				<td>${dto2.boardId}</td>
				<td><a href="/bbs/BbsView.vs?boardId=${dto2.boardId}">${dto2.subject}</a><span style="display: inline-block;">&nbsp;${dto2.newImg}</span></td>
				<td><span class="mb-wrap"><span class="mb-name" id="m${dto2.memberid}">${dto2.name}</span></span></td>
				<td>${dto2.regDate}</td>
				<td>${dto2.readCount}</td>
				<td>${dto2.recomCount}</td>
			</tr>
		</c:forEach>
		<!-- 게시물 3개 가져오기 -->
		<c:forEach items="${list4}" var="dto4">
		<tr id="tr3">
			<td>
				<c:if test="${dto4.post_type.equals('자유')}">
					<!-- <img src="/bbs/bbs_Image/bbs_free.jpg" style="width: 100%"/> -->
					<span class="label radius secondary">일반</span>
				</c:if>
				<c:if test="${dto4.post_type.equals('질문')}">
					<!-- <img src="/bbs/bbs_Image/bbs_ask.jpg" style="width: 100%"/> -->
					<span class="label radius alert">질문</span>
				</c:if>
				<c:if test="${dto4.post_type.equals('공지')}">
					<!-- <img src="/bbs/bbs_Image/bbs_notice.jpg" style="width: 100%"/> -->
					<span class="label radius">공지</span>
				</c:if>
			</td>
			<td>${dto4.boardId}</td>
			<td><a href="/bbs/BbsView.vs?boardId=${dto4.boardId}">${dto4.subject}</a><span style="display: inline-block;">&nbsp;${dto4.newImg}</span></td>
			<td><span class="mb-wrap"><span class="mb-name" id= "m${dto4.memberid}">${dto4.name}</span></span></td>
			<td>${dto4.regDate}</td>
			<td>${dto4.readCount}</td>
			<td>${dto4.recomCount}</td>
		</tr>
		</c:forEach>
	</table> <br />
	
	<div id="btnList2">
		<input class="button tiny" type="button" id="writeBtn" value="글쓰기" onclick="location.href='/bbs/BbsWriter.vs'"/>
	</div>
	<!-- 페이징 버튼 위치 -->
	<div id="pageList" style="width:600px; margin:20px auto; text-align:center;">
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
	</div>
	
	<!-- 검색 버튼 위치 -->
	
	
	<div id="btnList">
		<form method="GET" name="frm" id="frm" action="/bbs/BbsList.vs">
			<select name="genre" id="genre">
				<option value="전체">전체</option>
				<option value="자유">일반</option>
				<option value="질문">질문</option>
				<option value="공지">공지</option>
			</select>
			
			<select name="content" id="content">
				<option value="전체">전체</option>
				<option value="제목">제목</option>
				<option value="작성자">작성자</option>
				<option value="내용">내용</option>
			</select>
				
			<input type="text" name="txtSearch" id="txtSearch" placeholder="이곳에 검색어를 입력하세요." />
					
			<input class="button tiny" type="button" id="searchBtn" value="검 색" onclick="typeSel();" />
			
		</form>
	</div>
	<br />
	
	<%@ include file="/base/footer.jsp" %>
	<script src="/js/timple.js"></script>
	</c:if>
</body>
</html>
