<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>파일 업 로드 창</title>
<style>	
	html,body {
		overflow: hidden;
	}
	#fileAdd {
		margin-right: 10px;
	}
	.attachFile {
		margin: 5px;
		margin-left: 15px;
	}
	#biz-file-hr {
		margin-top: 11px;
	}
	#business-file-submit {
		margin-left: 80%
	}
</style>
</head>
<script>

$(document).ready(function() {
	var boxNum = 1;
	$("#fileAdd").click(function() {
		boxNum += 1;
		var fileInput = document.createElement("input");
		var br = document.createElement("br");
		$(fileInput).attr({			
			type:"file",
			id:"attach",
			class:"attachFile",
		}); 
		$("#business-file-form").append(fileInput);
		$("#business-file-form").append(br);
		$("#fileNum").html(boxNum);
	});
});
function submitBtn() {
	$("#business-file-form").submit();	
} 

</script>
<body>
	<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq != null }">
		
	<!-- Upload.jsp -->
	<h3>파일 업로드</h3>		
	
	<input type="button" value=" 파일 추가하기 " id="fileAdd" style="float:left;"/> 현재 <span id="fileNum">1</span>개의 파일의 업로드가 가능합니다.
	<hr id="biz-file-hr"/>
	<form method="POST" id="business-file-form" action="/TeamUploadOk.vs" enctype="multipart/form-data">		
		<input type="file" name="attach" class="attachFile"/><br />		
	</form>
	<hr />
	<input type="button" value=" 업로드 " id="business-file-submit" onclick="submitBtn();"/>
	</c:if>
</body>
</html>










