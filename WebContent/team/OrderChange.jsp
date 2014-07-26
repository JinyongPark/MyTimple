<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="/js/vendor/modernizr.js"></script>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/jquery.sortable.js"></script>
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
	.header{
	font-family:Arial, Helvetica, sans-serif;
	font-size:24px;
	font-weight:bold;
	text-align:left;
	text-indent:18px;
	width:800px;
	margin-top: 20px;
	margin-left: 400px;
}

.container{
	margin-right: 130px;
	width:220px;
	height: 640px;
	border:1px solid #333;
	-webkit-border-radius: 10px;
	font-family:Verdana, Geneva, sans-serif;
	text-align:center;
	float: left;
	margin-left: 100px;
}

.gbin1-list {
	list-style: none;
	padding:0;
	margin:0;
}

.gbin1-list li {
	line-height: 80px;
	width: 200px;
	height: 80px;
	text-align: center;
	border: 1px solid #CCC;
	margin: 10px;
	font-family: arial;
	background: #707070;
	color: #FFF;
	box-shadow: 0px 0px 10px #505050;
	border-radius: 5px;
	padding: 0px;
}

#info {
	text-align: left;
	width: 570px;
	height: 600px;
}

table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;
	-webkit-border-radius:3px;
	border-radius:3px;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
}
table th:first-child{
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child{
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child{
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
	padding-left:20px;
}
table tr td:first-child{
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table tr td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
}
table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
}
table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));	
}

.bton {
	padding: 10px;
	margin: 10px;
}

.popup-box {
	position: absolute;
	border-radius: 5px;
	background: #fff;
	display: none;
	box-shadow: 1px 1px 5px rgba(0,0,0,0.2);
	font-family: Arial, sans-serif;
	z-index: 9999999;
	font-size: 14px;
}

.popup-box .close {
	position: absolute;
	top: 0px;
	right: 0px;
	font-family: Arial, Helvetica, sans-serif;	
	font-weight: bold;
	cursor: pointer;
	color: #434343;
	padding: 20px;
	font-size: 20px;
}

.popup-box .close:hover {
	color: #000;
}

.popup-box h2 {
	padding: 0;
	margin: 0;
	font-size: 18px;
}
.popup-box .top {
	padding: 20px;
}

.popup-box .bottom {
	background: #eee;
	border-top: 1px solid #e5e5e5;
	padding: 20px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#blackout {
	background: rgba(0,0,0,0.3);
	position: absolute;
	top: 0;
	overflow: hidden;
	z-index: 9999;
	left: 0;
	display: none;
}

</style>

