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
<!-- Side Menu Script End -->

<script>
	var js = jQuery.noConflict();
</script>




<style type="text/css">
#size { width: 100%; height: 820px; margin: 0px auto; }
#size2 { width: 77%; min-height: 91%; margin-left: 290px;}
#box2 { 
	width: 800px; height: 45px; float: left; margin-left: 20px; 
	margin-top: 30px; 
}
#box3 { width: 800px; min-height: 550px; float: left; margin-left: 20px; margin-top: 15px; }
/* #box2 input { float: left; } */
#button1 { 
	border-radius: 20px; width: 90px; height: 29px; float: left; cursor: pointer;
	/* background-image: url(img/name.jpg); */ border: 2px solid #DEDEDE;
}
#button2 { 
	margin-left: 10px; border-radius: 20px; width: 90px; height: 29px; cursor: pointer;
	/* background-image: url(img/buso.jpg); */ border: 2px solid #DEDEDE; float: left;
}
#button3 { 
	margin-left: 10px; border-radius: 20px; width: 90px; height: 29px; float: right; 
	cursor: pointer; /* background-image: url(img/people.jpg); */ border: 2px solid #DEDEDE;
}

#button1, #button2, #button3, #sear { /* margin-top: 8px; */ }

button.tiny, .button.tiny {
padding-top: 0.325rem;
padding-right: 1.25rem;
padding-bottom: 0.3875rem;
padding-left: 1.25rem;
font-size: 0.6875rem;
}
#word { width: 100px; height: 35px; margin-left: 10px; margin-bottom: 5px; }
#who { 
	width: 120px; height: 45px; margin-left: 10px; 
	float: left; margin-right: 10px; margin-bottom: 10px; margin-top:3px;
}
#whoSp { 
	font-size: 12px; font-family: 굴림; font-weight: bold; color: red; 
	margin-left: 13px; visibility: hidden; 
}

#sear { 
	margin-left: 8px; /* background-image: url(img/sear.jpg); */ width: 76px; height: 29px;
	border: 2px solid #DEDEDE; border-radius: 10px; float: left; cursor: pointer;
}
#sort { 
	float: left; height: 35px; margin-left: 194px; 
	text-align: center; margin-right: -10px; width: 100px; margin-top:3px;
}

#team { width: 800px; border-radius: 20px; border-collapse: collapse;}
#team th { 
	height: 40px; border-bottom: 4px solid #DEDEDE; color: white;
	border-top: 4px solid #DEDEDE; height: 35px; background-color: black;
}
#team td { 
	font-size: 15px; font-family: 굴림; text-align: center; height: 25px;
	margin: 3px; border-bottom: 1px dotted gray; border-top: 1px dotted gray;
	background-color: #F8F8F8;
}
#sub { margin-left: 128px; border: 0px solid #gray; }

#teamBoxWrite { font-size: 12px; font-weight: bold; 
	font-family: 굴림; border-radius: 10px; cursor: pointer;
}

#teamBox input { width: 250px; height: 30px; margin: 5px 0px; }
#teamBox .memDiv { width: 250px; height: 30xp; clear: both; }
#teamBox .member { width: 17px; height: 17px;  margin: 5px 5px; float: left; }
#teamBox .memSp { 
	width: 180px; height: 20px; margin-top: 7px;
	float: left; color: red; font-weight: bold; font-size: 12px; font-family: 굴림;
}

#passCheck { width: 200px; height: 30px; float: left; }
#passCheck2 { width: 100px; height: 30px; float: left; margin-left: 10px; cursor: pointer;
	font-size: 12px; font-weight: bold; font-family: 굴림; border-radius: 10px;
}

#FixBox { width: 230px; height: 250px; }
#FixBox input { width: 200px; height: 30px; margin: 10px 10px; }
#fixok { font-size: 17px; font-weight: bold; font-family: 굴림; border-radius: 10px; }
#divfix { width: 220px; margin-left: 10px; font-size: 13px; 
	font-weight: bold; font-family: 굴림;}
	
#pageBar { width: 150px; }	

a { text-decoration: none; }

.adds{ float: right; width:90px; padding-left:13px;}


.tpopup{

display: none;

}

</style>

