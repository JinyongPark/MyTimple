<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/pepper-grinder/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- jQuery Start -->
<script>
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});
		$("#datepicker2").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});
</script>
<!-- jQuery End -->

<!-- JavaScript Start -->
<script>
	$(document).ready(function() {

		/* Project Create 유효성 검사 */
		$("#formList").submit(function() {
			var name = $("#name").val();
			var start = $("#datepicker").val();
			var end = $("#datepicker2").val();
			var fJob = $("#onecategory").val();
			var sJob = $("#twocategory").val();
			var contents = $("#contents").val();

			/* 프로젝트 시작날짜 연월일 분류 */
			var startYear = start.substr(6, 4);
			var startMonth = start.substr(0, 2);
			var startDate = start.substr(3, 2);

			/* 프로젝트 종료날짜 연월일 분류 */
			var endYear = end.substr(6, 4);
			var endMonth = end.substr(0, 2);
			var endDate = end.substr(3, 2);

			if (name == "") {
				alert("프로젝트 명을 입력하세요!");
				$("#name").focus();
				return false;
			} else if (start == "") {
				alert("시작날짜를 선택하세요!");
				return false;
			} else if (end == "") {
				alert("종료날짜를 선택하세요!");
				return false;
			} else if (fJob == 0) {
				alert("1차 직군을 선택하세요!");
				return false;
			} else if (sJob == 0) {
				alert("2차 직군을 선택하세요!");
				return false;
			} else if (contents == "") {
				alert("프로젝트 설명을 입력하세요!");
				$("#contents").focus();
				return false;
			} else {
			}

			if (endYear < startYear) {
				alert("종료날짜가 유효하지 않습니다!");
				return false;
				if (endMonth < startMonth) {
					alert("종료날짜가 유효하지 않습니다!");
					return false;
					if (endDate < startDate) {
						alert("종료날짜가 유효하지 않습니다!");
						return false;
					} else{
						
					}
				} else {

				}
			} else {

			}
		});
		
		
	});
	
	
</script>
<!-- JavaScript End -->
<style>
section {
	min-height: 700px;
}

#submit {
	margin-left: 1030px;
}

h1 {
	text-align: center;
	margin: 10px;
}
</style>
</head>
<body>
<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">
	<header>
		<jsp:include page="/header.vs"></jsp:include>
	</header>
	<section>
		<h1>프로젝트 등록</h1>
		<form id="formList" method="POST" action="/projects/ProjectAddOk.vs"  enctype="multipart/form-data"        >
			<div class="row">
				<div class="large-12 columns">
					<label>프로젝트 명<input type="text" id="name" name="name"
						placeholder="프로젝트 명은 최대 20자까지 입력 가능합니다." maxlength="20" />
					</label>
				</div>
			</div>
			<div class="row">
				<div class="large-4 columns">
					<label>팀장<input type="text" id="leader" name="leader"
						readonly="readonly" value="${mname}" />
					</label>
				</div>
				<div class="large-4 columns">
					<label>Start Date <input type="text" placeholder="YY-MM-DD"
						id="datepicker" name="startday" readonly="readonly" />
					</label>
				</div>
				<div class="large-4 columns">
					<label>End Date <input type="text" placeholder="YY-MM-DD"
						id="datepicker2" name="endday" readonly="readonly" />
					</label>
				</div>
			</div>
			<div class="row">
				<div class="large-12 columns">
					<label>1차 직군<select id="oneCategory" name="firstjob">
							<option value="0">선택하세요</option>
							<c:forEach items="${one}" var="dto">
							<option value="${dto.seq}">${dto.name}</option>
							</c:forEach>
					</select>
					</label>
				</div>
			</div>
			<div class="row">
				<div class="large-12 columns">
					<label>2차 직군<select class="enterDefault" name="twoCategory" id="twoCategory">
						<option value="0">선택하세요</option>
					</select>
					</label>
				</div>
			</div>
			<div class="row">
				<div class="large-6 columns">
					<label>알림</label> <input type="radio" name="alarm" value="Red"
						id="pokemonRed" checked="checked"><label for="pokemonRed">사용</label>
					<input type="radio" name="alarm" value="Blue" id="pokemonBlue"><label
						for="pokemonBlue">사용안함</label>
				</div>
				<div class="large-6 columns">
					<label>충원 여부</label> <input id="checkbox1" name="open" type="radio"
						checked="checked" value="y"><label for="checkbox1">가능</label> <input
						id="checkbox2" name="open" type="radio" value="n"><label
						for="checkbox2" >불가능</label>
				</div>
			</div>
			
			
			<div class="row">
				<div class="large-12 columns">
					<label>프로젝트 설명<textarea id="contents" name="content"
							placeholder="최대 1000자까지 입력가능" style="min-height: 300px;"
							maxlength="1000"></textarea>
					</label>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="large-12 columns">
					<label>프로젝트 그림<input type="file" name="attach" class="attachFile"/><br />
					</label>
				</div>
			</div>
			
			
			
			
			<input type="submit" value=" 생성하기 " id="submit" />
		</form>
	</section>

	<footer>

		<%@ include file="/base/footer.jsp"%>
		<!-- <script
			src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
		<script src="/js/foundation.min.js"></script>

	</footer>
	<script>
		
	$("#oneCategory").change(function() {
		
		
		$("#twoCategory option").each(function() {
			if ($(this).val() > 0) $(this).remove();
		});
		$("#twoCategory option[value='" + 0 + "']").prop("selected", true);
		
		if ($(this).val() != 0) {

			$.ajax({
				url: "/ajax_twocategory.vs?oneCategorySeq=" + $(this).val(),
				success: function(xml) {
					$(xml).find("result").each(function() {
						$(this).find("item").each(function() {
							$("#twoCategory").append($("<option/>", {
								value: $(this).find("twocategoryid").text(), text: $(this).find("twoName").text()
							}));
						});
					});
				}
			});
		}

	});
	</script>
	</c:if>
</body>
</html>
