<%@page import="visang.timple.model.TeamBusinessDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% //JSP 영역  %>
<% 
	TeamBusinessDTO bdto = (TeamBusinessDTO)request.getAttribute("bdto");
	String importance = bdto.getImportance();
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
	
<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>

<!-- Calendar -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/pepper-grinder/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<style type="text/css">
	input {
		border-radius: 10px;
	}
	form {
		margin: 0;
	}
	#team-main-title {
		margin: 0px 0px 30px 20px;
	}
	#team-main {
		margin-top: 20px;
		
		/* border: 1px solid red; */		
	}
	#team-main-button {		
		margin: 25px 70px 120px 40px;
		
	}
	#team-table td:nth-child(1) {
		border-right: 1px solid gray;
		width: 135px;
		height: 70px;	
		text-align: center;				
	}
	
	#team-table td:nth-child(2) {
		width: 676px;			
		text-align: left;
		padding: 20px;
		line-height: 30px;		
	}
	
	/* 텍스트 길이 관리 */
	td span#td-state-flame, td span#td-subject-flame, td span#td-file-flame {		
		/* border: 1px solid red; */
		display: inline-block;		
		float: left;		
	}
	td span#td-state-flame {
		max-width: 415px;
		margin-right: 10px;
		margin-left: 10px;
	}
	
	td span#td-subject-flame{
		max-width: 630px;			
	}
	
	td span#td-file-flame {
		width: 670px;	
		margin: 0px 0px 0px 10px;			
	}

	
	td span#td-state, td span#td-subject, td span#td-file {		
		/* border: 1px solid blue; */
		width: 100%;
		height: 30px;
		overflow: hidden;				
	}	
	
	td span#td-Mark {
		font-weight: bold;
		color: red;
		font-size: 12pt;
		border-left: 1px solid gray;
		padding-left: 10px;		
	}
	
	/* 파일 첨부 버튼 */
	td span#td-file {
		width: 100%;
		display: inline;
		margin: auto 0px;
		
		/* float: left; */
		margin: 5px 0px -5px 0px;
	}
	td input.td-file-button {		
		margin-bottom: 0px;
		/* border: 1px solid red; */
		width: 570px;
		overflow: hidden;
		height: 30px;	
	}
	
	td input#td-fileButton {
		margin-left: 85%;
		margin-bottom: 0px;
		height: 30px;
	}
	
	.teamMainForm {
		margin: 5px 0px 0px 0px;		
	}	
	
	#upload-button {
		float: left;
		margin: 0px 10px 0px 5px;				
	}
	#business-file-delete {
		margin-left: 10px;
	}
	#business-file-download {
		max-width: 578px;
		display: inline-block;
	}
	
	#editPeriodStart, #editPeriodEnd, #editName, #editState {
		/* padding-left: 15px; */
		text-align: center;
		border-radius: 10px;
		display: inline-block;
		margin: 0px;
		height: 30px;
	} 
	  
	#editPeriodStart, #editPeriodEnd {
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 10px;
		width: 120px;		
	}	
	
	#editName {
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 10px;
		width: 120px;
	}
	#editState {
		width: 120px;	
		padding: 0px 0px 0px 10px;				
	}	
	
	/* 중요도 */
	#selImportance {
		width: 120px;
		padding: 0px 0px 0px 10px;
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 10px;
	}
	
	/* 그래프 */
	.team-graph-base {
		border-right: 1px dotted black; 
		height: 30px; width: 21px; 
		/* border: 1px solid red; */
		padding:0;
	}
	
	/* 그래프의 제일 외곽 */
	.td-graph-flame {
		width: 64px;
		height: 25px;
		text-align: left;
		margin: 2px 0px 0px 10px;
		padding:0;
		overflow: hidden;
	}
	#td-graph {
		
		margin: 0px 0px 0px 0px;
		height: 26px;
	}
	
	#businessEditText {
		margin: 0px 0px 0px 10px;
	}
	/* 타이틀. 제목 */
	#businessSubject {
		width:800px;
		font-size: 20pt;
		height: 50px;		
		border-radius : 20px;		
		padding: 0px 0px 0px 20px;
		margin: 0px 0px 0px 1px;
	}
	#chargePersonId {
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 10px;	
		padding: 0px 0px 0px 10px;
		width: 120px;
	}
