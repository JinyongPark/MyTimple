<%@page import="visang.timple.model.TeamBusinessDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- 사이드 바 영역 -->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/sidemenu/hideshow.js"></script>
<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>

<!-- 캘린더 영역 -->
<script 
	src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/pepper-grinder/jquery-ui.css">

<!-- 내부 CSS영역 -->
<style type="text/css">
	input[type='button'] {			
		border-radius : 10px;	
	}
	#team-main-title {
		margin: 0px 0px 30px 20px;
	}
	#team-main {
		margin-top: 20px;
		/* border: 1px solid red; */		
	}
	#team-main-button {
			
	}
	#team-table td:nth-child(1) {
		border-right: 1px solid gray;
		width: 135px;
		/* height: 70px; */	
		text-align: center;				
	}
	
	#team-table td:nth-child(2) {
		width: 676px;			
		text-align: left;
		padding: 20px;
		line-height: 30px;		
	}
	form, select {
		margin: 0; padding: 0;
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
	}
	
	td span#td-subject-flame{
		max-width: 630px;			
	}
	
	td span#td-file-flame {
		width: 670px;			
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
		margin: 2px 0px 0px 5px;
		padding:0;
		overflow: hidden;
	}
	#td-graph {
		
		margin: 0px 0px 0px 0px;
		height: 26px;
	}
	
	/* 시작날짜, 끝날짜, 담당자, 중요도, 현재상태 */	
	#startDayCalendar, #endDayCalendar, #chargePerson, #selImportance, #selStatus {
		
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 0px;			
	}
	
	/* 시작날짜, 끝날짜, 담당자, 중요도, 현재상태 */	
	#selImportance, #chargePerson, #selStatus {
		padding: 0px 0px 0px 10px;		
	}
	
	/* 시작날짜, 끝날짜 */
	#startDayCalendar, #endDayCalendar {
		width: 120px;
		
	}
	/* 시작날짜, 중간 span */
	#startDayCalendar, #calendarSpan {
		float: left;
	}
	
	/* 중간 span */	
	#calendarSpan {
		margin: 0px 10px;
	}
	
	/* 테이블. 담당자  */
	#chargePerson {
		width: 120px;
	}
	
	/* 테이블. 중요도 */	
	#selImportance {
		width: 120px;
		margin-left: 10px;
	}
	/* 테이블. 현재상태 */
	#selStatus {
		width: 120px;
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
	#businessTextarea {
		height: 120px;
		border-radius : 10px;
		padding: 10px;
		margin: 0;
		font-size: 12pt;	
	}
	#chargePersonId {
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		margin: 0px 0px 0px 0px;	
		padding: 0px 0px 0px 5px;
		width: 120px;
	}	
</style>

