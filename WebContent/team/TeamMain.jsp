<%@page import="visang.timple.model.TeamMainDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% //JSP 영역  %>
<% 
	ArrayList<Object> list = (ArrayList<Object>)request.getAttribute("list");
	int listSize = list.size();
%>
	
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>

<!-- 외부 CSS영역 -->
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<link rel="stylesheet" href="/css/teamMain.css" />

<!-- 외부 자바스크립트 영역 -->
<script src="/js/vendor/modernizr.js"></script>
	
<!-- 사이드바 영역 -->
<link rel="stylesheet" href="/css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<script>
	var ja = jQuery.noConflict();
</script>
	
<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>

<!-- 내부 CSS 영역 -->
<style type="text/css">

	/* 테이블 내부 */
	#team-table {
		/* width: 811px; */
	}
	#team-table td {
		/* width: 80px; */
		height: 50px;	
		text-align: center;			
	}
	#team-table tr .td1, #team-table tr .th1{
		
	}
	#team-table tr .td2, #team-table tr .th2 {
		width: 80px; 
	}
	#team-table tr .td3, #team-table tr .th3 {
		width: 80px; 
	}
	#team-table tr .td4, #team-table tr .th4 {
		width: 260px;
	}	
	#team-table tr .td5, #team-table tr .th5 {
		padding-right: 10px;
		width: 90px; 
	}
	
	/* input 태그 */
	input {
		border-radius: 10px;
	}
	
	/* 그래프 베이스 */
	.team-graph-base {
		border-right: 1px dotted black; 
		height: 30px; width: 21px; 
		/* border: 1px solid red; */
	}
	
	 
</style>

<!-- 내부 자바스크립트 영역 -->
<script>
	
	ja(document).ready(function(){	
		
		ja("#team-bp-graph").animate({ width:'${bpPercent}%'}, 1000); // BP진행률
		
		<%
		int j = 1;
		for(int i=0;i<listSize;i++) {
			String importance = ((TeamMainDTO)list.get(i)).getImportance();	
			
				if(importance.equals("1")) {	%>				
					ja("#td-graph<%=j %>").animate({ width:'33.3%'}, 1000);	
					
				
		<%		} else if(importance.equals("2")) {		%>		
					ja("#td-graph<%=j %>").animate({ width:'66.6%'}, 1000);
					
				
		<%		} else if(importance.equals("3")) {		%>		
					ja("#td-graph<%=j %>").animate({ width:'100%'}, 1000);	
					
		<%		}		j++;%>
				
		<% 	} 	%>
	}); 
	function linkBusiness(businessid,bpId) {		
		location.href = "/teamBusiness.vs?bpId=" + bpId + "&businessid=" + businessid;		
	}
	function tr_mouseover(tr) {		
		ja(tr).css({
			backgroundColor: "gray"						
		});
	}
	function tr_mouseout(tr) {	
		ja(tr).css({
			backgroundColor: "white"						
		});
	}
	
</script>
</head>

<!-- 바디 시작 -->
<body>
	<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">
		
	<c:if test="${rank == 0}">	
	<script>
		alert("업무 등록 권한이 없습니다.");
	
	</script>
	</c:if>
	<!-- 헤더 선택 -->
	
	<jsp:include page="/header.vs"></jsp:include>
	
	<div id="title">
		<p>${title}</p>
	</div> 	
	
	
<script>
	var js = jQuery.noConflict();
</script>
	
	
	<!-- 사이드 바 영역 -->
	 <jsp:include page="/sidemenu.vs"></jsp:include>
	
	<!-- 메인 영역 -->
	<section>
	<div id="team-main-flame">
		<div id="team-main">
		
			<!-- BP 이름 -->
			<div id="team-main-title">${bpName}</div>
			
			<!-- BP 진행률 -->
			<div id="team-main-header">
				<span class="team-header-content">전체 진행률</span>
				<div id="team-bp-graph-flame">
					<div id="team-bp-graph"></div>
				</div>		
			</div>
				
			<!-- 테이블 시작 -->
			<div id="team-main-body">
				<table id="team-table">
					<!-- 테이블 헤더 -->
					<tr>
						<th class="th1">업무</th>
						<th class="th2">중요도</th>
						<th class="th3">진행 상태</th>
						<th class="th4">기간</th>
						<th class="th5">담당자</th>
					</tr>
					
					<!-- 테이블 바디 -->
					
					<!-- 업무리스트 출력 -->						
					<c:set var="temp" value="1"/> 
					
					<c:forEach items="${list}" var="dto" >
					
					<!-- tr 이벤트(링크) -->
					<tr onclick="linkBusiness(${dto.businessid},${bpId});" onmouseover="tr_mouseover(this);" onmouseout="tr_mouseout(this);" style="cursor:pointer;">
						
						<!-- 업무 -->					
						<td class="td1">${dto.subject}</td>
						
						<!-- 중요도 -->
						<td class="td2">
							<div class="td-graph-flame" style="position: relative;">
								<div class="team-graph-base" style="position: absolute; top: 0px; left:0px;"></div>
								<div class="team-graph-base" style="position: absolute; top: 0px; left:21px;"></div>								
								<div class="td-graph" id="td-graph${temp}"></div> 
							</div>
						</td>
						
						<!-- 진행상태 -->
						<td class="td3">진행중</td>
						
						<!-- 기간 -->
						<td class="td4">${dto.startday} ~ ${dto.endday}</td>
						
						<!-- 담당자 -->
						<td class="td5">${dto.name}</td>				
					</tr>	
					<c:set var="temp" value="${temp+1}"/>					
					</c:forEach>
							 				
				</table>							
			</div>
		</div>
		<!-- 하단 버튼 영역 -->
		<div id="team-main-button">
				<input type="button" value=" 업무 등록 " onclick="location.href='/TeamBusinessAdd.vs?bpId='+${bpId}"/>				
				<!-- 업무 수정은 업무 클릭후 내부에서 구현 -->
				<input type="button" value=" 업무 삭제" onclick="location.href='/TeamBusinessDelete.vs?'"/>
		</div>		
	</div>		
	</section>
	
	<!-- 바닥 영역 -->
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	<script>
	$(document).ready(function(){
		var total = ${percent};
		
		$("#ing").animate({
			width: total + "%"
		}, 1000);
		
		
		var width = $("#ing").css("width");	
		
		if(total != 0){
			$("#ing").css("border-right", "1px solid #333");
		}
		
	});
	
	</script>
	</c:if>
</body>
</html>