</style>
<script>	
	
	$(document).ready(function() {
	    $('#td-fileButton').click(function() {
	    	window.open('/TeamUpload.vs','업로드','_blank','width=150,height=150');
	    });
	    <% if(importance.equals("1")) { %>
	 	   $('#td-graph').animate({ width:'33.3%'}, 1000);
	    <% } else if (importance.equals("2")) { %>
	   	 	$('#td-graph').animate({ width:'66.6%'}, 1000);
	    <% } else if (importance.equals("3")) { %>
	    	$('#td-graph').animate({ width:'100%'}, 1000);
	    <% } %>
	});	
	function file_delete(fileName,orgFileName) {
		$.ajax({
			type:"POST",
			url:"TeamFileDelete.vs",
			data:({
				"fileName":fileName,
				"orgFileName": orgFileName,	
				}),				
			success:fileCallBack			
		});
	}
	function fileCallBack(result) {
		
		alertContent = "\"" + result + "\" 이 정상적으로 삭제되었습니다.";
		alert(alertContent);
		/*
		var alertDiv = document.createElement("div");
		$(alertDiv).attr({
			id:"alertDiv",			
		}).css({
			width:"200px",
			height:"100px",
			position:"absolute",
			top:"300px",
			left:"300px",
			// 삭제 팝업창 띄우기 미완성 아직!!!
		}); 
		
		$("#ajax-team-main-file").append(alertDiv); */
		
	}	
	
	function businessCallBack (result) {
		alert(result);
	}
	$(function() {
		$("#editPeriodStart").datepicker({			
			changeMonth : true,
			changeYear : true,				
			dateFormat: "yy-mm-dd",
			});
		$("#editPeriodEnd").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat: "yy-mm-dd",
		});
	});
	
	function selChange(option) {
		var importance = $(option).val();
		
		if(importance==3) {
			$('#td-graph').animate({ width:'100%'}, 200);
		} else if (importance==2) {
			$('#td-graph').animate({ width:'66.6%'}, 200);
		} else if (importance==1) {
			$('#td-graph').animate({ width:'33.3%'}, 200);	
		}		
	}
	var index = 1;
	
	
	function formSubmit() {			
		
		var businessSubject = $("#businessSubject").val();
		var editPeriodStart = $("#editPeriodStart").val();
		var editPeriodEnd = $("#editPeriodEnd").val();		
		var businessEditText = $("#businessEditText").val();
		
		var startday = new Date(editPeriodStart);		
		var endday = new Date(editPeriodEnd);		
		
		if(endday - startday <0) {
			alert("종료날짜가 시작날짜를 앞설 수 없습니다.");
			$("#editPeriodStart").focus();
			return false;
		}		
		if (businessSubject == "") {
			alert("업무 제목을 입력하세요!");
			$("#businessSubject").focus();
			return false;
		} else if (editPeriodStart == "") {
			alert("시작날짜를 선택하세요!");
			$("#editPeriodStart").focus();
			return false;
		} else if (editPeriodEnd == "") {
			alert("종료날짜를 선택하세요!");
			$("#editPeriodEnd").focus();
			return false;		
		} else if (businessEditText == 0) {
			alert("업무 내용을 입력하세요!");
			$("#businessEditText").focus();
			return false;		
		}
		
		$("#formBusiness").submit();			
	}
