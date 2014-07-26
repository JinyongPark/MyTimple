<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="../js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="../css/sidemenu/layout.css" media="screen" />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../js/sidemenu/hideshow.js"></script>
<script src="../js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="../js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>
<!-- Side Menu Script End -->

<style>
	#name{ width: 200px; margin: 10px;}
	p{margin: 10px;}
	#submit{ margin: 10px;}
	body{min-width: 500px; height: 450px;}
</style>

<script>
$(document).ready(function(){
	/* var name = $("#name").val(); 
	if (name == null){
		name.val("");
	$("#name").focus();
	} */
	
	 var input = $('#name').val();

    input.focus(function() {
         $("#name").val('');
         input.focus();
 });

	
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
		
		<form method="POST" action="/projects/SearchResult.vs">
		<div style="text-align: center;">
			<p>이름을 입력하세요</p><input type="text" name="name" id="name" style="margin:auto;"/><br/>
			<input type="submit" value=" 검색하기 " class="button success" id="submit" style="width: 120px;
    height: 35px;"/>
		</div>
		</form>	
		</c:if>
</body>
</html>