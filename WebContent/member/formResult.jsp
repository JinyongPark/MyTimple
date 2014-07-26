<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	<c:if test="${result == '1'}">
		alert("쪽지를 성공적으로 보냈습니다.");
	</c:if>
	<c:if test="${result == '0'}">
		alert("쪽지 전송을 실패하였습니다. 관리자에게 문의하세요.");
	</c:if>
	
	window.close();
</script>