<!-- 내부 자바스크립트 영역 -->
<script>	
	
	$(document).ready(function() {
	    $('#td-fileButton').click(function() {
	    	window.open('/TeamUpload.vs','업로드','_blank','width=150,height=150');
	    });
	    $('#td-graph').animate({ width:'66.6%'}, 200);	   
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
	}		

	
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
	
	$(function() {
		$("#startDayCalendar").datepicker({			
			changeMonth : true,
			changeYear : true,				
			dateFormat: "yy-mm-dd",
			});
		$("#endDayCalendar").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat: "yy-mm-dd",
		});
	});
	
	function submitForm() {		
		
		var businessSubject = $("#businessSubject").val();
		var editPeriodStart = $("#startDayCalendar").val();
		var editPeriodEnd = $("#endDayCalendar").val();		
		var businessEditText = $("#businessTextarea").val();
		
		var startday = new Date(editPeriodStart);		
		var endday = new Date(editPeriodEnd);		
		
		if(endday - startday <0) {
			alert("종료날짜가 시작날짜를 앞설 수 없습니다.");
			$("#startDayCalendar").focus();
			return false;
		}		
		if (businessSubject == "") {
			alert("업무 제목을 입력하세요!");
			$("#businessSubject").focus();
			return false;
		} else if (editPeriodStart == "") {
			alert("시작날짜를 선택하세요!");
			$("#startDayCalendar").focus();
			return false;
		} else if (editPeriodEnd == "") {
			alert("종료날짜를 선택하세요!");
			$("#endDayCalendar").focus();
			return false;		
		} else if (businessEditText == 0) {
			alert("업무 내용을 입력하세요!");
			$("#businessTextarea").focus();
			return false;		
		}
		
		$("#addForm").submit();
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
		
			<!-- 전송 폼 -->
			<form method="POST" action="/TeamBusinessAddOk.vs" id="addForm" >
			<!-- 타이틀 -->
			<div id="team-main-title">
				<span id="td-subject-flame">
				<span id="td-subject">
					<input type="text" name="businessSubject" id="businessSubject" placeholder="제목을 입력하세요"/> 
				</span></span>
			</div>
			<!-- 바디영역 -->	
			<div id="team-main-body">
				
				<!-- 테이블 -->				
				<table id="team-table">	
					
					<!-- 기한 -->								
					<tr>
						<td>기한</td>
						<!-- 캘린더 영역 --> <!-- startDayCalendar --> <!-- endDayCalendar -->
						<td>
						
							<input type="text" name="startDayCalendar" id="startDayCalendar" />
							<span id="calendarSpan">~</span>
							<input type="text" name="endDayCalendar" id="endDayCalendar" />
						
						</td>
					</tr>
					
					<!-- 담당자 --> <!-- chargePerson -->
					
					<!--사용자 신분에 따라 -->
										
					<tr>
						<td>담당자</td>
						<td>
						<!-- <div> -->
						<c:choose>	
							<c:when test="${rank eq '0' }">	<!-- 팀원 --> <!-- 자신의 아이디로만 작성 -->
												
								<input type="text" name="chargePerson" id="chargePerson" readonly value="${loginName}"/>							
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
					
					<!-- 파일 -->
					<tr>
						<td>파일</td>
						<td id="ajax-team-main-file">							
								<span id="td-file-flame">
									<span id="td-file">업무 등록 후 첨부파일을 추가하세요</span>									
								</span>																			
						</td>					
					</tr>
					
					<!-- 중요도 --> <!-- selImportance -->
					<tr>
						<td>중요도</td>
						<td>
							<div class="td-graph-flame" style="position: relative; float:left;">
								<div class="team-graph-base" style="position: absolute; top: 0px; left:0px;"></div>
								<div class="team-graph-base" style="position: absolute; top: 0px; left:21px;"></div>								
								<div class="td-graph" id="td-graph"></div>
							</div>
							<select id="selImportance" name="selImportance" onchange="selChange(this);">
								<option value="3">상</option>
								<option value="2" selected>중</option>
								<option value="1">하</option>
							</select>
						</td>
					</tr>	
					
					<!-- 현재상태 -->	<!-- selStatus -->								
					<tr>
						<td>현재상태</td>
						<td>
						
							<span id="td-state-flame">
								<span id="td-state">
									<select id="selStatus" name="selStatus">
									<c:forEach items="${statusList}" var="dto" >
										<option value="${dto.businesstatusid}">
											${dto.status}
										</option>
									</c:forEach>										
									</select>								
								</span>
							</span>							
						</td>						
					</tr>
					
					<!-- 업무내용 --> <!-- businessTextarea -->
					<tr>
						<td>업무내용</td>
						<td><textarea id="businessTextarea" name="businessTextarea" cols="30" placeholder="내용을 입력하세요."></textarea></td>
						
					</tr>												 				
				</table>
				<input type="hidden" name="bpId" value="${bpId}"/>					
			</div>			
			<div id="team-main-button">
				<input type="button" value=" 등록하기 " onclick="submitForm();">
				<input type="button" value=" 돌아가기 " onclick="location.href='/teamMainList.vs?bpid='+${bpId}"/>					
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