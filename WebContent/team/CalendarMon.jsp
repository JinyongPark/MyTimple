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
#top {
	width: 1100px;
	height: 100px;
}

#size {
	width: 1100px;
	height: 800px;
	margin: 0px auto;
}

#size2 {
	width: 100%;
	height: 100%;
}

#box1 {
	width: 250px;
	height: 700px;
	float: left;
}

#box2 {
	width: 800px;
	height: 40px;
	float: left;
	margin-left: 20px;
	margin-top: 30px;
}

#box3 {
	width: 810px;
	height: 500px;
	float: left;
	margin-left: 20px;
	margin-top: 30px;
}

#box2 img {
	width: 20px;
	height: 20px;
	margin-top: 8px;
	float: left;
}

#num {
	float: left;
	margin-top: 8px;
	margin-left: 20px;
}

#box2 span {
	font-size: 20px;
	font-weight: bold;
	font-family: 굴림;
}

#box2 select {
	width: 100px;
	margin-left: 40px;
	margin-top: 2px;
	height: 35px;
	float: left;
}

#but1 {
	height: 34px;
	width: 100px;
	margin-top: 2px;
	margin-left: 340px;
	border-radius: 15px;
	float: left;
	background-image: url("img/mon.jpg");
}

#but2 {
	height: 34px;
	width: 100px;
	margin-top: 2px;
	border-radius: 15px;
	float: right;
	background-color: white;
	margin-right: 20px;
	background-image: url("img/day.jpg");
}

#cal {
	width: 785px;
	height: 560px;
	border: 8px solid #EBE9DE;
	background-color: #EBE9DE;
	text-align: center;
}

#cal tr th {
	height: 60px;
	width: 115px;
	border-radius: 30px;
	border: 10px solid #EBE9DE;
	background-color: white;
	padding: 10px 10px;
	font-size: 20px;
}

#cal tr .day {
	height: 50px;
	width: 115px;
	border-bottom: 1px solid #EBE9DE;
	font-size: 15px;
	font-weight: bold;
	border-top: 1px solid #EBE9DE;
	text-align: center;
	border-radius: 20px;
	color: white;
}

#cal tr td {
	height: 50px;
	width: 115px;
	border-radius: 20px;
	border: 8px solid #EBE9DE;
	height: 50px;
	width: 115px;
	background-color: white;
	text-align: center;
}

</style>


</head>
<body>
	<%-- <%@ include file="../base/header2.jsp"%> --%>
	<c:if test="${loginSeq == null }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/index.vs?param=0");
		</script>
	</c:if>
	<c:if test="${loginSeq != null }">
		
	<div id="size">
		<div id="top"></div>

		<div id="size2">
			<div id="box1"></div>
			<div id="box2">
				<img src="img/sam.jpg" alt="이전" onclick="left();"/>
				<div id="num">
					<span>6</span>
				</div>
				<img src="img/sam2.jpg" alt="다음" style="margin-left: 20px;"  onclick="right();" /> 
				<select name="year" id="year">
					<option value="1">2014년 1월</option>
					<option value="2">2014년 2월</option>
					<option value="3">2014년 3월</option>
				</select> <input id="but1" type="button" /> <input id="but2" type="button" />
			</div>
			<div id="box3">
				<table id="cal">
					<tr>
						<th colspan="7">2014 년 06 월</th>
					</tr>
					<tr>
						<td class="day" style="background-color: #E45317;">일</td>
						<td class="day" style="background-color: #C28F66;">월</td>
						<td class="day" style="background-color: #C28F66;">화</td>
						<td class="day" style="background-color: #C28F66;">수</td>
						<td class="day" style="background-color: #C28F66;">목</td>
						<td class="day" style="background-color: #C28F66;">금</td>
						<td class="day" style="background-color: #EA5E97;">토</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
					</tr>
					<tr>
						<td>8</td>
						<td>9</td>
						<td>10</td>
						<td>11</td>
						<td>12</td>
						<td>13</td>
						<td>14</td>
					</tr>
					<tr>
						<td>15</td>
						<td>16</td>
						<td>17</td>
						<td>18</td>
						<td>19</td>
						<td>20</td>
						<td>21</td>
					</tr>
					<tr>
						<td>22</td>
						<td>23</td>
						<td>24</td>
						<td>25</td>
						<td>26</td>
						<td>27</td>
						<td>28</td>
					</tr>
					<tr>
						<td>29</td>
						<td>30</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
					</tr>
				</table>
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