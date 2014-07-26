<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${empty fileList}">
	<span id="td-file-flame">
		<span id="td-file">첨부파일 없음</span>
			<!-- <input type="file" class="td-file-button" value=" 첨부 " /> -->
	</span>
</c:if>
<c:if test="${!empty fileList}">
	<ul style="margin-bottom: 5px;">							
		<c:forEach items="${fileList}" var="dto">							
			<li>						
				파일 ${dto.filename}	 <br />
			</li>												
		</c:forEach>
	</ul>		
	<form>					
		<input type="file" class="td-file-button" value=" 첨부 " onchange="gogogo();"/>
	</form>														
</c:if> 