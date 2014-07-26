<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	response.setContentType("text/xml");
%>

<result>
	<c:forEach items="${list}" var="dto">
		<item>
			<projectid>${dto.projectid}</projectid>
			<projectName>${dto.projectname}</projectName>
			<twoseq>${dto.twoseq}</twoseq>
			<name>${dto.name}</name>
			<startday>${dto.startday}</startday>
			<endday>${dto.endday}</endday>
			<content>${dto.content}</content>
			<memberid>${dto.memberid}</memberid>
		</item>
	</c:forEach>
</result>