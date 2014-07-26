<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!-- TemplateBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<style>
	h2 { text-align: center; }
	
	#tblBoard {
		display: block;
		border-collapse: collapse;
		
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

	#tblBoard th:nth-child(1) { width: 80px; }
	#tblBoard th:nth-child(2) { width: 100px; }
	#tblBoard th:nth-child(3) { width: 150px; }
	#tblBoard th:nth-child(4) { width: 200px; }
	#tblBoard th:nth-child(5) { width: 100px; }
	/* #tblBoard th:nth-child(6) { width:  }
	#tblBoard th:nth-child(7) { width:  } */
	
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
	/* #FriendList{
		border: 1px solid gray;
	} */	

	.friendBlock{
		padding-left: 50px;
	}

	.friend {
	 	/* width: 700px; */
		height: 50px;	
	}
	
	#FriendList {
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
		padding-left: 70px;
		padding-top: 40px;
		/* margin-top: 100px;
		margin-left: auto;
		margin-right: auto; */
		height: 500px;
		width: 800px;
	}
	
	.friend > td > img {
		width: 35px;
		height: 35px;
	}
</style>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="/css/mypage.css" />
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
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
	<div class="popup-wrap sendPaper">
		<a class="popup-close" href="#">
			<img src="images/popup_close.png" />
		</a>
		<h3>쪽지보내기</h3>
		<div class="left">
			<h5 id="from"></h5>
			<br />
			<h5 id="to"></h5>
		</div>
		<div class="right">
			<h5>내용</h5>
			<form method="post" id="sendPaperForm">
				 <div class="input-wrap">			 
					<textarea name="content" id="paperContent"></textarea>
				 </div>
				<input class="button popup" type="button" value="쪽지보내기" id="send"/>
			</form>
 		</div>
	</div>
	<div id="FriendList">
        <form>
        
        <%-- <table id="tblBoard">
		<tr>
			<th>종류</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	
		<tr class="nt" id="tr1">
			<td><span class="label radius">공지</span></td>
			<td>${dto.noticeId}</td>
			<td class="nt-subject"><a href="/help/NoticeView.vs?noticeId=${dto.noticeId}">${dto.subject}</a></td>
			<td style="font-weight: bold;">관리자</td>
			<td>${dto.id}</td>
			<td class="nt-subject"><a href="/help/NoticeView.vs?noticeId=${dto.noticeId}">${dto.subject}</a><span style="display: inline-block;">&nbsp;${dto.newImg}</span></td>
			<td style="font-weight: bold;">관리자</td>
			<td>${dto.regDate}</td>
		</tr> --%>
	
        
        	<table id="tblBoard" style="width: 720px; margin-left:-28px;">
        		<tr style="height:35px;">
        			<th></th>
        			<th class="friendBlock">이름</th>
        			<th class="friendBlock">전화번호</th>
        			<th class="friendBlock">이메일</th>
        			<th class="friendBlock"></th>
        			<th></th>
        		</tr>
        		<!---->
        		<c:forEach items="${Friends }" var="dto" varStatus="i">
        		<tr class="friend">			
        			<td><img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRyTtScpsfogDokXTxwqOlmdr_8pIQewQVPmtzoJDQHQHJ_x0yd" >
        			<td class="friendBlock">${dto.friendname }</td>
        			<td class="friendBlock nt-subject">${dto.tel }</td>
        			<td class="friendBlock nt-subject">${dto.email }</td>
        			<td class="friendBlock" style="padding: 0px;">
        				<input type="button" value="쪽지보내기" class ="sendPaperBtn button success tiny" id="sendPaperBtn${i.index }" style="margin-top: 20px;">
        			</td>
        			<td class="friendBlock">
        			<input type="button" value="절교하기" class ="deleteFriendBtn button success tiny" id="deleteFriendBtn${i.index }" style="margin-top: 20px;">
        			</td>
        		</tr>
        		</c:forEach>
        		<!---->	
        	</table>
			
            <!-- <div class="friend">
                <span><img src="/images/profile.jpg"></span>
                <span class="friendBlock">친구1호</span>
                <span class="friendBlock">010-1234-비밀이야</span>
                <span class="friendBlock">test@test.com</span>
                <span class="friendBlock"><input type="button" value="쪽지보내기"></span>
            </div> -->
    		<!---->
        </form>
	</div>
<%@ include file="/base/footer.jsp"%>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/header.js"></script>
	<script src="js/header.js"></script>
	<script type="text/javascript">
	
	var from = 0;
	var to = 0;
	
	$(".sendPaperBtn").click(function(e) {
		
		var evt = jQuery(e.target);
		
		<c:forEach items="${Friends }" var="dto" varStatus="i">
		if (evt.attr("id") == "sendPaperBtn${i.index}") {
			jQuery("#from").text("From : " + "${dto.membername}");
			jQuery("#to").text("to : " + "${dto.friendname}");
			from = ${dto.memberId};
			to = ${dto.friendId};
		}
		</c:forEach>
		
		$(".popup-mask").show();
		$(".sendPaper").show();
		$loginEmail.focus();
	});
	
	$(".deleteFriendBtn").click(function(e) {
		
		var evt = jQuery(e.target);
		
		<c:forEach items="${Friends }" var="dto" varStatus="i">
		if (evt.attr("id") == "deleteFriendBtn${i.index}") {
			to = ${dto.friendId};
			from = ${dto.memberId};
			 if (confirm("정말 절교하시겠습니까??") == true){    //확인
				 
						/* alert("from : " + from);
						alert("to : " + to); */
						jQuery.ajax({
							url: "/unFriendOk.vs",
							data: {"memseq": from, "friendseq": to},
							dataType: "xml",
							type: "POST",
							success: function(xml) {
								//if ($(xml).find("code").text() == '1') {
									alert("절교되었습니다.");
									location.reload();
								//}
							},
							error: function() {
								alert("절교실패");
							}
						});
			
			  } else {   //취소
			      return false;
			  }
		}
		</c:forEach>
	});
	
	$(".popup-close").click(function(e) {
		
		$(".war-text").remove();
		$(".war-state").removeClass("war-state");
		
		$(".popup-mask").hide();
		$(".popup-wrap").hide();
		
		$signEmail.focus(); // test 용.. 변수명 바꿔야함
		
	});
	
	jQuery("#send").click(function(e) {
		/* alert("from : " + from);
		alert("to : " + to); */
		jQuery.ajax({
			url: "/sendPaperOk.vs",
			data: {"from": from, "to": to, "content": jQuery("#paperContent").val()},
			dataType: "xml",
			type: "POST",
			success: function(xml) {
				if ($(xml).find("code").text() == '1') {
					alert("쪽지가 성공적으로 전송되었습니다.");
				}
			},
			error: function() {
				alert("전송실패");
			}
		});
	});
	</script>
	</c:if>
</body>
</html>