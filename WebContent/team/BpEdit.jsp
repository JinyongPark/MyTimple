<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
<script src="../js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="/js/vendor/modernizr.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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

<script type="text/javascript">
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
	
	var item = $(".item");
	for (var i=0; i<item.length; i++){
		item[i].setAttribute("id", "item" + i);
	}
	
	var button = $(".popup-link-1");
	for (var i=0; i<button.length; i++){
		button[i].setAttribute("id", "b" + i);
	}
	
	var del = $(".del");
	for (var i=0; i<del.length; i++){
		del[i].setAttribute("id", "del" + i);
	}
		
	$(".popup-link-1").click(function() {
		var txt = $(this).text();
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
		var text = $("#text").val();
		 $(".selected").text(text);
	});
	$("#b0").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item0").addClass("selected");
	});
	$("#b1").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item1").addClass("selected");
	});
	$("#b2").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item2").addClass("selected");
	});
	$("#b3").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item3").addClass("selected");
	});
	$("#b4").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item4").addClass("selected");
	});
	$("#b5").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item5").addClass("selected");
	});
	$("#b6").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item6").addClass("selected");	
	});
	$("#b7").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item7").addClass("selected");
	});
	$("#b8").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item8").addClass("selected");
	});
	$("#b9").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item9").addClass("selected");
	});
	$("#b10").mousedown(function(){
		$(".selected").removeClass("selected");
		$("#item10").addClass("selected");
	});
});

function sub() {
	
	var nameArr = "";
	var bpidarr = "";
	
	
 $(".item").each(function(){
    
    var name = $(this).text();
    
	nameArr += "&name=" + name;
	
	
  }); 
 $(".num").each(function(){
		
		var num = $(this).text();
			
		bpidarr += "&bpid=" + num;
		
	});
 
 $.ajax({
		type: "post",
		url: "/BpUpdate.vs",
		data: nameArr + bpidarr,
		success:callBack
	});
}
	
function callBack() {
	location.href="/BpSelect.vs";
}
	
/* 	function del(name) {
		
		//var num = name;

		$.ajax({
			type: "get",
			url: "/Bpdelete.vs?num=" + name,
			//data: num,
			success:callBack
		});
	}
	
	function callBack() {
		alert("test");
		
	} */
	
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
	
	<!-- 상단 타이틀 영역 -->
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
	
	<!-- 메인 영역 -->
 <form method="POST" action="BpUpdate.vs"> 
<table style="width:400px; margin-left:500px; margin-top:30px;">
	<tr><th colspan="2" style="text-align: center; font-size:18px;">Business Plan명 수정하기</th></tr> 
 	
 	<c:forEach items="${list}" var="dto">
	<tr><td class="item" >${dto.name}</td>
	<td style="display: none;" class="num">${dto.bpid}</td>
	<td style="width:150px;"><input type="button" class="popup-link-1" value="수정" style="padding:10px; " />
	</td>
	</tr>
	<%-- <input type="hidden" value="${dto.bpid}" class="bpid"/> --%>
	</c:forEach>
	<tr class='even'><td colspan="3" style="text-align: center;">
	<input type="button" class="button"  value="완료" style="margin:auto;" onclick="sub();" /></td>
</table>

<div class="popup-box" id="popup-box-1"><div class="close">X</div><div class="top">
</div><div class="bottom"><input type="text" style="width: 200px; float:left; margin-right: 20px;" id="text"/>
<input type="button" class="button success" value="수정" style="padding:10px; margin-right:20px;" id="modify"/>
<input type="button" class="button secondary" value="취소" style="padding:10px;" id="close" />
</div></div>
<div id="blackout"></div>
 </form>
	<%@ include file="/base/footer.jsp" %>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/timple.js"></script>
	<script src="/js/header.js"></script>
	</c:if>
</body>
</html>