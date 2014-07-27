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
<script src="/js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	
<script>
	var ja = jQuery.noConflict();
</script>	
	
	
	
<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

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
	#tblBoard th:nth-child(2) { width: 60%; }
	#tblBoard th:nth-child(3) { width: 10%; }
	#tblBoard th:nth-child(4) { width: 10%; }
	#tblBoard th:nth-child(5) { width: 5%; }
	#tblBoard th:nth-child(6) { width: 5%; }
	
	#tblBoard td:nth-child(2) { text-align: left; }
	
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
	
	#genre, #col {
		display: inline-block;
		margin-right: 5px;
		width: 90px; height: 34px;
		text-align: center;
	}
	
	#word {
		display: inline-block;
		width: 500px; height: 34px;
	}
	
	#searchBtn { top: -2px; margin-left: 5px; }
	
/* 	#kindSel:active { background-color: lightblue; }
	#termSel:active { background-color: lightblue; }
	#txtSearch:active { background-color: lightblue; }
	#searchBtn:active { background-color: lightblue; } */
		
	/* 페이징 처리 CSS */
	#pageList { width: 500px; margin: 0 auto; text-align: center; }
</style>

<script>
	function typeSel() {
	
		var sel1 = document.getElementById("col");
		var col = sel1.options[sel1.selectedIndex].text;
	
		var word = document.getElementById("word").value;
		var grade = document.getElementById("grade").value;
		var teamseq = document.getElementById("teamseq").value;
	
		document.getElementById("frm").submit();
	}

	function checkgrade() {
		var grade = document.getElementById("grade").value;
		var teamseq = document.getElementById("teamseq").value;
		if (grade == "1") {
			location.href='/AddTeamNotice.vs?teamseq='+ teamseq;
		}		
		if (grade == "2") {
			alert("팀장만 공지 가능합니다.");
		}
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
	<div id="title">
		<p>${title}</p>
	</div>
	<!-- Side Menu Start -->
	
	<script>
	var js = jQuery.noConflict();
    </script>
	
	
	
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>
		<div id="teamboard" style="margin-left: 300px;">
			<h2>공 지 사 항</h2>
			<div style="margin: 10 auto;">
			<table id="tblBoard" style="margin: 10 auto;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>글쓴이</th>
				</tr>
				<c:if test="${empty notice}">
				<tr>
					<td colspan="4" style="text-align:center;">공지사항이 없습니다.</td>
				</tr>
				</c:if>
				<c:forEach items="${notice}" var="ndto">
				<tr>
					<td>공지</td>
					<td><a href="/TeamNoticeContent.vs?noticeId=${ndto.noticeId}">${ndto.subject}</a></td>
					<td style="font-weight: bold;">팀장</td>
					<td>${ndto.regDate}</td>
				</tr>
				</c:forEach>
			</table>
		<div id="btnList2">
			<input class="button tiny" type="button" id="writeBtn" value="공지글" onclick="checkgrade();" />
		</div>
			<!-- 페이징 버튼 위치 -->
		<div id="pageBar" style="width:600px;margin:20px auto;text-align:center;">
		${pageBar}
		</div>
		</div>
		
		<!--검색  -->
		<div id="btnList">
			<form method="GET" name="frm" id="frm" action="TeamNotice.vs">
			<select name="col" id="col">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="all">제목+내용</option>
			</select>
			<input type="text" name="word" id="word" placeholder="이곳에 검색어를 입력하세요." />
			
			<input class="button tiny" id="searchBtn" type="button" onclick="typeSel();" value="검색" />
			<input type="hidden" id="grade" value="${grade}" />
			<input type="hidden" id="teamseq" value="${teamseq}" />
			</form>
			</div>		
		</div>	
	
	
	</section>
	<footer>
		<%@ include file="/base/footer.jsp"%>
		<script src="/js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>
