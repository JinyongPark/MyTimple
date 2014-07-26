<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

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
#size { width: 100%; height: 820px; margin: 0px auto; }
#size2 { width: 77%; max-height: 91%; margin-left: 290px;}

#team { width: 800px; border-radius: 20px; border-collapse: collapse; }
#team td { 
	font-size: 13px; font-family: 굴림; text-align: center; height: 60px;
	margin: 3px; border-bottom: 2px groove #DEDEDE; width: 200px;
}

#team .td1 { width: 80px; }
#team .td2 { width: 700px; height: 50px; }

#img { width: 90px; height: 55px; margin-bottom: 5px; margin-left: 5px; margin-right: 5px; }
#su, #end { font-size: 10px; margin: 3px; font-weight: bold; font-family: 굴림; cursor: pointer;}

#ment { width: 700px; height: 45px; overflow: auto; text-align: left; margin-left: 20px; }
#name { font-size: 13px; font-weight: bold; margin-bottom: -10px; }

#time { 
	margin-left: 20px; text-align: left; 
	margin-top: 15px; font-weight: bold; font-family: 굴림; 
}

#page { width: 200px; height: 30px; margin-top: 20px; margin-left: 225px; float: left; }

#write { 
	width: 93px; height: 30px; border: 2px solid #DEDEDE; border-radius: 15px; cursor: pointer;
	margin-top: 14px; margin-left: 280px; background-image: url("img/memo.jpg");
}

#memoin, #memoin2 {
	border-radius: 20px; width: 505px; height: 200px; 
	text-align: center; font-size: 17px; font-weight: bold; font-family: 굴림;
}

#memoin3 { width: 260px; height: 80px; }
.memodiv2 { width: 250px; height: 30px; margin: 10px auto; }
.memodiv { width: 500px; margin: 10px auto; height: 30px; }
.text { float: left; width: 100px; margin-top: 5px; font-weight: bold; font-family: 굴림; }
.memodiv .memoui { float: left; width: 400px; height: 30px; } 
.memodiv .content { float: left; width: 400px; height: 130px; }
.memodiv .content2 { float: left; width: 400px; height: 130px; }
#memook, #memofix, #memodel {
	font-size: 17px; font-weight: bold; font-family: 굴림; border-radius: 10px; width:100px;
	cursor: pointer; margin: 0px auto;
}

#password3, #delname { width: 150px; height: 30px; }

a { text-decoration: none; }


