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
<script src="../js/vendor/modernizr.js"></script>

<!-- 사이드바 영역 -->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/sidemenu/hideshow.js"></script>
<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
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
	
	$(document).ready(function(){	
		
		$("#team-bp-graph").animate({ width:'50%'}, 1000);	
		<%
		int j = 1;
		for(int i=0;i<listSize;i++) {
			String importance = ((TeamMainDTO)list.get(i)).getImportance();	
			
				if(importance.equals("1")) {	%>				
					$("#td-graph<%=j %>").animate({ width:'33.3%'}, 1000);	
					
				
		<%		} else if(importance.equals("2")) {		%>		
					$("#td-graph<%=j %>").animate({ width:'66.6%'}, 1000);
					
				
		<%		} else if(importance.equals("3")) {		%>		
					$("#td-graph<%=j %>").animate({ width:'100%'}, 1000);	
					
		<%		}		j++;%>
				
		<% 	} 	%>
	}); 
	function linkBusiness(businessid) {		
		location.href = "/teamBusiness.vs?businessid=" + businessid;		
	}
	function tr_mouseover(tr) {		
		$(tr).css({
			backgroundColor: "gray"						
		});
	}
	function tr_mouseout(tr) {	
		$(tr).css({
			backgroundColor: "white"						
		});
	}
	function deleteBusiness(businessid) {
		if(confirm("삭제하시겠습니까?")) {
			location.href="/TeamBusinessDeleteOk.vs?businessid=" + businessid;			
		}
		
	}
	
</script>
</head>

<!-- 바디 시작 -->
<body>
	
	<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq != null }">
		
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
						<th class="th5">삭제</th>
					</tr>
					
					<!-- 테이블 바디 -->
					
					<!-- 업무리스트 출력 -->						
					<c:set var="temp" value="1"/> 
					
					<c:forEach items="${list}" var="dto" >
					
					<!-- tr 이벤트(링크) -->
					<tr onmouseover="tr_mouseover(this);" onmouseout="tr_mouseout(this);">
						
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
						<td class="td5"><input type="button" style="width: 50px;" value="삭제" onclick="deleteBusiness(${dto.businessid});"/></td>
									
					</tr>	
					<c:set var="temp" value="${temp+1}"/>					
					</c:forEach>
							 				
				</table>							
			</div>
		</div>
		<!-- 하단 버튼 영역 -->
		<div id="team-main-button">				
				<input type="button" value=" 돌아가기 " onclick="location.href='/teamMainList.vs?'"/>
		</div>		
	</div>		
	</section>
	
	<!-- 바닥 영역 -->
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>