</script>
</head>
<body style="position: relative;">
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
			
	<!-- 사이드 바 영역 -->
	 <jsp:include page="/sidemenu.vs"></jsp:include>
	
	<!-- 메인 영역 -->
	<section>
	<div id="team-main-flame">
	<div id="team-main">
		<form method="POST" action="teamBusinessEditOk.vs"  name="formBusiness" id="formBusiness">
		<!-- 타이틀 -->
			<div id="team-main-title">
				<span id="td-subject-flame">
				<span id="td-subject">
					<input type="text" name="businessSubject" id="businessSubject" value="${bdto.subject}"/> 
				</span></span>
			</div>
			<div id="team-main-body">
								
			
				<table id="team-table">					
					<tr>
						<td>기 한</td>
						<td>
							<input type="text" id="editPeriodStart" name="editPeriodStart" value="${bdto.startday}"/>
							<span style="margin: 0px 5px;">~</span> 
							
							<input type="text" id="editPeriodEnd" name="editPeriodEnd" value="${bdto.endday}"/>
						</td>
					</tr>
					<!-- 담당자 --> <!-- chargePerson -->
					
					<!--사용자 신분에 따라 -->
										
					<tr>
						<td>담당자</td>
						<td>
					
						<c:choose>	
							<c:when test="${rank eq '0' }">	<!-- 팀원 --> <!-- 자신의 아이디로만 작성 -->
												
								<input type="text" name="chargePerson" id="chargePerson" readonly value="${bdto.}"/>							
								<input type="hidden" name="chargePersonId" id="chargePersonId" value="${teamSeq}"/> 
							
							</c:when>
							
							<c:when test="${rank eq '1' }"> <!-- 팀장 --> <!-- 자신과 팀원의 아이디로 작성 -->
							
								<select name="chargePersonId" id="chargePersonId">																	
									<c:forEach items="${BpMemList}" var="dto">							 
											
										<c:if test="${dto.teamid == teamSeq }">
											<option value="${dto.teamid}" selected>${dto.name}</option> <!-- 포커스는 팀장 -->
										</c:if>
										
										<c:if test="${dto.teamid != teamSeq }">
											<option value="${dto.teamid}" > ${dto.name}</option>
										</c:if>
										
									</c:forEach>									
								</select>								
							</c:when>							
						</c:choose>	
						
						</td>
					</tr>
					
					<tr>
						<td>파 일</td>
						<td id="ajax-team-main-file">
							<c:if test="${empty fileList}">
								<span id="td-file-flame">
									<span id="td-file">첨부파일 없음</span>									
								</span>
							</c:if>
							<c:if test="${!empty fileList}">
								<span id="td-file-flame">
									<span id="td-file"><ul style="margin-bottom: 5px;">							
														<c:forEach items="${fileList}" var="dto">								
															<li>						
																${dto.orgfilename}<br />
															</li>												
														</c:forEach>
														</ul>
									</span>
								</span>
							</c:if>													
						</td>					
					</tr>	
					<tr>
						<td>중요도</td>
						<td>
							<div class="td-graph-flame" style="position: relative; float:left;">
								<div class="team-graph-base" style="position: absolute; top: 0px; left:0px;"></div>
								<div class="team-graph-base" style="position: absolute; top: 0px; left:21px;"></div>								
								<div class="td-graph" id="td-graph"></div>
							</div>
							<select id="selImportance" name="selImportance" onchange="selChange(this);">
							
							<% if(importance.equals("1")) { %>
	 	 						<option value="3">상</option>
								<option value="2">중</option>
								<option value="1" selected>하</option>
						    <% } else if (importance.equals("2")) { %>
						   	 	<option value="3">상</option>
								<option value="2" selected>중</option>
								<option value="1">하</option>
						    <% } else if (importance.equals("3")) { %>
						    	<option value="3" selected>상</option>
								<option value="2">중</option>
								<option value="1">하</option>
						    <% } %>
								
							</select>
						</td>
					</tr>									
					<tr>
						<td>진행상태</td>
						<td>						
						
							<span id="td-state-flame">
								<span id="td-state" >
								
								<select id="editState" name="editState">
								<c:forEach items="${statusList}" var="dto">
									<c:if test="${bdto.status eq dto.status}">
										<option value="${dto.businesstatusid}" selected>${dto.status}</option>
									</c:if>								
									<c:if test="${bdto.status ne dto.status}">
										<option value="${dto.businesstatusid}">${dto.status}</option>
									</c:if>
								</c:forEach>	
								</select>
																
								</span>
							</span>
							<span id="td-mark">								
									[${bdto.editdate}] 
							</span>
						
						</td>						
					</tr>
					<tr>
						<td>업무내용</td>
						<td><textarea id="businessEditText" name="businessEditText" rows="10"  style="margin:0; border-radius: 10px;  width: 654px; margin-left: 10px;">${bdto.content}</textarea>
						</td>
					</tr>												 				
				</table>
				<input type="hidden" name="businessid" id="businessid" value="${businessid}"/>
				
				
										
			</div>
			<div id="team-main-button">
					<input type="button" value=" 수정하기 " onclick="formSubmit();"/>
					<input type="button" value=" 돌아가기 " onclick="location.href='/teamMainList.vs?bpid=${bpId}'"/>					
			</div>
			</form>
		</div>			
	</div>		
	</section>
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>