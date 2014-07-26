<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개</title>
<link rel="stylesheet" href="../css/timple.css" />
<link rel="stylesheet" href="../css/common.css" />
<script src="../js/vendor/modernizr.js"></script>


<style type="text/css">
span {
	color: blue;
}

#intro {
	margin-top: 5%;
	margin-left: 30%;
}

table {
	margin-top: 50px;
	color: #7F7F7F;
	margin-left: 0.7%;
	border- collapse: collapse;
	font-size: 14px;
	border: white 1px solid;
	cellspacing: 1px;
	width: 550px;
	border: 0px;
}

table td {
	font-family: "명조";
	border: white 2px solid;
}

td,th {
	border: 1px solid black;
	border- collapse: collapse;
	height: 33px;
}

table td.center {
	text-align: center;
	background-color: aliceblue;
	font-weight: bold;
}

table td.left {
	background-color: lightcyan;
	text-align: center;
}

#p {
	font-family: "명조";
}

font {
	color: deepskyblue;
}

#vi {
	margin-top: 30px;
	margin-left: 0.7%;
}

#teampl {
	margin-left: 0.7%;
}
</style>



</head>
<body>


	<%@ include file="/base/header2.jsp"%>



	<div id="intro">

		<div id="teampl">
			<font size="+1"><b>최고의 서비스, 팀플!</b></font><br>
			<p id="p">
				2014년 3월에 설립하여 시장을 선도해온 팀플은 사용자들에게 최고의 서비스<br> 를 제공해온 <span>대한민국
					대표 인터넷 기반의 협업 어플리케이션으로의 위치</span>를<br> 유지하고 있는1위 소셜그룹웨어 입니다.
			</p>
		</div>



		<table>

			<tr>
				<td id="cl" colspan="2" height="39"><font size="+1"><b>회사개요</b></font></td>
			</tr>


			<tr>
				<td class="center" width="100">사이트명</td>
				<td class="left">Teampl</td>
			</tr>

			<tr>
				<td class="center">대표</td>
				<td class="left">000</td>
			</tr>

			<tr>
				<td class="center">설립일</td>
				<td class="left">2014. 03. 04</td>
			</tr>

			<tr>
				<td class="center">자본금</td>
				<td class="left">1억</td>
			</tr>

			<tr>
				<td class="center">임직원수</td>
				<td class="left">9명</td>
			</tr>

			<tr>
				<td class="center">주소</td>
				<td class="left">서울시 영등포구 은행로 11, 5층~6층(여의동,일신빌딩)</td>
			</tr>



		</table>


		<div id="vi">

			<font size="+1"><b>비전</b></font> <br> <img
				src="../images/vision.png" />

		</div>



	</div>


	<%@ include file="/base/footer.jsp"%>


	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>
</html>