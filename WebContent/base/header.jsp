<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/header.css" />
<c:if test="${loginSeq != null }">
<nav class="top-bar" data-topbar >
	<ul class="title-area">
		<li class="name">
			<h1>
				<a href="/"><span id="logo">Timple</span><sup id="alpha"> 𝞪</sup></a>
			</h1>
		</li>
	</ul>

	<section class="top-bar-section" >
		<!-- Left Nav Section -->
		<ul class="left">
			<li><a href="/projects/ProjectList.vs">프로젝트 찾아보기</a></li>
			<li><a href="/projects/ProjectAdd.vs">프로젝트 등록</a></li>
			<li><a href="/bbs/BbsList.vs">커뮤니티</a></li>
		</ul>
		<!-- Right Nav Section -->
		<ul class="right">
			<li id = "mp">
				<a href="#" id="mpic">나의 프로젝트</a>
				<c:if test="${fn:length(MyProject) != 0}">
				<div class="pop" id="mypj">
					<c:forEach items="${MyProject}" var="dto">
					<a href="/projects/ProjectMain.vs?projectid=${dto.projectId }" class="myprojectList">
						<c:if test="${!empty thumnail}">
						<span style="width: 50px; display: inline-block;"><img id="pj" src="/Timple/thumnail/${thumnail }.jpg" width="50px" height="50px"/></span>
						</c:if>
						<c:if test="${empty thumnail}">
						<span style="width: 50px; display: inline-block;"><img id="pj" src="http://www.wordpressn.com/wp/wp-content/uploads/2014/04/default_image_01-1024x1024-570x321.png" width="50px" height="50px"/></span>
						</c:if>
						<span style="width: 250px;">${dto.projectname }</span><br />
					</a>
						<%-- <div>
							<div>${dto.projectname }</div>
							<!-- <div>테슫흥</div> -->
						</div> --%>	
					</c:forEach>
					</div>
				</c:if>
				<c:if test="${fn:length(MyProject) == 0}">
				<div class="pop" id="mypj">등록된 프로젝트가 없습니다.</div>
				</c:if>
			</li>
			<li>
				<a href="#" id = "ma"><img id = "maicon" src="/images/mail.png" class="hicon" /></a>
				<c:if test="${fn:length(Paper) != 0}">
				<div id="mail_pop" class="pop">	
					<c:forEach items="${Paper }" var="Paper">
					<div class="box">${Paper.content }<br /> by ${Paper.fromname }</div>
					</c:forEach>
					<div class="box"><input type="button" class="button" value="모든 쪽지 보기" onclick="location.replace('/Paper/PaperList.vs');"/></div>
				</div>
				</c:if>
				<c:if test="${fn:length(Paper) == 0}">
				<div id="mail_pop" class="pop">	
					<div class="box">쪽지가 없습니다.</div>
					<div class="box"><input type="button" class="button" value="모든 쪽지 보기" onclick="location.replace('/Paper/PaperList.vs');"/></div>
				</div>
				
				</c:if>
				
			</li>
			<li>
				<a href="#" id="me"><img id = "meicon" src="/images/memo.png" class="hicon" /></a>
				<div id="memo_pop" class="pop">
				<c:if test="${fn:length(Memo) != 0}">
					<c:forEach items="${Memo }" var="memo">
					<div class="box">${memo.content }</div>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(Memo) == 0}">
				<div class="box">메모가 없습니다.</div>
				</c:if>
				<div class="box"><input type="button" class="button" value="모든 메모 보기" onclick="location.replace('/MemoList.vs');"/></div>
				</div>
			</li>
			<li>
				<a href="#" id="no"><img id = "nicon" src="/images/noti.png" class="hicon" />${ncount }</a>
				<div id="noti_pop" class="pop">
				<c:if test="${fn:length(Noti) != 0 || fn:length(paperListAtnoti) != 0}">
					<c:forEach items="${Noti }" var="noti">
					<div class="box" onclick="noti_confirm(${noti.notificationId});">${noti.content }<!-- <input type="button" onclick="noti_confirm();" value="확인"> --></div>
					</c:forEach>
					<c:forEach items="${paperListAtnoti }" var="pnoti">
					<c:if test="${pnoti.kind == 2 }">
					<div class="box">
						<input type="button" class="button cancel tiny" onclick="preject(${pnoti.toId}, ${pnoti.projectid }, ${pnoti.fromId }, ${pnoti.paperid });" value="거절" style="float: right; margin-right: 20px;">
						${pnoti.content }<input type="button" class="button tiny" onclick="paccept(${pnoti.toId}, ${pnoti.projectid }, ${pnoti.fromId }, ${pnoti.paperid });" value="수락" style="float: right; margin-right: 20px;">
					</div>
					</c:if>
					<c:if test="${pnoti.kind == 3 }">
					<div class="box">
						<input type="button" class="button cancel tiny" onclick="freject(${pnoti.toId}, ${pnoti.fromId }, ${pnoti.paperid });" value="거절" style="float: right; margin-right: 20px;">
						${pnoti.content }<input type="button" class="button tiny" onclick="faccept(${pnoti.fromId}, ${pnoti.toId }, ${pnoti.paperid });" value="수락" style="float: right; margin-right: 20px;">
					</div>
					</c:if>
					</c:forEach>
						<div class="box"><input type="button" class="button" value="더보기" onclick="location.replace('/myNoti.vs');"/></div>
				</c:if>
				<c:if test="${fn:length(Noti) == 0 && fn:length(paperListAtnoti) == 0}">
					<div class="box">알림이 없습니다.</div>
					<div class="box"><input type="button" class="button" value="모든 알림 보기" onclick="location.replace('/myNoti.vs');"/></div>
				</c:if>
				</div>
				</li>
			<li>
				<a href="#" id="us"><img id = "manicon" src="/images/man.png" class="hicon" />&nbsp;&nbsp;&nbsp;${loginName }</a>
				<div id="man_pop" class="pop">
					<div id="profile">
					<c:if test="${loginPicture == null }">
						<img src="/images/search.jpg" width="100px;" height="100px;" /><br />
					</c:if>
					<c:if test="${loginPicture != null }">
						<img src="${loginPicture }" width="100px;" height="100px;" /><br />
					</c:if>
						<h4 style="text-align: center;">${loginName }</h4>
					</div>
					<c:if test="${fn:length(Friends) != 0}">
					<c:forEach items="${Friends }" var="friends">
					<div class="box">
						${friends.friendname }
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${fn:length(Friends) == 0}">
					<div class="box">
						친구가 없네요... :( 친구좀 사겨봐요....
					</div>
					</c:if>
					<div>
						<input type="button" class="button tiny" value="마이페이지" onclick="location.replace('/mypage.vs');" style="margin: 5px 15px 20px 25px;">
						<input type="button" class="button tiny" value="로그 아웃" onclick="location.replace('/Sign_out.vs');" style="margin: 5px 15px 20px 25px;">
					</div>
				</div>
			</li>
		</ul>
	</section>
</nav>
</c:if>
<c:if test="${loginSeq == null }">
	<nav class="top-bar" data-topbar>
	<ul class="title-area">
		<li class="name">
			<h1>
				<a href="/"><span id="logo">Timple</span><sup id="alpha"> 𝞪</sup></a>
			</h1>
		</li>
	</ul>

	<section class="top-bar-section">

		<!-- Left Nav Section -->
		<ul class="left">
			<li><a href="#" onclick="location.href='/introduce/function.jsp';">사이트 소개</a></li>
		</ul>

		<!-- Right Nav Section -->
		<ul class="right">
			<!-- <li><a href="/projects/ProjectList.vs">프로젝트 둘러보기</a></li> -->
			<li><a href="#" id="loginBtn">로그인</a></li>
		</ul>

	</section>
</nav>
</c:if>
<script>
	
</script>