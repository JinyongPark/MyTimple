<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>${loginName }'s mypage</title>
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
	<div id="bodyf">
		 <div id="sidesec">
		 <img alt="" src="/images/mypageback.jpeg">
		</div> 
		<div id="mainframe">
			<div id="box2">
				<span class="mysec"><a href="/edit_member.vs"><img src = "/images/profile.png" width="100px;" height="100px;"/><br /><br />프로필</a></span> 
				<span class="mysec"><a href="/MyProject.vs"><img src = "/images/project.png" width="100px;" height="100px;"/><br /><br />내가참여한 프로젝트</a></span>
				<span class="mysec"><a href="/Paper/PaperList.vs"><img src = "/images/paper.png" width="100px;" height="100px;"/><br /><br />쪽지함</a></span>
				<span class="mysec"><a href="/MemoList.vs"><img src = "/images/paper.png" width="100px;" height="100px;"/><br /><br />메모목록</a></span> 
				<span class="mysec"><a href="/FriendsList.vs"><img src = "/images/friend.png" width="100px;" height="100px;"/><br /><br />친구목록</a></span>
				<span class="mysec"><a href="/myNoti.vs"><img src = "/images/notiBlack.png" width="100px;" height="100px;"/><br /><br />알림목록</a></span>
			</div>
		</div>
	</div> 
	
	<%@ include file="/base/footer.jsp"%>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/header.js"></script>
	</c:if>
</body>
</html>