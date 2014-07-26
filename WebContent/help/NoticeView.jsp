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
<script src="/js/header.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<style type="text/css">

	h2 { text-align: center; }
	
	#index {
		width: 1000px;
		height: 650px;
		margin: 0 auto;
		padding-top: 25px;
		background-color: lightblue;
		text-align: center;
	}
	
	#leftView {
		float: left;
		border: 1px solid lightgreen;
		background-color: white;
		width: 900px;
		height: 600px;
		margin-left: 35px;
	}
/* 	
	#centerBtnList {
		float: left;
		width: 50px;
		height: 500px;
		margin-top: 50px;
		margin-left: 10px;
		margin-right: 10px;
	} */
	
/* 	#rightView {
		float: left;
		border: 1px solid lightgreen;
		background-color: white;
		width: 700px;
		height: 600px;
	} */
	
	#viewTxt {
		height: 380px;
		line-height: 20px;
		padding-top: 1px;
		overflow-y: scroll;
	}
	
	#list { float:left; width:80px; font-size: 12pt; text-align: center; margin-left: 5px; }
	#list:HOVER { background-color:	lightgreen; color: black; }
	
	#recom { float:left; width: 80px; font-size: 12pt; text-align: center; margin-left: 5px; }
	#recom:HOVER { background-color: orange; }
	
	#delete { float:right; width: 80px; font-size: 12pt; text-align: center; margin-right: 5px; }
	#delete:HOVER { background-color: red; }

	#update { float:right; width: 80px; font-size: 12pt; text-align: center; margin-right: 5px; }
	#update:HOVER { background-color: yellow; }
	
/* 	#leftViewBtn { height: 40px; margin-top: 200px; text-align: center; }
	#leftViewBtn:hover { background-color: teal; }
	
	#rightViewBtn { height: 40px; text-align: center; }
	#rightViewBtn:hover { background-color: silver; } */
	
	/* #viewComment {
		height: 330px;
		line-height: 20px;
		padding-top: 1px;
		overflow-y: scroll;
	} */
	
/* 	#comment {
		width: 680px;
		height: 70px;
		margin: 0 auto;
	} */
	
	/* #commentInsert {
		float: right; width: 80px; font-size: 12pt; 
		text-align: center; margin-right: 10px;
	} */
	/* #commentInsert:HOVER { background-color: lightgreen; } */
	
</style>
<script type="text/javascript">
		
	$(document).ready(function(){

		$("#commentInsert").click(function(){
			$("#frm").submit();
		});
		
		// 리스트 목록 버튼
		$("#list").click(function(){
			location.href="/help/NoticeList.vs";
		});
		
	});
	
	
	function del() {
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			location.href="/help/NoticeDel.vs?noticeId=" + ${dto.noticeId};
		} else {
			alert("삭제를 취소합니다.");
		}
	}
	
	function update() {
		location.href="/help/NoticeUpdate.vs?noticeId=" + ${dto.noticeId};
	}
	
	

		
</script>
</head>
<body>
	<jsp:include page="/header.vs"></jsp:include>
	
	<br />
	<h2>공지사항</h2>

	<hr /> <br />
	
	<div id="index">
		<div id="leftView">
			<br />
			<h4> ${dto.subject}</h4>
			<hr />
			
			${dto.noticeId} - ${dto.id} - ${dto.regDate}
			
			<hr />
			
			<div id="viewTxt">
				${dto.content}
			</div>
			
			<hr style="margin-bottom: 6px;"/>
			
			<input type="text" id="list" readonly="readonly" placeholder="목록보기" />
			
			<c:if test="${memSeq == '0'}">
				<input type="text" id="update" readonly="readonly" placeholder="수정하기" onclick="update();"/>
				<input type="text" id="delete" readonly="readonly" placeholder="삭제하기" onclick="del();"/>
			</c:if>
	
		</div>
	<%-- 	
		<div id="centerBtnList">
			<input type="text" id="leftViewBtn" readonly="readonly" placeholder="<<"/>
			<input type="text" id="rightViewBtn" readonly="readonly" placeholder=">>"/>
		</div>

		<div id="rightView">
			<br />
			
			<h4>댓  글</h4>
			
			<hr />
			
			<div id="viewComment">
				<c:forEach items="${cList}" var="dto2">
				<div id="commentBody">
					${dto2.name} - ${dto2.regDate} - 
					<c:if test="${Id == dto2.memSeq}">
						<img src="/help/help_Image/help_cdel.jpg" onclick="cDel(${dto2.commentId});"/>
					</c:if> <br><br />
					${dto2.content}
					<hr />
				</div>
				</c:forEach>
				
			</div>
			
			<hr />
			
			<form method="post" id="frm" action="/help/NoticeComment.vs">
				<textarea id="comment" name="content" cols="30" rows="10" placeholder=" 명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유포등의 글은 이용 약관에 의해 제재는 물론 법률에 의해 처벌받을 수 있습니다. 건전한 커뮤니티를 위해 삼가주시기 바랍니다."></textarea>
				<br />	
				<input type="hidden" name="noticeId" value="${dto.noticeId}" />
				<input type="text" id="commentInsert" readonly="readonly" placeholder="댓글입력"/>
			</form>
		</div>
	 --%>
	</div>
	<div style="clear: both;"></div>
	
	<br />
	
	
	<br />
	
	<%@ include file="/base/footer.jsp" %>
	
	<script src="/js/foundation.min.js"></script>
</body>
</html>