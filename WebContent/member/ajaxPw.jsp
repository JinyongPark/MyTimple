<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setContentType("text/xml");
%>
<result>
	<isResult>${isResult}</isResult>
	<newPw>${newPw}</newPw>
</result>