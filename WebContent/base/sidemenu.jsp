<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script>


js(document).ready(function(){

    <c:set var="i" value="1" />
	<c:forEach items="${bpList}" var="dto">
		var gauge${i} = ${dto.bpercent};
		js("#gauge"+${i}).animate({			
			width: gauge${i} + "%"		
		}, 1000);
	<c:set var="i" value="${i+1}" />  
	</c:forEach>

});

</script> 


<aside id="sidebar" class="column" style="background-image: url('/images/${skin}');">

<%-- 	<span id="subtitle">
		${title}
	</span> --%>
	<h3>Business Plan</h3>
	
	
	<ul class="toggle">
		<c:set var="i" value="1" />
		<c:forEach items="${list2}" var="dto">
			<li class="icn_new_article"><div class="pPlan">
					<a href="/teamMainList.vs?bpid=${dto.bpid}"><span class="pText">${dto.name}</span></a>
					<div id="gauge${i}"></div>
				</div></li>
			<c:set var="i" value="${i+1}" />
		</c:forEach>

		<li class="add"><a href="/projects/PlanAdd.vs"><img
				src="/images/projectmain/plus.png" alt="더하기" />Plan 추가하기..</a></li>
		<li class="icn_tags"></li>
	</ul>
	<h3>게시판</h3>
	<ul class="toggle">
		<li class="icn_add_user"><a href="/TeamNotice.vs"><img
				src="/images/projectmain/smile.png" alt="dot" />공지사항</a></li>
		<li class="icn_view_users"><a href="/TeamBoard.vs?sortsubject=자유게시판"><img
				src="/images/projectmain/smile.png" alt="dot" />자유게시판</a></li>
				<li class="icn_profile">----------------------------------------</li>
		<c:set var="i" value="1" />
		<c:forEach items="${boardList}" var="dto">
			<c:if test="${dto.subject != '자유게시판'}" >
			<li class="icn_add_user"><a href="/TeamBoard.vs?TeamBoardSortSeq=${dto.teamboardsortid}&sortsubject=${dto.subject}"><img
				src="/images/projectmain/smile.png" alt="dot" />${dto.subject}</a></li>
			<c:set var="i" value="${i+1}" />		
			</c:if>	
		</c:forEach>
		<li class="add"><a href="/projects/BoardAdd.vs"><img
				src="/images/projectmain/plus.png" alt="더하기" />게시판 추가하기..</a></li>
	</ul>
	<!-- <h3>
		<a href="#">예산관리</a>
	</h3>
 -->
	<h3>
		<a href="/Calendar.vs">캘린더</a>
	</h3>

	<h3>
		<a href="/team/TeamTel.vs">팀원정보</a>
	</h3>
	
	<h3>
		<a href="/team/TeamMemo.vs">팀메모</a>
	</h3>
	
	<h3>
		<a href="/TeamData.vs">자료실</a>
	</h3>
	
	<c:if test="${grade == '1'}" >
	<h3>
		<a href="/Theme.vs">환경설정</a>
	</h3>
	</c:if>
</aside>