</style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	function memoWrite() {
		var user = document.getElementById("user");
		var name = document.getElementById("name");
		var mem = document.getElementById("mem");
		var teamseq = document.getElementById("teamseq");

		name.value = user.value;
		teamseq.value = mem.value;
		
		$("#memoBox").dialog({
			width:555,
			height:340,
			modal:true,
			position:[450,100],
			resizable : false,
			draggable : false
		});
	}
	
	$(document).ready(function() {
		$("#memoBox").hide();
		$("#memoBox2").hide();
		$("#memoBox3").hide();		
	});
	
	function PostWrite(n) {
		var form = document.getElementById("memoin");
		var form2 = document.getElementById("memoin2");
		var form3 = document.getElementById("memoin3");
		
		if (n == 1){
			form.submit();
		} else if (n == 2) {
			form2.submit();
		} else if (n == 3) {
			form3.submit();
		}
	}
	
	function fix() {
		$("#memoBox2").dialog({
			width:560,
			height:350,
			modal:true,
			position:[450,200],
			resizable : false,
			draggable : false
		});
		
		var btn = event.srcElement;
		var td1 = btn.parentNode.parentNode.parentNode.childNodes[1]; // 이름
		var td2 = btn.parentNode.parentNode.childNodes[4]; // 내용
		var td3 = btn.parentNode.parentNode.childNodes[7]; // 팀 아이디
		var name = document.getElementById("name2");
		var content = document.getElementById("content2");
		var teamid = document.getElementById("teamid");
		
		name.value = td1.innerText;
		content.innerText = td2.innerText;
		teamid.value = td3.value;		
	}

	function del() {
		$("#memoBox3").dialog({
			width:300,
			height:200,
			modal:true,
			position:[520,320],
			resizable : false,
			draggable : false
		});	
		var btn = event.srcElement;
		var td1 = btn.parentNode.parentNode.parentNode.childNodes[1]; // 이름		
		var td3 = btn.parentNode.parentNode.childNodes[7]; // 팀 아이디
		var team = document.getElementById("delteamid");
		var name = document.getElementById("delname");
		
		name.value = td1.innerText;
		team.value = td3.value;

	}	
	
	function fixCh() {
		var content = document.getElementById("content2");
		
			content.innerText = "";
			cotnent.focus();
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
		
	<input type="hidden" id="user"  value="${user}"/>
	<input type="hidden" id="mem"  value="${mem}"/>

<!--=====================================동록==================================================-->	
	<div id="memoBox" title="메모등록">
	  <form id="memoin" method="POST" action="../team/MemoPOST.vs">
		<div class="memodiv">
			<div class="text">회원이름 :</div>
			<input type="text" id="name" name="name" class="memoui" readonly="readonly"/>
		</div>
		<div class="memodiv" style="height: 130px;">
			<div class="text">메모내용 :</div>
			<textarea rows="5" cols="1" class="content" name="content">
			</textarea>
		</div>
		<div class="memodiv">
			<div class="text">회원암호 :</div>
			<input type="password" name="pw" id="password" class="memoui" />
		</div>
		<input type="hidden" name="num" value="1" />
		<input type="hidden" name="teamseq" id="teamseq"/>
		<input type="button" value="등록" id="memook" onclick="PostWrite(1);" />				
	  </form>
	</div>
<!--=====================================동록==================================================-->	

<!--=====================================수정==================================================-->	
	<div id="memoBox2" title="메모수정">
	  <form id="memoin2" method="POST" action="../team/MemoPOST.vs">
		<div class="memodiv">
			<div class="text">회원이름 :</div>
			<input type="text" id="name2" name="name" class="memoui" readonly="readonly" 
				style="border: 0px;"/>
		</div>
		<div class="memodiv" style="height: 130px;">
			<div class="text">메모내용 :</div>
		<textarea rows="5" cols="1" class="content2" id="content2" 
			name="content" onclick="fixCh();"></textarea>
		</div>
		<div class="memodiv">
			<div class="text">회원암호 :</div>
			<input type="password" name="pw" id="password2" class="memoui" value=""/>
		</div>
		<input type="hidden" name="teammemoid" value="" id="teamid" />
		<input type="hidden" name="num" value="2" />
		<input type="button" value="수정" id="memofix" onclick="PostWrite(2);"  />				
	  </form>
	</div>
<!--=====================================수정==================================================-->	

<!--=====================================삭제==================================================-->	
	<div id="memoBox3" title="메모삭제">
	  <form id="memoin3" method="POST" action="../team/MemoPOST.vs">
		<div class="memodiv2">
			<div class="text">회원이름 :</div>
			<input type="text" id="delname" name="name" readonly="readonly" style="border: 0px;"/>
		</div>
		<div class="memodiv2">
			<div class="text">회원암호 :</div>
			<input type="password" name="pw" id="password3" />
		</div>
		<div class="memodiv2" style="margin: 0px auto; width: 110px; margin-top: 20px;">
		<input type="button" value="삭제" id="memodel" onclick="PostWrite(3);" />	
		</div>
		<input type="hidden" name="teammemoid" id="delteamid" />
		<input type="hidden" name="num" value="3" />
	  </form>
	</div>		
<!--=====================================삭제==================================================-->	
<jsp:include page="/header.vs"></jsp:include>
	<div id="title">
		<p>${title}</p>
	</div> 
	
	 


<jsp:include page="/sidemenu.vs"></jsp:include>
 
	
	<div id="size">

		<div id="size2">
		<div style="margin: 0px auto; width: 85%; ">
				<table id="team">
					<c:if test="${!empty size}">
						<tr>
							<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
						</tr>
					</c:if>					
					<c:forEach items="${list}" var="mo">				
					<tr>
						<td class="td1">
					<img id="img" src="img/sa.JPG"/><br /><span id="name">${mo.name}</span>
						</td>
						<td class="td2">
							<div id="time">( ${mo.regdate} )
								<span id="su" onclick="fix();">수정</span>
								<span id="end" onclick="del();">삭제</span>
							</div><br />
							<div id="ment">${mo.content}</div><br />
							<input type="hidden" name="teamMemoId" value="${mo.teammemoid}" />
							<input type="hidden" name="teamseq" value="${mo.teamseq}" />
						</td>
					</tr>
					</c:forEach>																							
				</table>
				<div>
					<div id="page" >${pageBar}</div>
					<input type="button" value="" id="write" onclick="memoWrite();" />
				</div>
			</div>
		</div>
	</div>
	
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
</c:if>
</body>
</html>