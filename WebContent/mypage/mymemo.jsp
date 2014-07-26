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
	#tblBoard th:nth-child(2) { width: 800px;; }
	#tblBoard th:nth-child(3) { width: 60%; }
	#tblBoard th:nth-child(4) { width: 10%; }
	#tblBoard th:nth-child(5) { width: 10%; }
	#tblBoard th:nth-child(6) { width: 5%; }
	#tblBoard th:nth-child(7) { width: 5%; }
	
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
	<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">
		
	<jsp:include page="/header.vs"></jsp:include>
	<div class="popup-mask"></div>
	<div class="popup-wrap writeMemo">
		<a class="popup-close" href="#">
			<img src="images/popup_close.png" />
		</a>
		<h3>메모쓰기</h3>
		<div class="left">
			<h5 id="from"></h5>
			<br />
			<h5 id="to"></h5>
		</div>
		<div class="middle">
			<h5>내용</h5>
			<form method="post" id="sendPaperForm">
				 <div class="input-wrap">			 
					<textarea name="content" id="memoContent"></textarea>
				 </div>
				<input class="button popup" type="button" value="메모쓰기" id="send" onclick="writeMemo();"/>
			</form>
 		</div>
	</div>
	<h2>메모</h2>
	
	<hr /> <br />
	
	<table id="tblBoard">
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<c:if test="${memo != null && fn:length(memo) != 0}">
	<c:forEach items="${memo}" var="dto">
		<tr class="memo">
			<td>${dto.rownum}</td>
			<td><span class="mb-wrap"><a href="#" class="mb-name1" id="nid=${dto.memoid }&memseq=${dto.memseq}">${dto.content}</a></span></td>
			<td><input type="button" class="button success tiny" value="삭제하기" onclick="deleteMemo(${dto.memoid});"></td>
		</tr>
	</c:forEach>
	</c:if>
	</table> <br />
	
		<span style="margin-left: 40%;">${pageBar}</span>
		<input type="button" class="button success tiny" value="메모쓰기" style="float: right;margin-right: 140px;" onclick="writeMemoPop();"/>

	<br />
	
	<%@ include file="/base/footer.jsp" %>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="js/header.js"></script>
	<script src="js/timple.js"></script>
	<script>
	
	$(".popup-close").click(function(e) {
		
		$(".war-text").remove();
		$(".war-state").removeClass("war-state");
		
		$(".popup-mask").hide();
		$(".popup-wrap").hide();
		
		$signEmail.focus(); // test 용.. 변수명 바꿔야함
		
	});
	
	function deleteMemo(memoid) {
		if (confirm("삭제하시겠습니까?")) {
			
		jQuery.ajax({
			url: "/deleteMemo.vs",
			type: "POST",
			data: {"memoid": memoid},
			dataType: "xml",
			success: function(xml) {
				jQuery(".memo").html("");
				if (jQuery(xml).find("code").text() == '1') {
					alert("메모가 삭제되었습니다.");
					location.reload();
				}
			},
			error: function(xml) {
				alert("삭제 실패");
			}
		});
		}
	}
	
	function writeMemoPop() {
			$(".popup-mask").show();
			$(".writeMemo").show();
			$loginEmail.focus();
	}
	
	function writeMemo() {
		if (jQuery("#memoContent").val() == "") {
			jQuery("#memoContent").showWarning('blank');
		} else {
			jQuery("#memoContent").removeWarningAll();
		jQuery.ajax({
			url: "/writeMemo.vs",
			type: "POST",
			data: {"content": jQuery("#memoContent").val()},
			dataType: "xml",
			success: function(xml) {
				if (jQuery(xml).find("code").text() == '1') {
					alert("메모가 작성되었습니다.");
					location.reload();
				}
			},
			error: function(xml) {
				alert("작성 실패");
			}
		});
	}
	}
	
	</script>
	</c:if>
</body>
</html>