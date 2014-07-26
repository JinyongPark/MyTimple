<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Timple</title>
<link rel="stylesheet" href="../css/timple.css" />
<link rel="stylesheet" href="../css/common.css" />
<script src="../js/vendor/modernizr.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	
	$(document).ready(function() {

		var ment = document.getElementById("ment");
		
		if (ment.value == "0") {
			alert("이미 등록되어 있는 팀원입니다!");
			location.href = "/team/TeamTel.vs";
		} else if (ment.value == "1") {
			alert("등록을 완료 하였습니다!");
			location.href = "/team/TeamTel.vs";			
		} else if (ment.value == "2") {
			alert("수정을 완료 하였습니다!");
			location.href = "/team/TeamTel.vs";			
		} else if (ment.value == "3") {
			alert("삭제를 완료 하였습니다!");
			location.href = "/team/TeamTel.vs";			
		} else if (ment.value == "4") {
			alert("이름과 암호가 일치하지 않습니다!");
			location.href = "/team/TeamTel.vs";			
		} else if (ment.value == "5") {
			alert("존재하지 않는 회원 입니다!");
			location.href = "/team/TeamTel.vs";			
		}				
	});
	
</script>
</head>
<body>

<input type="hidden" id="ment" value="${ment}" />

</body>
</html>