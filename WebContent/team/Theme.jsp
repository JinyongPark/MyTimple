<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="/js/vendor/modernizr.js"></script>
<!-- Side Menu Script Start-->
<link rel="stylesheet" href="/css/sidemenu/layout.css" media="screen" />

<script>
	var ja = jQuery.noConflict();
</script>

<script src="/js/sidemenu/hideshow.js"></script>
<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src="/js/header.js"></script>

<script>
	var js = jQuery.noConflict();
</script>

<!-- Side Menu Script End -->

<style type="text/css">


#header{
	font-family:Arial, Helvetica, sans-serif;
	font-size:24px;
	font-weight:bold;
	text-align:left;
	text-indent:35px;
	margin: 0 auto;
	width:800px;
	margin-bottom:10px;
	margin-top: 50px;
}

#container{
	margin-left: 300px;
	width:800px;
	border:1px solid #333;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	font-family:Verdana, Geneva, sans-serif;
	text-align:center;
}

input{
	border:10px solid #444;
	-moz-border-radius: 5px;
	-webkit-border-radius: 10px;
	margin: 15px;
}

input:hover{
	border-color:#555;
	-moz-box-shadow: 0px 0px 15px #111;
	-webkit-box-shadow: 0px 0px 15px #111;
}

.img {
	width: 150px;
	height: 150px;
}
</style>

<script>
	var val = "";
$(document).ready(function(){
	
	$("#item1").click(function(){
		$("#sidebar").css("background-image", "url('../images/sidebar.png')");
		val = $("#item1").val();
		return val;
	});
	
	$("#item2").click(function(){
		$("#sidebar").css("background-image", "url('../images/bubble.jpg')");
		val = $("#item2").val();
		return val;
	});
	
	$("#item3").click(function(){
		$("#sidebar").css("background-image", "url('../images/cube.jpg')");
		val = $("#item3").val();
		return val;
	});
	
	$("#item4").click(function(){
		$("#sidebar").css("background-image", "url('../images/dragon.jpg')");
		val = $("#item4").val();
		return val;
	});
	
	$("#item5").click(function(){
		$("#sidebar").css("background-image", "url('../images/floor.jpg')");
		val = $("#item5").val();
		return val;
	});
	
	$("#item6").click(function(){
		$("#sidebar").css("background-image", "url('../images/load.jpg')");
		val = $("#item6").val();
		return val;
	});
	
	$("#item7").click(function(){
		$("#sidebar").css("background-image", "url('../images/moon.jpg')");
		val = $("#item7").val();
		return val;
	});
	
	$("#item8").click(function(){
		$("#sidebar").css("background-image", "url('../images/pastel.jpg')");
		val = $("#item8").val();
		return val;
	});
	
	$("#item9").click(function(){
		$("#sidebar").css("background-image", "url('../images/range.jpg')");
		val = $("#item9").val();
		return val;
	});
	
	$("#item10").click(function(){
		$("#sidebar").css("background-image", "url('../images/skyblue.jpg')");
		val = $("#item10").val();
		return val;
	});
	
	$("#item11").click(function(){
		$("#sidebar").css("background-image", "url('../images/snow.jpg')");
		val = $("#item11").val();
		return val;
	});
	
	$("#item12").click(function(){
		$("#sidebar").css("background-image", "url('../images/space.jpg')");
		val = $("#item12").val();
		return val;
	});
});

	function Change() {
		location.href="ThemeChange.vs?val=" + val;
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
		
<jsp:include page="/header.vs"></jsp:include>

<div id="title">
		<p>${title}</p>
</div>

	<!-- Side Menu Start -->

<script>
	var js = jQuery.noConflict();
</script>

	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	
	<div id="menu" style="margin-left: 380px;">
		<input type="button" value="테마 변경" onclick="location.href='Theme.vs'" class="button"/>
		<input type="button" value="순서 변경" onclick="location.href='Order.vs'" class="button"/>
		<input type="button" value="BusinessPlan명 변경" onclick="location.href='BpSelect.vs'" class="button"/>
		<input type="button" value="Project명 변경" onclick="location.href='ProjectEidt.vs'" class="button"/>
	</div>
	
	<form method="GET" action="ThemeChange.vs">
<div id="header">스킨변경</div>
<div id="container">
	<input type="image" onclick="return false;" src="/images/sidemenu/sidebar.png" class="img" id="item1" value="default">
	<input type="image" onclick="return false;" src="/team/images/bubble.jpg" class="img" id="item2" value="bubble.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/cube.jpg" class="img" id="item3" value="cube.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/dragon.jpg" class="img" id="item4" value="dragon.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/floor.jpg" class="img" id="item5" value="floor.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/load.jpg" class="img" id="item6" value="load.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/moon.jpg" class="img" id="item7" value="moon.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/pastel.jpg" class="img" id="item8" value="pastel.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/range.jpg" class="img" id="item9" value="range.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/skyblue.jpg" class="img" id="item10" value="skyblue.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/snow.jpg" class="img" id="item11" value="snow.jpg"/>
	<input type="image" onclick="return false;" src="/team/images/space.jpg" class="img" id="item12" value="space.jpg"/>
	<input type="button" class="button success tiny" value="적용" onclick="Change();" style="margin-right: 30px;" />
	<input type="button" class="button secondary tiny" value="취소" onclick="location.href='Theme.vs'" />
</div>
</form>

	<%@ include file="/base/footer.jsp" %>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script src="js/header.js"></script>
	</c:if>
</body>
</html>




