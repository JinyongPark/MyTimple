<%@page import="visang.timple.model.TeamBusinessDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% //JSP영역 %>
<%	
	// 1. 업무 디테일 목록 가져오기
	TeamBusinessDTO dto = (TeamBusinessDTO)request.getAttribute("bdto");
	
	// 2. 중요도 그래프 % 채우기
	String importanceStr = dto.getImportance();								
	Double importanceDou = Double.parseDouble(importanceStr);	
	Double importance = importanceDou*33.3;	
	
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
	/* input 태그 */
	input {
		border-radius: 10px;
	}
	
	/*  */
	#team-main-title {
		margin: 0px 0px 30px 20px;
	}
	#team-main {
		margin-top: 20px;
		/* border: 1px solid red; */		
	}
	#team-main-button {
			
	}
	
	/* 테이블 내부 */
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
	
	/* 테이블 내부. 텍스트 길이 관리 */
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
	
	/* 버튼. 파일 첨부하기  */
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
	
	/* 폼 태그 */
	.teamMainForm {
		margin: 5px 0px 0px 0px;		
	}	
	
	/* 그래프 베이스 */
	.team-graph-base {
		border-right: 1px dotted black; 
		height: 30px; width: 21px; 
		/* border: 1px solid red; */
	}
	.td-graph-flame {
		width: 63px;
		height: 25px;
		text-align: left;
	}
	
	/* 담당자 리스트 */
	#editName {
		height: 30px;
		border-radius : 10px;		
		text-align: center;
		
		width: 120px;
	}
	.businessCommentFlame {
		width:814px; height: 185px; border: 1px solid gray; margin: 30px 60px; border-radius: 10px; position: relative;
	}
	.businessComment {
		position: absolute; top:29px; left:733px; width:71px; height: 69px; border: 1px solid gray; border-radius: 10px;padding: 23px 10px 20px 10px; text-align: center; font-size: 15pt; cursor:pointer;
	}
	.businessCommentInput {
		position: absolute; top:42px; left:14px; width:100px; height: 30px; border: 1px solid gray; border-radius: 10px; text-align: center;
	}	
	.businessCommentTextarea {
		position: absolute; top:23px; left:129px; width:594px; height: 136px; border: 1px solid gray; border-radius: 10px; padding: 10px; font-size: 12pt;
	}
</style>

<!-- 내부 자바스크립트 영역 -->


<script>	
	
	ja(document).ready(function() {
	    ja('#td-fileButton').click(function() {
	    	window.open('/TeamUpload.vs','업로드','_blank','width=150,height=150');
	    });
	    ja('#td-graph').animate({ width:'<%=importance%>%'}, 1000);	   
	    
	});	
	function file_delete(fileName,orgFileName) {
		ja.ajax({
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
	
	function sendComment () {
		
		var businessCommentTextarea = ja("#businessCommentTextarea").val();
		if (businessCommentTextarea == "") {
			alert("댓글내용을 입력하세요!");
			("#businessCommentTextarea").focus();
			return false;
		}
		ja("#commentForm").submit();			
	}
	function deleteComment(commentid) {
		ja("#businesscommentid").val(commentid);
		ja("#commentDeleteForm").submit();		
	}
</script>
</head>
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
	
	<script>
	var js = jQuery.noConflict();
	</script>	
		
	<!-- 사이드 바 영역 -->
	 <jsp:include page="/sidemenu.vs"></jsp:include>
	
	<!-- 메인 영역 -->
	<section>
	<div id="team-main-flame">
	<div id="team-main">
		<div id="team-main-title"><span id="td-subject-flame"><span id="td-subject">${bdto.subject}</span></span></div>
			
			<div id="team-main-body">				
				<table id="team-table">					
					<tr>
						<td>기한</td>
						<td>${bdto.startday} ~ ${bdto.endday}</td>
					</tr>
					<tr>
						<td>담당자</td>
						<td>
							<span id="editName">${bdto.name}</span>							
						</td>
					</tr>
					
					<tr>
						<td>파일</td>
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
																<a href="/TeamDownload.vs?fileName=${dto.filename}&orgFileName=${dto.orgfilename}" id="business-file-download">${dto.orgfilename}</a><input type="button" value=" 삭제 " id="business-file-delete" onclick="file_delete('${dto.filename}','${dto.orgfilename}');"><br />
															</li>												
														</c:forEach>
														</ul>
									</span>
								</span>
							</c:if>
							
							<input type="button" value=" 파일 추가 " id="td-fileButton" />													
													
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
							
						</td>
					</tr>										
					<tr>
						<td>현재상태</td>
						<td>
						<c:if test="${empty bdto.editdate}">
							<span id="td-state-flame">
								<span id="td-state">변동내역 없음</span>
							</span>
							
						</c:if>
						<c:if test="${!empty bdto.editdate}">
							<span id="td-state-flame">
								<span id="td-state">${bdto.status}</span>
							</span>
							<span id="td-mark">								
									[${bdto.editdate}]
							</span>
						</c:if>
						</td>						
					</tr>
					<tr>
						<td>업무내용</td>
						<td>${bdto.content}</td>
					</tr>												 				
				</table>
										
			</div>
			
			<div id="team-main-button">
					<input type="button" value=" 업무수정 " onclick="location.href='/teamBusinessEdit.vs?bpid='+${bpId}+'&businessid='+${businessid}"/>
					<input type="button" value="돌아가기" onclick="location.href='/teamMainList.vs?bpid='+${bpId}"/>					
			</div>
			<form method="POST" id="commentForm"action="TeamBusinessCommentOk.vs">	
			<div class="businessCommentFlame">
				<div class="businessComment" onclick="sendComment();">입 력</div>
				<input class="businessCommentInput" name="businessCommentInput"type="text" disabled value="${loginName}" style="position: absolute; top:42px; left:14px; width:100px; height: 30px; border: 1px solid gray; border-radius: 10px; text-align: center;"/>		
				<textarea class="businessCommentTextarea" name="businessCommentTextarea"></textarea>
				<input type="hidden" name="businessid" value="${businessid}"/>
				<input type="hidden" name="teamid" value="${teamId}"/>
								
			</div>
			</form>
			<c:forEach items="${commentList}" var="dto">
			<div class="businessCommentFlame">
				<div class="businessComment" onclick="deleteComment(${dto.businesscommentid});">삭제</div>
				<input class="businessCommentInput" type="text" disabled value="${dto.name}" style="position: absolute; top:42px; left:14px; width:100px; height: 30px; border: 1px solid gray; border-radius: 10px; text-align: center;"/>		
				<textarea class="businessCommentTextarea" readonly>${dto.content}</textarea>											
			</div>	
			</c:forEach>			
			<form method="GET" action="businesscommentDelete.vs" name="commentDeleteForm" id="commentDeleteForm">
				<input type="hidden" name="businesscommentid" value="${dto.businesscommentid}" id="businesscommentid"/>
			</form>	
						  
		</div>
		</div>		
	</section>
	<footer>
		<%@ include file="/base/footer.jsp"%>
		<script src="/js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>