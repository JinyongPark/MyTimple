<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 찾아보기 | 팀플</title>
		<link rel="stylesheet" href="/css/timple.css" />
		<link rel="stylesheet" href="/css/common.css" />
		<script src="/js/vendor/modernizr.js"></script>

		<style>
		#sbj { 
			display: block; 
			background: #F4F3F3; 
			text-align: center; 
			height: auto;
			margin-top: 0px;
			margin-bottom: 30px;
			border-bottom: 1px solid #EFEDED; 
			padding: 30px 0px;
		}
		#sbj h3 {
			margin-top: 0px;
		}
		#header1 input[type=text], #header1 input[type=button] { margin-bottom: 20px !important; }
		input[type=text] { width: 275px; display: inline-block; }
		input[type=text]:focus { border-color: #43AC6A; }
		.button.popup { margin-left: 10px; }
		#header1 form { margin: 0 105px; text-align: right; }
		#ing {
		    margin: 0 100px 50px 100px;
		    text-align: center;
		}
		#recruit {
		    margin: 0 100px;
		    text-align: center;
		}
		#ing img { width: 250px; height: 150px; }
		.small-block-grid-4 > li {
			width: 23%;
			padding: 10px; margin: 10px;
			border: 1px solid #D9D9DE;
			border-radius: 6px;
			text-align: left; 
			position: relative;
		}
		.small-block-grid-4 > li:hover { border-color: #7BC597; }
		#ing p { color: #828587; margin-bottom: 0px; font-size: 0.8125em; }
		#ing .p-head { font-weight: bold; color: #ACA09E; }
		#ing .ttl { color: black; font-size: 0.875em; margin-top: 10px; font-weight: bold; }
		#ing h4 { margin-top: 50px; }
		#next-btn { margin: 50px 0; }
		
		#req-btn { position: absolute; right: 10; bottom: -10; }
		
		/* 이곳부터 신청 팝업 */
		.popup-req { width: 550px; margin: 0 0 0 -275px; }
		#leng { text-align: right; }
		textarea:focus { border-color: #43AC6A }
		.button.popup, #leng { margin-bottom: 0px; }
		#ctn { font-size: 10pt; }
		.popup-req .button { margin-bottom: 0px; }
		.popup-req .left { line-height: 15px; }
		.popup-req .right { height: auto; }
		.popup-req h4 { margin-bottom: 20px; font-weight: bold; }
		</style>
		
		<script>
		
			function checkIt() {
				var form = document.forms[1];
				var search = document.getElementById("search");
				
				if (search.value =="") {
			  	  
			          alert("검색어를 입력해주세요.");
			          form.search.focus();
			          
			          return false;
			    }
				
			  	form.submit();
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
	<div class="popup-mask"></div>
	<div class="popup-wrap popup-req">
		<a class="popup-close" href="#" onclick="cancel();">
			<img src="/images/popup_close.png" />
		</a>
		<h4><span id="projectName"></span></h4>
		<div class="left">
			<span id="ctn"></span>
		</div>
		<div class="right">
			<form id="paperForm" action="/projects/ProjectPaper.vs" method="post">
				<div class="input-wrap">
					<textarea name="content" id="content" rows="5" placeholder="내용을 입력해주세요."></textarea>
				</div>
				<input class="button popup success" type="submit" value="신청하기" />
				<input class="button popup secondary" type="button" value="취소" onclick="cancel();" />
				<input type="hidden" name="receivememseq" id="receivememseq" />
				<input type="hidden" name="kind" value="2" />
				<input type="hidden" name="projectid" id="projectid" />
			</form>
		</div>
	</div>
	<div id="section">
		
		<div id="sbj">
		
			<h3>충원중인 프로젝트</h3>
			<h5>관심있는 프로젝트를 찾아보거나 참여 신청을 해보세요!</h5>
		
		</div>
		
		<div id="header1">
			
			      
			<form method="post" action="/projects/ProjectList.vs">
				<c:if test="${search == true}">
				<span style="line-height: 37px;" class="left">${searchResult}</span>
				</c:if> 
				<input type="text" name="search" id="search" placeholder="프로젝트명을 입력해주세요" autofocus/>
				<input class="button popup success" type="button" value="검색" onclick="checkIt();" />
				<c:if test="${search == false}">
				<input class="button popup success disabled" type="button" value="전체목록" />
				</c:if>
				<c:if test="${search == true}">
				<input class="button popup success" type="button" value="전체목록" onclick="location.href='/projects/ProjectList.vs';" />
				</c:if>
			</form>
		
		</div>

		<div id="ing">

			<ul class="small-block-grid-4">
			
                <c:forEach items="${list}" var="dto">
                <c:set var="distinct" value="1" />
                
				<li>
					<p><img src="/files/${dto.thumnail}" /></p>
				    <p class="ttl">${dto.projectname}</p>
				    <c:set var="ctn" value="${dto.content}" />
				    <c:set var="leng" value="${fn:length(ctn)}" />
				    <c:if test="${leng > 20}">
				    	<c:set var="ctn2" value="${fn:substring(ctn, 0, 20)}" />
				    	<p>${ctn2}..</p>
				    </c:if>
				    <c:if test="${leng < 20}">
				    	<p>${ctn}</p>
				    </c:if>
				    <p><span class="p-head">팀장</span> ${dto.name}</p>
				    <p><span class="p-head">시작일</span> ${dto.startday}</p>
				    <p><span class="p-head">완료일</span> ${dto.endday}</p>
				    <input class="button tiny secondary" id="req-btn" type="button" value="VIEW" 
				    onclick="request('${dto.projectname}', '${dto.content}', '${dto.memberid}', '${dto.projectid}');" />
				</li>
				
                </c:forEach>
	
			</ul>
			<c:if test="${search == false}">
			<input class="button small success" type="button" value="더보기" id="next-btn" />
			</c:if>
			
		</div>
	</div>

	<%@ include file="/base/footer.jsp"%>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
	<script src="/js/timple.js"></script>
	<script>
		
		var page = 0;
		var $ul = $(".small-block-grid-4");
		var $nextBtn = $("#next-btn");
		
		$("#next-btn").on("click", function() {
			page++;
			$.ajax({
				type: "get",
				url: "/nextProjectList.vs?page=" + page,
				success: function(xml) {
					$(xml).find("result").each(function() {
						
						
						
						if ($(this).find("item").length != 0) { 
						
							$(this).find("item").each(function() {
								
								
								var $projectid = $(this).find("projectid").text();
								var $projectName = $(this).find("projectName").text();
								var $twoSeq = $(this).find("twoseq").text();
								var $name = $(this).find("name").text();
								var $startday = $(this).find("startday").text();
								var $endday = $(this).find("endday").text();
								var $content = $(this).find("content").text().substring(0, 20);
								var $memberid = $(this).find("memberid").text();
								
								var $li = $("<li/>");
								
								var $img = $("<img/>").attr("src", "/images/" + $twoSeq + ".jpg");
								
								$li.append($("<p/>").append($img));
								$li.append($("<p/>").text($projectName).addClass("ttl"));
								$li.append($("<p/>").text($content + ".."));
								
								$("<p/>").html("<span class='p-head'>팀장</span> " + $name).appendTo($li);
								$("<p/>").html("<span class='p-head'>시작일</span> " + $startday).appendTo($li);
								$("<p/>").html("<span class='p-head'>완료일</span> " + $endday).appendTo($li);
								
								var $reqBtn = $("<input/>", {
									id: "req-btn",
									class: "button tiny secondary",
									type: "button",
									value: "VIEW",
									onclick: "request(" + $projectName + ", " + $content + ", " + $memberid + ", " + $projectid + ");"
								}).appendTo($li);
								    
								
								$ul.append($li);
							});
						} 
						
						if ($(this).find("item").length < 12) {
							$nextBtn.remove();
							$h4 = $("<h5/>", {
								text: "더 이상 충원중인 프로젝트가 존재하지 않습니다."
							}).appendTo($("#ing"));
						}
					});
				}
			});
		});
		
		function request(projectName, ctn, receivememseq, projectid) {
			
			// 먼저 팝업창에 값 넣어준다.
			$("#projectName").text(projectName);
			$("#ctn").html(ctn);
			$("#receivememseq").val(receivememseq);
			$("#projectid").val(projectid);
			
			$(".popup-mask").show();
			$(".popup-wrap.popup-req").show();
			$("#content").focus();
		}
		
		function cancel() {
			$(".popup-mask").hide();
			$(".popup-wrap.popup-req").hide();
			$("#content").val("");
			$("#leng span").text("0");
			$("#content").removeWarning('empty');
		}
		
		$paperForm.submit(function(e) {
			
			e.preventDefault();
			
			if ($content.val() == "") $content.showWarning('empty').focus();
			else this.submit();
		});
	</script>
	</c:if>
</body>
</html>
