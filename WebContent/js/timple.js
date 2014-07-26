/**
 * timple.js
 */

/* Default Setting */
var tel_array = ['010', '011', '016', '017', '019', '02', '031','032','033','041','043','042','044','051','052','053','054','055','061','062','063','064','070'];

/* Warning Variable */
var empty_email = "이메일 주소를 입력해주세요.";
var wrong_email = "이메일 주소가 맞나요?";
var duplicate_email = "이미 사용중인 이메일 주소입니다.";

var empty_name = "멋진 이름이 있으시잖아요.";
var short_name = "이름은 두 글자 이상 입력해주세요.";
var wrong_name = "이름에는 한글, 영문 대소문자를 이용해 주세요.";

var empty_tel = "전화번호를 입력해주세요.";
var wrong_tel = "전화번호는 숫자만 입력해주세요.";

var empty_pw = "비밀번호를 입력해주세요.";
var wrong_pw = "6~20자 영문 대소문자, 숫자, 특수문자만 되요.";
var mismatch_pw = "비밀번호가 일치하지 않습니다.";

var empty_crt_pw = "현재 비밀번호를 입력해주세요.";
var wrong_crt_pw = "6~20자 영문 대소문자, 숫자, 특수문자만 되요.";
var mismatch_crt_pw = "비밀번호가 일치하지 않습니다.";

var mismatch_check_pw = "비밀번호가 일치하지 않습니다."; 

var empty_questionId = "질문을 선택해주세요.";
var empty_quereply = "답변을 입력해주세요.";

var notSelect_oneCategory = "업종 대분류를 선택해주세요.";

var none_email = "가입된 이메일이 없습니다.";
var loginFail_pw = "비밀번호가 맞지 않습니다.";

var empty_content = "내용을 입력안하셨어요.";
var blank_content = "뭐 빼먹은거 같은데요??";

var empty_search = "프로젝트명을 입력해주세요.";

/* Warning function */
$.fn.showWarning = function(state) {
	var type = $(this).attr("name");
	var warning = state + "_" + type;	
	var defaultClass = ".war-text.";

	if ($(defaultClass + type).length == 1) {
		if ($(defaultClass + type + "." + state).length == 0) {
			$(defaultClass + type).text(eval(warning)).attr("class", "war-text " + state + " " + type);
		}
		return $(this);
	} else {
		$("<span/>", {
			class: "war-text " + state + " " + type, text: eval(warning)
		}).insertBefore($(this));
		return $(this).addClass("war-state");
	}
	
};

$.fn.removeWarning = function(type) {
	var className = "." + type + "." + $(this).attr("name");
	if ($(className).length == 1) {
		$(className).remove();
		$(this).removeClass("war-state");
	}
};

$.fn.removeWarningAll = function() {
	var className = ".war-text." + $(this).attr("name");
	if ($(className).length == 1) {
		$(className).remove();
		$(this).removeClass("war-state");
	}
};

/* isValid check */
$.fn.isValidEmail = function() {
	var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return pattern.test($(this).val());
};

$.fn.isValidName = function() {
	var pattern = /^[a-zA-Z가-힣]{2,20}$/;
	return pattern.test($(this).val());
};

$.fn.isValidTel = function() {
	var pattern = /^[0-9]*$/;
	return pattern.test($(this).val());
};

$.fn.isValidPassword = function() {
	var pattern = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,20}$/;
	return pattern.test($(this).val());
};

/* Member-layer script */
function sendPaper() {
	var url = '/write.htm';
	var option = 'width=370, height=390, location=no, resizable=no, scrollbars=no, status=no';
	window.open(url, '', option);
 }

function addFriend() {
	var url = '/friend.htm';
	var option = 'width=370, height=220, location=no, resizable=no, scrollbars=no, status=no';
	window.open(url, '', option);
}

$('.mb-wrap').on('click', function() {
	
	$('.sel').removeClass('sel');
	$(this).find('.mb-name').addClass('sel');
	$('.mb-layer').remove();
	
	var $ul = $('<ul/>').addClass('mb-layer');
	$('<li/>', {
		class: 'mb-layer-list',
		text: '쪽지 보내기',
		onclick: 'sendPaper();'
	}).appendTo($ul);
	$('<li/>', {
		class: 'mb-layer-list',
		text: '친구 추가 요청',
		onclick: 'addFriend();'
	}).appendTo($ul);
	
	$(this).append($ul);
	
});

$(document).on('click', function(e) {
	var $target = $(e.target).attr('class');
	if ($target != 'mb-layer' && $target != 'mb-wrap' && $target != 'mb-name sel') {
		$('.mb-layer').remove();
	}
});