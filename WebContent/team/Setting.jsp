<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Timple</title>
		<link rel="stylesheet" href="/css/timple.css" />
		<link rel="stylesheet" href="/css/common.css" />
		<script src="/js/vendor/modernizr.js"></script>
		<style type="text/css">
			#menu {
				text-align: center;
			}
		</style>
	</head>
<body>
	<%@ include file="/base/header2.jsp" %>
	<div id="menu">
		<input type="button" value="테마 변경" onclick="location.href='Theme.jsp'" class="button"/>
		<input type="button" value="순서 변경" class="button"/>
		<input type="button" value="전체 쪽지" class="button"/>
		<input type="button" value="이름 수정" class="button"/>
	</div>
	
	<%@ include file="/base/footer.jsp" %>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="/js/foundation.min.js"></script>
</body>
</html>







