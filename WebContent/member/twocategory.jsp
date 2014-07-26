<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setContentType("text/xml");
%>
<result>
	<c:forEach items="${twoCategoryList}" var="dto">
	<item>
		<twocategoryid>${dto.twoCategoryId}</twocategoryid>
		<twoName>${dto.twoName}</twoName>
	</item>
	</c:forEach>
</result>