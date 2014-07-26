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
<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/projectmain.css" />
<script src="../js/vendor/modernizr.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/pepper-grinder/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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

<style>
#formList{ margin-top: 30px;}
#content{ padding: 40px;}
#content h2{ text-align: center; margin: 10px;}
#submit { margin-left: 710px; }
</style>

<!-- jQuery Start -->
<script>
	ja(function() {
		ja("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});
		ja("#datepicker2").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});
</script>
<!-- jQuery End -->

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
	
	
<script>
	var js = jQuery.noConflict();
</script>
	
	
	<jsp:include page="/sidemenu.vs"></jsp:include>
	<!-- Side Menu End -->
	<section>
	
		<div id="content">
			<h2>새로운 Business Plan 생성하기</h2>
			<form id="formList" method="POST" action="/projects/PlanAddOk.vs">
				<div class="row">
					<div class="large-12 columns">
						<label>Business Plan 명<input type="text" id="name" name="name"
							placeholder="Plan 명은 최대 8자까지 입력 가능합니다." maxlength="8" />
						</label>
					</div>
				</div>
				<div class="row">
					<div class="large-4 columns">
						<label>Start Date <input type="text"
							placeholder="MM/DD/YY" id="datepicker" name="startday"
							readonly="readonly" />
						</label>
					</div>
					<div class="large-4 columns">
						<label>End Date <input type="text" placeholder="MM/DD/YY"
							id="datepicker2" name="endday" readonly="readonly" />
						</label>
					</div>
				</div>
				<div class="row">
					<div class="large-12 columns">
						<label>Plan 설명<textarea id="contents" name="explanation"
								placeholder="최대 1000자까지 입력가능" style="min-height: 300px;"
								maxlength="1000"></textarea>
						</label>
					</div>
				</div>
				<input type="submit" value=" 생성하기 " id="submit" />
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="../base/footer.jsp"%>
		<script src="../js/foundation.min.js"></script>
	</footer>
	</c:if>
</body>
</html>