<script type="text/javascript">
	function telWrite() {
		js("#teamBox").dialog({
			width:300,
			height:180,
			position:[535,350], 
			modal:true,
			resizable : false,
			draggable : false
		}); 
	}
	function Del(num,team,member) { // 삭제 암호 확인
	
		var btn = event.srcElement;
		var td1 = btn.parentNode.parentNode.childNodes[1];
		var td2 = btn.parentNode.parentNode.childNodes[3];
		var td3 = btn.parentNode.parentNode.childNodes[5];

		var quest = document.getElementById("quest");
		var fix1 = document.getElementById("fix1");
		var fix2 = document.getElementById("fix2");
		var fix3 = document.getElementById("fix3");
		var fix5 = document.getElementById("fix5");
		var fix6 = document.getElementById("fix6");
		var del1 = document.getElementById("del1");
		var del2 = document.getElementById("del2");

		del1.value = team;
		del2.value = member;
		fix1.value = td1.innerText;
		fix2.value = td2.innerText;
		fix3.value = td3.innerText;
		fix5.value = team;
		fix6.value = num;

		if (num == 2) {
			js("#DelBox").dialog({
				width:355,
				height:110,
				position:[520,395], 
				modal:true,
				resizable : false,
				draggable : false
			});	
		} else if (num == 1) {
			js("#FixBox").dialog({
				width:261,
				height:365,
				position:[550,250], 
				modal:true,
				resizable : false,
				draggable : false
			});				
		}
		quest.value = num;
	}
	
	function teamDel2() { // 수정 및 삭제 데이터 보내기
		var form = document.getElementById("Delfrom");
		form.submit();
	}
	
	// 다이얼로그 가리기
	js(document).ready(function() {
		var n = document.getElementById("ment");
		
		js("#teamBox").hide();
		js("#DelBox").hide();
		js("#FixBox").hide();	
		
	});
	
 	// 등록값 클릭시 글 사라지기
	function change(n) {
		
		var name = document.getElementById("name");
		var fix1 = document.getElementById("fix1");
		var fix2 = document.getElementById("fix2");
		var fix3 = document.getElementById("fix3");
	
		if (n == 1) {
			name.value = "";
			fix1.value = "";
		} else if (n == 2){
			fix2.value = "";
		} else if (n == 3){
			fix3.value = "";
		}
	}
	
	function sel(n,page) { // 정렬
		if (n == 1) {
			location.href="../team/TeamTel.vs?page="+page+"&num=0&word=null&sort=null";
		} else if (n == 2) {
			location.href="../team/TeamTel.vs?page="+page+"&num=1&word=null&sort=null";
		}
	}
	
	function wordSend() { // 검색
		var form1 = document.getElementById("selForm");
		var word = document.getElementById("word");
		
		
		 if (word.value == "") {
			js("#whoSp").css("visibility","inherit");
			word.focus();
			return;	
		}
		
		form1.submit();
	}
	
	function check() { // 등록 이름 유효성 검사
		var sum = document.getElementById("name");
		var form2 = document.getElementById("insertBox");
		
		for (var i=0; i< sum.value.length; i++) {
				
			var ch = sum.value.charAt(i);
			
			if ((ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')){
				sum.value = "한글만 입력하세요.";
				return;
			} else if (sum.value.length <= 1) {
				sum.value = "2~5 자로 입력하세요.";
				return;
			} else if (sum.value.length >= 6) {
				sum.value = "2~5 자로 입력하세요.";
				return;			
			} 	
		}
		if (sum.value == 0) {
			js("#nameSP").css("visibility","inherit");
			return; 
		}
	  form2.submit();
	}
	
	function wordWho() { // 검색창 클릭시 글 초기화
		js("#whoSp").css("visibility","hidden");	
	}

	function fixsubmit() {
		var form1 = document.getElementById("fixForm");
		
		form1.submit();
	}
	
	function search(){
		child = window.open("/projects/SearchMember.vs", "child", "width = 530, height = 516");

	}
	function appview(){
		child = window.open("/projects/ApplyMember.vs", "child", "width = 650, height = 516");	
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
		
<!---------------------------------------------인원등록------------------------------------------->	
	<div class = "tpopup" id="teamBox" title="인원등록">
		<form method="POST" action="../team/TeamTel.vs" id="insertBox">
<input type="text" value=" Name " name="name" id="name" class="input" 
	onclick="change(1);"/>
	<input type="button" value=" 등록 " class="button success popup" id="teamBoxWrite"onclick="check();" style="margin-top: 20px;"/>
	<input type="hidden" name="projectseq" value=""/>
	<input type="hidden" name="quest" value="3" />
		</form>
	</div>
<!---------------------------------------------인원등록------------------------------------------->	


<!---------------------------------------------탈퇴------------------------------------------->	
	<div class = "tpopup" id="DelBox" title="회원 탈퇴 확인">
		<form method="POST" action="../team/TeamTel.vs" id="Delfrom">
		  <input type="password" name="pw" id="passCheck" />
		  <input type="button" value=" 암호 확인 " onclick="teamDel2();" id="passCheck2"/>
		  <input type="hidden" name="memberId" id="del2" value="" />
		  <input type="hidden" name="teamid" id="del1" value="" />
		  <input type="hidden" name="quest" id="quest"/>
		</form>
	</div>
<!---------------------------------------------탈퇴------------------------------------------->	

<!---------------------------------------------수정페이지----------------------------------------->	
	<div class = "tpopup" id="FixBox" title="팀원 정보 수정">
		<form method="POST" action="../team/TeamTel.vs" id="fixForm" >
			<input type="text" name="fixname" id="fix1" value="" onclick="change(1);"/>
			<input type="text" name="fixemail" id="fix2" value="" onclick="change(2);"/>
			<input type="text" name="fixtel" id="fix3" value="" onclick="change(3);"> <br/>
			<div id="divfix">
			 	회원 비밀번호를 입력하세요. <br /> 확인후 수정이 됩니다.
			 	<input type="password" name="fixpw" id="fix4" value="" 
			 		style="width: 200px; margin-left: -2px;" onclick="change(4);"/>
			</div>
			<input type="button" id="fixok" value="수정완료" onclick="fixsubmit();"/>
			<input type="hidden" name="fixmem" id="fix5" value="" />
			<input type="hidden" name="quest" id="fix6" value="" />
		</form>
	</div>
<!---------------------------------------------수정페이지----------------------------------------->	

<jsp:include page="/header.vs"></jsp:include>

	<div id="title">
		<p>${title}</p>
	</div> 
	
	
	
<!-- 	
<script>
	var js = jQuery.noConflict();
</script>
	 -->
	 
<jsp:include page="/sidemenu.vs"></jsp:include>
 
	<input type="button" class="adds button tiny" value=" 신청목록보기 " onclick="appview();"style="margin-left: 25px;
    margin-right: 160; padding-left: 13px; margin-top: 20px;margin-bottom: 0px;"/>
					<input type="button" class="adds button tiny" value=" 회원검색하기 " onclick="search();" style="padding-left:13px;
					margin-top: 20px;margin-bottom: 0px; "/>
	<div id="size">

		<div id="size2">
		<div style="margin: 0px auto; width: 85%;">
			<div id="box2">

				<input type="button" id="button1" class="button" value="이름정렬" onclick="sel(1,${nowPage});" style="padding: 0px; height: 40px;"> <!-- 이름정렬 -->
				<input type="button" id="button2" class="button" value="소속정렬" onclick="sel(2,${nowPage});" style="padding: 0px; height: 40px;"/> <!-- 소속정렬 -->
			
				
			<form action="../team/TeamTel.vs" method="GET" id="selForm">	
				<select name="sort" id="sort">
					<option value="name">Name</option>
					<option value="tel">Tel</option>
					<option value="email">Email</option>
				</select>
				<div id="who">
					<input type="text" id="word" name="word" onclick="wordWho();"/>
					<div id="whoSp">단어를 입력하세요!</div>
				</div>
				<input type="button" id="sear" onclick="wordSend();" class="button success" value="검색" style="padding: 0px;height: 40px;" />
			<c:if test="${two == '1'}">		
				<input type="button" value="인원등록" id="button3" class="button success" onclick="telWrite();" style="padding: 0px; height: 40px;"/>
			</c:if>	
				<input type="hidden" id="num" name="num" value="1"/>
				<input type="hidden" name="page" value="${nowPage}" />
			</form>
			</div>
			
			<div id="box3">
				<table id="team">
					<tr>
						<th style="width: 150px;">Name</th>
						<th style="width: 200px;">Email</th>
						<th style="width: 200px;">Tel</th>
						<th style="width: 100px;">Belong</th>
					<c:if test="${two != '1'}">						
						<th style="width: 50px;" colspan="2">수정</th>
					</c:if>
					<c:if test="${two == '1'}">						
						<th style="width: 100px;">탈퇴</th>
					</c:if>
						
					</tr>
					<c:if test="${!empty size}">
						<tr>
							<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
						</tr>
					</c:if>
					<!-- 팀원 리스트 출력 -->
					<c:forEach items="${list}" var="dto">
					<tr>
						<td style="width: 150px;">
						<span class="mb-wrap">
						<c:if test="${mseq == dto.memberId}">
						<span>${dto.name}</span>
						</c:if>
						<c:if test="${mseq != dto.memberId}">
						<span class="mb-name" id="m${dto.memberId}" >${dto.name}</span>
						</c:if>
						</span></td>
						<td style="width: 200px;">${dto.email}</td>
						<td style="width: 200px;">${dto.tel}</td>
					<c:if test="${dto.grade =='1'}">				
						<td style="width: 150px;">팀장</td>
					</c:if>
					<c:if test="${dto.grade =='2'}">				
						<td style="width: 150px;">팀원</td>
					</c:if>	
					<c:if test="${two != '1'}">						
						<td style="width: 50px;" colspan="2">					
				<input type="button" style="cursor: pointer;" class="button  success tiny" value="수정" 
				onclick="Del( 1, '${dto.memberId}', '${dto.teamid}');" />		
						</td>
					</c:if>
					
					<c:if test="${two == '1'}">						
						<td style="width: 50px;">
				<input type="button" value="탈퇴" class="button success tiny" style="margin-bottom: 0px;"
			onclick="Del( 2, '${dto.memberId}', '${dto.teamid}');" />
						</td>
					</c:if>						
					
					</tr>
					</c:forEach>
					<!-- 팀원 리스트 출력 끝 -->																			
				</table>
				<div id="pageBar" style="width: 600px; margin: 20px auto; text-align: center;">
					${pageBar}
						
				</div>
			</div>
		</div>
	</div>
</div>	
	<footer>
		<%@ include file="/base/footer.jsp"%>
		
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
	<script src="/js/timple.js"></script>
	</footer>
	</c:if>
</body>
</html>