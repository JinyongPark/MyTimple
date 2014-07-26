<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 내용</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>

<style>

h3 { 
	display: block; 
	background: #F4F3F3; 
	text-align: center; 
	height: 100px; 
	line-height: 100px; 
	border-bottom: 1px solid #EFEDED;
	margin-top: 0px;
}
h4 { margin-bottom: 30px; }
.popup-req { width: 550px; margin: 0 0 0 -275px; }
#section-content { 
	margin: 0 100px; 
	font-size: 1.2em;
	border: 1px solid #D9D9DE;
	border-radius: 6px;
	margin-bottom: 50px;
	padding: 20px;
}
#section-content img { width: 500px; height: 400px; margin-bottom: 20px; }
#article {
	display: inline-block;
	text-align: right;
	width: 400px;
}
#detail {
	margin: 0 100px;
	height: 500px;
}
#leng { text-align: right; }
textarea:focus { border-color: #43AC6A }
.button.popup, #leng { margin-bottom: 0px; }

</style>

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
			<img src="images/popup_close.png" />
		</a>
		<h4>${detail.projectname} 신청하기</h4>
		<div class="middle">
			<form id="paperForm" action="/projects/ProjectPaper.vs" method="post">
				<div class="input-wrap">
					<textarea name="content" id="content" rows="9" placeholder="내용을 입력해주세요."></textarea>
				</div>
				<h6 id="leng"><span>0</span>/500</h6>
				<input class="button popup success" type="submit" value="신청하기" />
				<input class="button popup secondary" type="button" value="취소" onclick="cancel();" />
				<input type="hidden" name="receivememseq" value="${detail.memberid}" />
				<input type="hidden" name="kind" value="2" />
				<input type="hidden" name="projectid" value="${projectid}" />
			</form>
		</div>
	</div>
 



	
	<div id="section">
	
		<h3>${detail.projectname}</h3>
		
		
		<div id="section-content">

			<img src="/images/${detail.twoseq}.jpg"  />
			
			<div id="article">
			
				<p>시작일: ${detail.startday}</p>
				<p>완료일: ${detail.endday}</p>
				<p>프로젝트 팀장: ${detail.name}</p>
				<p>팀원수: ${cnt}</p>
				
				<input class="button small success" type="button" name="send" value="프로젝트 참여 신청하기" onclick="request()" />
				
			</div>
	
			<div id="detail">
				<p>${detail.content}</p>	
			</div>
			
		</div>
				
	</div>

	<%@ include file="/base/footer.jsp"%>
	
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/header.js"></script>
	<script src="/js/timple.js"></script>
	<script>
		/* Onload script start*/
		var $content = $('#content');
		var $paperForm = $('#paperForm');
		/* Onload script end */
		
		function request() {
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
		
		
		$('#content').on('input', function() {
			
			var $input = $(this).val();
			var $count = $('#leng span');
			
			if ($input.length != 0) $(this).removeWarning('empty');
			if ($input.length > 500) $(this).val($input.substr(0, 500));
			
			$count.text($input.length);
		});
		
		$paperForm.submit(function(e) {
			
			e.preventDefault();
			
			if ($content.val() == "") $content.showWarning('empty').focus();
			else this.submit();
		});
	</script>
</c:if>
</body>


</html>