<script>
	var yh = "";
	js(document).ready(function(){

		js("li").css('cursor', 'pointer');
	 		
		js("#item1").mousedown(function(){
			js("#test").text($(this).text());
			js(".selected").removeClass("selected");
			js(this).addClass("selected");
			});
			js("#item2").mousedown(function(){
				js("#test").text($(this).text());
				/* $("#gross").css("display", "block"); */
				js(".selected").removeClass("selected");
				js(this).addClass("selected");
			});
			js("#item3").mousedown(function(){
				js("#test").text($(this).text());
				js(".selected").removeClass("selected");
				js(this).addClass("selected");
			});
			js("#item4").mousedown(function(){
				js("#test").text($(this).text());
				js(".selected").removeClass("selected");
				js(this).addClass("selected");
			});
			js("#item5").mousedown(function(){
				js("#test").text($(this).text());
				js(".selected").removeClass("selected");
				js(this).addClass("selected");

			});
			js("#item6").mousedown(function(){
				js("#test").text($(this).text());
				js(".selected").removeClass("selected");
				js(this).addClass("selected");
			});
			js("#item7").mousedown(function(){
				js("#test").text($(this).text());
				js(".selected").removeClass("selected");
				js(this).addClass("selected");
			});
			
			
	    js('.gbin1-list').sortable().bind('sortupdate', function() {
	    	
			/* $('#msg').html('position changed').fadeIn(200).delay(1000).fadeOut(200); */
     });
});

			
$(document).ready(function() {
	var boxWidth = 400;
	
	function centerBox() {
		
		/* Preliminary information */
		var winWidth = $(window).width();
		var winHeight = $(document).height();
		var scrollPos = $(window).scrollTop();
		/* auto scroll bug */
		
		/* Calculate positions */
		
		var disWidth = (winWidth - boxWidth) / 2;
		var disHeight = scrollPos + 150;
		
		/* Move stuff about */
		$('.popup-box').css({'width' : boxWidth+'px', 'left' : disWidth+'px', 'top' : disHeight+'px'});
		$('#blackout').css({'width' : winWidth+'px', 'height' : winHeight+'px'});
	
		return false;
	}
	
	
	$(window).resize(centerBox);
	$(window).scroll(centerBox);
	centerBox();	

	$('[class*=popup-link]').click(function(e) {
	
		/* Prevent default actions */
		e.preventDefault();
		e.stopPropagation();
		
		/* Get the id (the number appended to the end of the classes) */
		var name = $(this).attr('class');
		var id = name[name.length - 1];
		var scrollPos = $(window).scrollTop();
		
		/* Show the correct popup box, show the blackout and disable scrolling */
		$('#popup-box-'+id).show();
		$('#blackout').show();
		$('html,body').css('overflow', 'hidden');
		
		/* Fixes a bug in Firefox */
		$('html').scrollTop(scrollPos);
	});
	$('[class*=popup-box]').click(function(e) { 
		/* Stop the link working normally on click if it's linked to a popup */
		e.stopPropagation(); 
	});
	$("#close").click(function(){
		$('[id^=popup-box-]').hide(); 
		$('#blackout').hide(); 
		$("html,body").css("overflow","auto");
		$('html').scrollTop(scrollPos);
	});
	$('.close').click(function() { 
		var scrollPos = $(window).scrollTop();
		/* Similarly, hide the popup and blackout when the user clicks close */
		$('[id^=popup-box-]').hide(); 
		$('#blackout').hide(); 
		$("html,body").css("overflow","auto");
		$('html').scrollTop(scrollPos);
	});
	
	
	$(".popup-link-1").click(function() {
		var txt = $("#test").text();
		$("#titl").text(txt);
		$("#text").focus();
		$("#text").val("");
	});
	
	$("#modify").click(function() {
		/* document.getElementsByTagName("item").innerText(txt1); */
		var scrollPos = $(window).scrollTop();
		/* Similarly, hide the popup and blackout when the user clicks close */
		$('[id^=popup-box-]').hide(); 
		$('#blackout').hide(); 
		$("html,body").css("overflow","auto");
		$('html').scrollTop(scrollPos);
	 	 var txt1 = $("#text").val(); 	
		 $(".selected").text(txt1);
		});
	});
	
	function sub() {
	
		
		var nameArr = "";
		var numArr = "";
	 $(".item").each(function(){
	    
	    var order = $(this).val();
	    var name = $(this).text();

		nameArr += "&name=" + name;
		numArr += "&num=" + order;
		

	  }); 
	 
	 $.ajax({
			type: "post",
			url: "/OrderChange.vs",
			data: nameArr + numArr,
			success:callBack
		});
	}
	
	function callBack(dto) {
		location.href="/Order.vs";
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
	
	<div id="title">
		<p>${title}</p>
	</div>

	<!-- Side Menu Start -->
	 <jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	
		<div id="menu" style="margin-left: 380px;">
		<input type="button" value="테마 변경" onclick="location.href='Theme.vs'" class="button"/>
		<input type="button" value="순서 변경" onclick="location.href='Order.vs'" class="button"/>
		<input type="button" value="BusinessPlan명 변경" onclick="location.href='BpSelect.vs'" class="button"/>
		<input type="button" value="Project명 변경" onclick="location.href='ProjectEidt.vs'" class="button"/>
	</div>
	
	
	<form method="POST" action="/OrderChange.vs">
<section>
	 <div class="header" >카테고리 관리</div>
 </section>
 <section>
 <div class="container">
	<ul class="gbin1-list" style="float: left;">
		<li id="item1" class="item" value="1">BUSINESS PLAN</li>
		<li id="item2" class="item" value="2">게시판</li>
		<li id="item3" class="item" value="3">예산관리</li>
		<li id="item4" class="item" value="4">캘린더</li>
		<li id="item5" class="item" value="5">팀원정보</li>
		<li id="item6" class="item" value="6">자료실</li>
		<li id="item7" class="item" value="7">환경설정</li>
	</ul>
</div>
	<ul>
		<c:forEach items="${order}" var="dto">
			<li id="test">${dto.SideName}</li>
		</c:forEach>
	</ul>
</section>
	<table style="margin-top: 170px;">
	<tr><th colspan="3">카테고리 정보</th></tr> 
	<tr><td>카테고리 명</td><td id="test"></td>
	<td><input type="button" class="popup-link-1 button success" value="수정" style="padding:10px; margin-bottom: 0px;" />
	<!-- <input type="button" value="삭제" style="padding:10px;" /> --></td></tr>
	<tr class='even'><td colspan="3">사용법</td></tr>
	<tr><td colspan="3">알려주기</tr>
	<tr class='even'><td colspan="3" style="text-align: center;">
	<input type="button" value="완료" class="button success" onclick="sub();" />
	<input type="button" value="취소" class="button secondary" /></td></tr>
</table>

<div class="popup-box" id="popup-box-1"><div class="close">X</div><div class="top"><h2 id="titl"></h2>
</div><div class="bottom"><input type="text" style="width: 200px; float:left; margin-right: 20px;" id="text"/>
<input type="button" class="button success" value="수정" style="padding:10px; margin-right: 20px;" id="modify" />
<input type="button" class="button secondary" value="취소" id="close" style="padding:10px;" />

</div></div>
<div id="blackout"></div>

</form>
	<%@ include file="/base/footer.jsp" %>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script src="js/header.js"></script>
	</c:if>
</body>
</html>



