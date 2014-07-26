<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="footer">
	<div class="footer-container">
		<a href="#" onclick="location.href='/introduce/function.jsp';">사이트 소개</a> &nbsp; &nbsp; 
		<a href="#" onclick="service();">이용약관</a> &nbsp; &nbsp; 
		<a href="#" onclick="people();">개인정보 보호정책</a> &nbsp; &nbsp; 
		<a href="/help/NoticeList.vs">공지사항</a>
	</div>
	<div class="footer-container">
		모든 프로젝트를 위한 종합적인 프로젝트 관리 서비스 팀플! <br />
		팀플을 이용하여 직접 프로젝트를 등록하거나	팀원들을 초대, 등록하여 멋진 결과물을 만들어 보세요!	
	</div>
	<span id="copyright">Copyright © 2014 by <span>Visang9</span>, Inc. All rights reserved</span>
	<h1>
		<span id="logo">Timple</span>
		<sup id="alpha"> 𝞪</sup>
	</h1>
</div>

<script type="text/javascript">
	function service() {
		var url = '/service.htm';
		var option = 'width=550, height=390, location=no, resizeable=no, scrollbars=no, status=no';
		window.open(url, '', option);
 	}
	
	function people() {
		var url = '/people.htm';
		var option = 'width=550, height=390, location=no, resizeable=no, scrollbars=no, status=no';
		window.open(url, '', option);
 	}
</script>