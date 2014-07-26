<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="../css/timple.css" />
<link rel="stylesheet" href="../css/common.css" />
<script src="../js/vendor/modernizr.js"></script>

<style type="text/css">
#top { width: 1100px; height: 100px; }
#size { width: 1100px; height: 800px; margin: 0px auto; }
#size2 { width: 100%; height: 100%; }

#box1 { width: 250px; height: 500px; float: left; }
#box2 { width: 800px; height: 40px; float: left; margin-left: 20px; margin-top: 30px; }
#box3 { width: 810px; height: 450px; float: left; margin-left: 20px; margin-top: 30px; }

#box2 img { width: 20px; height: 20px; margin-top: 8px; float: left; }
#num { float: left; margin-top: 8px; margin-left: 20px; }
#box2 span { font-size: 20px; font-weight: bold; font-family: 굴림; }
#box2 select { width: 100px; margin-left: 40px; margin-top: 2px; height: 35px; float: left; }

#but1 { 
	height: 34px; width: 100px; margin-top: 2px; margin-left: 190px; 
	border-radius: 15px; float: left; background-image: url("img/mon.jpg");
}
#but2 { 
	height: 34px; width: 100px; margin-top: 2px; border-radius: 15px; float: right; 
	background-color: white; margin-right: 10px; background-image: url("img/day.jpg");
}

#cal { width: 805px; border-collapse: collapse; }
#cal th { 
	text-align: center; height: 40px; border-top: 3px solid #411414; 
	font-size: 15px; font-family: 굴림; border-bottom: 3px solid #411414;  
}
#cal td { 
	text-align: center; height: 20px; border-bottom: 3px solid #411414; 
	font-family: 굴림; font-size: 13px;
}

#cal .th1 { width: 100px; height: 30px; border-left: 3px solid #411414; }
#cal .th2 { width: 200px; height: 30px; }
#cal .th3 { width: 200px; height: 30px; }
#cal .th4 { width: 100px; height: 30px; }
#cal .th5 { width: 205px; height: 30px; border-right: 3px solid #411414; }

#cal .td1 {
	width: 100px; height: 30px; background-color: #C28F66; 
	border-left: 3px solid #411414; border-right: 3px solid #411414; 
}
#cal .td2 { width: 200px; height: 30px; }
#cal .td3 { width: 200px; height: 30px; }
#cal .td4 { width: 100px; height: 30px; }
#cal .td5 { width: 205px; height: 30px; border-right: 3px solid #411414; } 

</style>


</head>
<body>
<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq == null }">
		
	<%-- <%@ include file="../base/header2.jsp"%> --%>
	<div id="size">
		<div id="top"></div>

		<div id="size2">
			<div id="box1"></div>
			<div id="box2">
				<img src="img/sam.jpg" alt="이전" />
				<div id="num">
					<span style="font-size: 12px;">2014</span>&nbsp;&nbsp;<span>06/02 ~ 06/09</span>
				</div>
				<img src="img/sam2.jpg" alt="다음" style="margin-left: 20px;" /> <select
					name="year" id="year">
					<option value="1">2014년 1월</option>
					<option value="2">2014년 2월</option>
					<option value="3">2014년 3월</option>
				</select> <input id="but1" type="button" /> <input id="but2" type="button" />
			</div>
			<div id="box3">
				<table id="cal">
					<tr>
						<th class="th1">날짜</th>
						<th class="th2">시간</th>
						<th class="th3">제목</th>
						<th class="th4">장소</th>
						<th class="th5">참가자</th>
					</tr>
					<tr>
						<td class="td1" rowspan="2">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>			
					</tr>
					<tr>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>
					<tr>
						<td class="td1" rowspan="2">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>
					<tr>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>					
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>	
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>	
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>	
					<tr>
						<td class="td1">06/01 (월)</td>
						<td class="td2">09:00 ~ 10:00</td>
						<td class="td3">팀 회의</td>
						<td class="td4">회의실</td>
						<td class="td5">박영호, 허정영, 이진호</td>
					</tr>						
				</table>
			</div>
			<div id="box4">
			
			</div>
		</div>
	</div>

	<%-- <%@ include file="../base/footer.jsp"%> --%>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="../js/foundation.min.js"></script>
	</c:if>
</body>
</html>