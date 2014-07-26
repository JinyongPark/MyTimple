<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="/js/vendor/modernizr.js"></script>
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
	
	#searchBtn { width: 80px; margin-left: 5px;}
	
	#kindSel:active { background-color: lightblue; }
	#termSel:active { background-color: lightblue; }
	#txtSearch:active { background-color: lightblue; }
	#searchBtn:active { background-color: lightblue; }
		
	/* 페이징 처리 CSS */
	#pageList { width: 500px; margin: 0 auto; text-align: center; }
	
}
	
</style>	
</head>
<body>
<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq != null }">
		
	<input type="hidden" name="ment" id="ment" value="${ment}" />	
	
	<jsp:include page="/header.vs"></jsp:include>
	
	<h2 style="margin-top:15px;">쪽지함</h2>
	
	<hr /> <br />
	
	<table id="tblBoard">
		<tr>
			<th></th>
			<th>번호</th>
			<th>쪽지내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th></th>
		</tr>
	<c:if test="${paper != null && fn:length(paper) != 0}">
	<c:forEach items="${paper}" var="dto">
		<tr id="tr3">
			<td>
			<input type="checkbox" onclick="boxdel(this);" id="${dto.paperId }"/></td>
			<td>${dto.paperId}</td>
			<td>${dto.content}</td>
			<td><span class="mb-wrap"><a href="#" class="mb-name" id="to=${dto.fromId }&from=${dto.receivememseq}&toname=${dto.fromMem}">${dto.fromMem}</a></span></td>
			<td>${dto.regdate}</td>
			<td></td>
		</tr>
	</c:forEach>
	</c:if>
	
	<c:if test="${paper == null || fn:length(paper) == 0}">
		<tr>
			<td colspan="6">쪽지함이 비었습니다.</td>
		</tr>
	</c:if>
	</table> <br />
	
	<div id="btnList2">
	<form action="../PaperList.vs" method="GET" id="PdelForm">
		<input type="button" class="button success tiny" value="삭제" id="delBtn" onclick="Pdel();"/>
		<input type="hidden" name="paperId" id="paperid" />
	</form>
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
	
	<!-- <div id="btnList">
		<select id="list2">
			<option value="제목+내용"></option>
			<option value="제  목"></option>
			<option value="내  용"></option>
		</select> -->
			
	<!-- 	<input type="text" name="txtSearch" id="txtSearch" placeholder="이곳에 검색어를 입력하세요." />
		
		<input type="button" id="searchBtn" value="검 색" /> -->
	<!-- </div> -->
	
	<br />
	
	<%@ include file="/base/footer.jsp" %>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
	
	<script>
	
	function teamDel2() { // 수정 및 삭제 데이터 보내기
		var ment = document.getElementById("ment");
		alert(ment.value);
	if (ment.value == "1"){
			alert("삭제가 완료 되었습니다!");
		}
	
	}
	
	function Pdel() {
		/* var form = document.getElementById("PdelForm");
		form.submit(); */
		var getChk= $("input:checkbox:checked").map(function(){
		    return $(this).attr("id");
		 }).get();
	

		 jQuery.ajax({
			url: "/Paper/PaperDelete.vs",
			type: "POST",
			dataType: "xml",
			data: {"paperid": getChk.join(",")},
			success: function(xml) {
				if(jQuery(xml).find("code").text() == '1'){
					alert("선택한 쪽지들이(가) 삭제되었습니다.");
					location.reload();
				}
			},
			error: function(xml) {
				
			}
		}); 
	}

	function boxdel(n) {
		var btn = event.srcElement;
		var td1 = btn.parentNode.parentNode.childNodes[3];
		var paperid = document.getElementById("paperid");
		
		paperid.value = td1.innerText;
	}

	function sendPaper(tomemberId) {
		var url = '/Sendpaper.vs?'+tomemberId;
		var option = 'width=370, height=390, location=no, resizable=no, scrollbars=no, status=no';
		window.open(url, '', option);
	 }

	function addFriend() {
		var url = 'friend.htm';
		var option = 'width=370, height=220, location=no, resizable=no, scrollbars=no, status=no';
		window.open(url, '', option);
	}

	$('.mb-wrap').on('click', function(e) {
		
		$('.sel').removeClass('sel');
		$(this).find('.mb-name').addClass('sel');
		$('.mb-layer').remove();
		
		var $ul = $('<ul/>').addClass('mb-layer');
		$('<li/>', {
			class: 'mb-layer-list',
			text: '답장하기',
			onclick: 'sendPaper("'+ jQuery(e.target).attr('id') +'");'
		}).appendTo($ul);
		$('<li/>', {
			class: 'mb-layer-list',
			text: '친구 추가 요청',
			onclick: 'addFriend();'
		}).appendTo($ul);
		
		$(this).append($ul);
		
	});

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