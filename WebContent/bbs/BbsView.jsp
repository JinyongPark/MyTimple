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
		width: 84%;
		height: 650px;
		margin: auto;
	}
	
	#leftView {
		float: left;
		background-color: white;
		width: 47%;
		height: 600px;
		border-radius:6px;
		font-size: 0.8125rem;
		text-align: left;
	}
	
	#centerBtnList {
		float: left;
		width: 4%;
		height: 500px;
		margin-top: 50px;
		margin-left: 10px;
		margin-right: 10px;
	}
	
	#rightView {
		float: left;
		background-color: white;
		width: 47%;
		height: 600px;
		border-radius:6px;
		font-size: 0.8125rem;
		text-align: right;
	}
	
	#viewTxt {
		height: 380px;
		line-height: 20px;
		padding: 10px;
		overflow-y: scroll;
		border: 1px solid #D8DFE2;
		margin-bottom: 20px;
	}
	
	#list { float:left; margin-left: 5px; }
	
	#recom { float:left; margin-left: 5px; }
	
	#delete { float:right; margin-right: 5px; }

	#update { float:right; margin-right: 5px; }
	
	#leftViewBtn { height: 40px; margin-top: 200px; text-align: center; }
	#leftViewBtn:hover { background-color: teal; }
	
	#rightViewBtn { height: 40px; text-align: center; }
	#rightViewBtn:hover { background-color: silver; }
	
	#viewComment {
		height: 330px;
		line-height: 20px;
		padding-top: 1px;
		overflow-y: scroll;
		border: 1px solid #D8DFE2;
		border-bottom: none;
	}
	
	#comment {
		width: 100%;
		height: 70px;
		margin: auto;
		font-size: 0.8125rem;
	}
	
	.commentBody {
		padding: 10px;
		border-bottom: 1px solid #D8DFE2;
		text-align: left;
	}
	
	#commentInsert {
		float: right; margin-right: 10px;
	}
	
	.left-top {
		background-color: #EFF3F4;
		padding: 10px;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
		height: auto;
	}
	
</style>
<script type="text/javascript">
		
	$(document).ready(function(){
		var i = 2;
		
		$("#leftViewBtn").click(function(){
			if(i==2) {
				//$("#index").css("width", "810px");
				$("#leftView").css("width", "94%");
				$("#rightView").css("display", "none");
				--i;
			} else if(i==3) {
				//$("#index").css("width", "1540px");
				$("#leftView").css("width", "47%");
				$("#rightView").css("width", "47%");
				$("#rightView").css("display", "");
				$("#leftView").css("display", "");
				--i;
			}
		});
		
		$("#rightViewBtn").click(function(){
			if(i==1){
				//$("#index").css("width", "1540px");
				$("#leftView").css("width", "47%");
				$("#rightView").css("width", "47%");
				$("#leftView").css("display", "");
				$("#rightView").css("display", "");
				++i;
			} else if(i==2){
				//$("#index").css("width", "810px");
				$("#rightView").css("width", "94%");
				$("#leftView").css("display", "none");
				++i;
			}
		});
		
		$("#commentInsert").click(function(){
			$("#frm").submit();
		});
		
		// 리스트 목록 버튼
		$("#list").click(function(){
			location.href="/bbs/BbsList.vs";
		});
		
	});
	
	
	function del() {
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result == true) {
			location.href="/bbs/BbsDel.vs?boardId=" + ${dto.boardId};
		} else {
			alert("삭제를 취소합니다.");
		}
	}
	
	function recom() {
		location.href="/bbs/BbsRecom.vs?boardId=" + ${dto.boardId};
	}
	
	function update() {
		location.href="/bbs/BbsUpdate.vs?boardId=" + ${dto.boardId} + "&memSeq=" + ${dto.memSeq};
	}
	
	function cDel(commentId) {
		
		location.href="/bbs/BbsCommentDel.vs?boardId=" + ${dto.boardId} + "&commentId=" + commentId;
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
	
	<h2>Community</h2>

	<hr /> <br />
	
	<div id="index">
		<div id="leftView">
			
			
			<div class="left-top">
			<h5 style="font-weight: bold;">${dto.subject}</h5>
			
			
			${dto.post_type} - <span class="mb-wrap"><span class="mb-name" id="m${dto.memSeq}"> ${dto.name}</span></span> - ${dto.regDate}
			</div>
			
			
			<div id="viewTxt">
				${dto.content}
			</div>
						
			<input class="button tiny" type="button" id="list" value="목록보기" />
			<input class="button success tiny" type="button" id="recom" value="추천하기" onclick="recom();"/>
			
			<c:if test="${(dto.memSeq == Id) || (Id == '0')}">
				<input class="button tiny alert" type="button" id="update" value="수정하기" onclick="update();"/>
				<input class="button tiny alert" type="button" id="delete" value="삭제하기" onclick="del();"/>
			</c:if>
	
		</div>
		
		<div id="centerBtnList">
			<input type="text" id="leftViewBtn" readonly="readonly" placeholder="<<"/>
			<input type="text" id="rightViewBtn" readonly="readonly" placeholder=">>"/>
		</div>

		<div id="rightView">
			
			<div class="left-top">
			<h5 style="font-weight: bold;">댓  글</h5>
			</div>
			
			<div id="viewComment">
				<c:forEach items="${cList}" var="dto2">
				<div class="commentBody">
					
					<span class="mb-wrap"><span class="mb-name" id="m${dto2.memSeq}">${dto2.name}</span></span> - ${dto2.regDate} - 
					
					${dto2.content}
					<c:if test="${Id == dto2.memSeq}">
						<a href="#" onclick="cDel(${dto2.commentId});" class="right">[X]</a>
						<%-- <img src="/bbs/bbs_Image/bbs_cdel.jpg" onclick="cDel(${dto2.commentId});"/> --%>
					</c:if>
				</div>
				</c:forEach>
				
			</div>
			
			
			<form method="post" id="frm" action="/bbs/BbsComment.vs">
				<textarea id="comment" name="content" cols="30" rows="10" placeholder=" 명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유포등의 글은 이용 약관에 의해 제재는 물론 법률에 의해 처벌받을 수 있습니다. 건전한 커뮤니티를 위해 삼가주시기 바랍니다."></textarea>
				<br />	
				<input type="hidden" name="boardId" value="${dto.boardId}" />
				<input type="button" id="commentInsert" value="댓글입력" class="button tiny" />
			</form>
		</div>
	</div>
	
	<div style="clear: both;"></div>
	
	<br />
	
	<hr />
	
	<br />
	
	<%@ include file="/base/footer.jsp" %>
	
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
	<script src="/js/timple.js"></script>
	</c:if>
</body>
</html>