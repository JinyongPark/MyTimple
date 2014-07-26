<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
	response.setContentType("text/xml");
%>
<noti>
<c:if test="${Noti != null }">
<c:forEach items="${Noti}" var="dto">
	<content>${dto.content }</content>
</c:forEach>
<c:forEach items="${notiList }" var="dto">
	<content>${dto.content }</content>
</c:forEach>
</c:if>
<c:if test="${Noti == null }">
	<content>알림이 없습니다.</content>
</c:if>
<count>${ncount}</count>
</noti>