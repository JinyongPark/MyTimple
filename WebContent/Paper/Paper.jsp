<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지 쓰기 : TIMPLE</title>
		<link rel="stylesheet" href="css/timple.css" />
		<link rel="stylesheet" href="css/common.css" />
		<script src="js/vendor/modernizr.js"></script>
		<style>
			#leng { text-align: right; }
			#content { margin: 10px auto; }
			.war-text { float: right; }
		</style>
	</head>
<body id="w-popup">

	<h5>쪽지 보내기</h5>
	<form id="paperForm" action="/sendPaperOk.vs" method="post">
		<div class="input-wrap">
			<label>받는사람 : <span id="sendTo">${toname }</span>
				<textarea name="content" id="content" rows="9" placeholder="내용을 입력해주세요." autofocus></textarea>
			</label>
		</div>
		<h6 id="leng"><span>0</span>/500</h6>
		<input class="button tiny" type="submit" value="보내기" />
		<input class="button tiny cancel" type="button" value="취소" onclick="javascript:window.close();" />
		<input type="hidden" name="kind" value="1" />
		<input type="hidden" name="from" value="${from }">
		<input type="hidden" name="to" value="${to }">
	</form>
	
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/foundation.min.js"></script>
	<script src="js/timple.js"></script>
	<script>
	
		/* Onload script start*/
		var $content = $('#content');
		var $paperForm = $('#paperForm');
		var $who = $('.mb-name.sel', opener.document);
		var $hidden = $('<input/>', {
			type: 'hidden',
			name: 'receiveMemSeq', 
			value: $who.attr('id').replace('m', '')
		}).appendTo($paperForm);
		
		$('#sendTo').text($who.text());
		/* Onload script end */
		
		
		$('#content').on('input', function() {
			
			var $input = $(this).val();
			var $count = $('#leng span');
			
			if ($input.length != 0) $(this).removeWarning('empty');
			if ($input.length > 500) $(this).val($input.substr(0, 500));
			
			$count.text($input.length);
		});
		
		$paperForm.submit(function(e) {
			
			e.preventDefault();
			
			if ($content.val() == "") $content.showWarning('empty').focus();
			else jQuery.ajax({
				url: "/sendPaperOk.vs",
				data: jQuery("#paperForm").serialize(),
				dataType: "xml",
				type: "POST",
				success: function(xml) {
					if ($(xml).find("code").text() == '1') {
						alert("쪽지가 성공적으로 전송되었습니다.");
						window.close();
					}
				},
				error: function() {
					alert("전송실패");
				}
			});
		});
	</script>
</body>
</html>