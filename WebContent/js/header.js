/**
 * 
 */

function mypj() {
	var temp = jQuery("#mypj");
	temp.toggle();
	
	if (temp.css("display") == "none") {
		jQuery("#mpic").css("color", "#FFFFFF");
	} else if (temp.css("display") == "block") {
		jQuery("#mpic").css("color", "#00BAFF");
	}
	
	var memo = jQuery("#memo_pop");
	if (memo.css("display") != "none") {
		memo.toggle();
		jQuery("#meicon").attr("src", "/images/memo.png");
	}

	var man = jQuery("#man_pop");
	if (man.css("display") != "none") {
		man.toggle();
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
	}

	var noti = jQuery("#noti_pop");
	if (noti.css("display") != "none") {
		noti.toggle();
		jQuery("#nicon").attr("src", "/images/noti.png");
	}
	
	var mail = jQuery("#mail_pop");
	if (mail.css("display") != "none") {
		mail.toggle();
		jQuery("#maicon").attr("src", "/images/mail.png");
	}
}

function mail() {
	/* jQuery("#test").text("TEST"); */
	var temp = jQuery("#mail_pop");
	temp.toggle();

	if (temp.css("display") == "none") {
		jQuery("#maicon").attr("src", "/images/mail.png");
	} else if (temp.css("display") == "block") {
		jQuery("#maicon").attr("src", "/images/mail_sel.png");
	}
	var memo = jQuery("#memo_pop");
	if (memo.css("display") != "none") {
		memo.toggle();
		jQuery("#meicon").attr("src", "/images/memo.png");
	}

	var man = jQuery("#man_pop");
	if (man.css("display") != "none") {
		man.toggle();
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
	}

	var noti = jQuery("#noti_pop");
	if (noti.css("display") != "none") {
		noti.toggle();
		jQuery("#nicon").attr("src", "/images/noti.png");
	}
	
	var project = jQuery("#mypj");
	if (project.css("display") != "none") {
		project.toggle();
		jQuery("#user > a").css("color", "#FFFFFF");
	}
}

function memo() {
	var temp = jQuery("#memo_pop");
	temp.toggle();

	if (temp.css("display") == "none") {
		jQuery("#meicon").attr("src", "/images/memo.png");
	} else if (temp.css("display") == "block") {
		jQuery("#meicon").attr("src", "/images/memo_sel.png");
	}
	var mail = jQuery("#mail_pop");
	if (mail.css("display") != "none") {
		mail.toggle();
		jQuery("#maicon").attr("src", "/images/mail.png");
	}

	var man = jQuery("#man_pop");
	if (man.css("display") != "none") {
		man.toggle();
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
	}

	var noti = jQuery("#noti_pop");
	if (noti.css("display") != "none") {
		noti.toggle();
		jQuery("#nicon").attr("src", "/images/noti.png");
	}
	
	var project = jQuery("#mypj");
	if (project.css("display") != "none") {
		project.toggle();
		jQuery("#mypj > a").css("color", "#FFFFFF");
	}
}

function noti() {
	var temp = jQuery("#noti_pop");
	temp.toggle();

	if (temp.css("display") == "none") {
		jQuery("#nicon").attr("src", "/images/noti.png");
	} else if (temp.css("display") == "block") {
		jQuery("#nicon").attr("src", "/images/noti_sel.png");
	}

	var mail = jQuery("#mail_pop");
	if (mail.css("display") != "none") {
		mail.toggle();
		jQuery("#maicon").attr("src", "/images/mail.png");
	}

	var man = jQuery("#man_pop");
	if (man.css("display") != "none") {
		man.toggle();
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
	}

	var memo = jQuery("#memo_pop");
	if (memo.css("display") != "none") {
		memo.toggle();
		jQuery("#meicon").attr("src", "/images/memo.png");
	}
	
	var project = jQuery("#mypj");
	if (project.css("display") != "none") {
		project.toggle();
		jQuery("#mypj > a").css("color", "#FFFFFF");
	}
}

function man() {
	var temp = jQuery("#man_pop");
	temp.toggle();

	if (temp.css("display") == "none") {
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
	} else if (temp.css("display") == "block") {
		jQuery("#manicon").attr("src", "/images/man_sel.png");
		jQuery("#user > a").css("color", "#00BAFF");
	}

	if (temp.css("display") == "none") {
		jQuery("#nicon").attr("src", "/images/noti.png");
	} else if (temp.css("display") == "block") {
		jQuery("#nicon").attr("src", "/images/noti_sel.png");
	}

	var mail = jQuery("#mail_pop");
	if (mail.css("display") != "none") {
		mail.toggle();
		jQuery("#maicon").attr("src", "/images/mail.png");
	}

	var noti = jQuery("#mnoti_pop");
	if (noti.css("display") != "none") {
		noti.toggle();
		jQuery("#nicon").attr("src", "/images/noti.png");
	}

	var memo = jQuery("#memo_pop");
	if (memo.css("display") != "none") {
		memo.toggle();
		jQuery("#meicon").attr("src", "/images/memo.png");
	}
	
	var project = jQuery("#mypj");
	if (project.css("display") != "none") {
		project.toggle();
		jQuery("#mypj > a").css("color", "#FFFFFF");
	}
}

jQuery("*").click(function(e) {
	
	var evt = jQuery(e.target);
	
	if (evt.attr("id") == "ma" || evt.attr("id") == "maicon" || evt.attr("id") == "me" || evt.attr("id") == "meicon" || evt.attr("id") == "no" || evt.attr("id") == "nicon" || evt.attr("id") == "us" || evt.attr("id") == "manicon" || evt.attr("id") == "mp" || evt.attr("id") == "mpic") {
		e.stopPropagation();
		e.preventDefault();
	}
	
	if ((evt.attr("id") == "ma" || evt.attr("id") == "maicon")) {
		mail();
	} else if ((evt.attr("id") == "me" || evt.attr("id") == "meicon")) {
		memo();
	} else if ((evt.attr("id") == "no" || evt.attr("id") == "nicon")) {
		noti();
	} else if ((evt.attr("id") == "us" || evt.attr("id") == "manicon")) {
		man();
	} else if ((evt.attr("id") == "mp" || evt.attr("id") == "mpic")) {
		mypj();
	} else {
		jQuery("#mail_pop").hide();
		jQuery("#maicon").attr("src", "/images/mail.png");
		jQuery("#memo_pop").hide();
		jQuery("#meicon").attr("src", "/images/memo.png");
		jQuery("#noti_pop").hide();
		jQuery("#nicon").attr("src", "/images/noti.png");
		jQuery("#man_pop").hide();
		jQuery("#manicon").attr("src", "/images/man.png");
		jQuery("#user > a").css("color", "#FFFFFF");
		jQuery("#mypj").hide();
		jQuery("#mpic").css("color", "#FFFFFF");
	
	}
});

function noti_confirm(id) {
	//alert("확인했음당");
	jQuery.ajax({
		url: "/header_ajax.vs",
		data: {"id" : id},
		type: "POST",
		dataType: "xml",
		success: function (xml) {
			console.log("Success");
			jQuery(".box").html("");
			var result = jQuery(xml).find("content");
			jQuery(result).each(function() {
				var content = jQuery(this).text();
				jQuery("#noti_pop").append(content);
			});
			
			result = jQuery(xml).find("count");
			jQuery("#no").html("");
			jQuery("#no").append("<img id = \"nicon\" src=\"/images/noti.png\" class=\"hicon\" />" + result.text());
		},

		failure: function (data) {
			console.log("ERROR");
		}
	});
}

function sign_out() {
	
	location.replace("/Sign_out.vs");
}

function paccept(toId, projectid, fromId, paperid) {
	jQuery.ajax({
		url: "/addAcceptOk.vs",
		type: "POST",
		dataType: "xml",
		data: {"toId" : toId, "projectid" : projectid, "fromId": fromId, "paperid": paperid},
		success: function(xml) {
			console.log("Success");
			jQuery(".box").html("");
			var result = jQuery(xml).find("content");
			jQuery(result).each(function() {
				var content = jQuery(this).text();
				jQuery("#noti_pop").append(content);
			});
			
			//result = jQuery(xml).find("count");
			//jQuery("#no").html("");
			//jQuery("#no").append("<img id = \"nicon\" src=\"/images/noti.png\" class=\"hicon\" />" + result.text());
		},
		error: function(xml) {
			alert("실패ㅠ");
		}
	});
}

function faccept(toId, fromId, paperid) {
	jQuery.ajax({
		url: "/addFriendOk.vs",
		type: "POST",
		dataType: "xml",
		data: {"toId" : toId, "fromId" : fromId, "paperid": paperid},
		success: function(xml) {
			console.log("Success");
			jQuery(".box").html("");
			var result = jQuery(xml).find("content");
			jQuery(result).each(function() {
				var content = jQuery(this).text();
				jQuery("#noti_pop").append(content);
			});
		},
		error: function(xml) {
			alert("실패ㅠ");
		}
	});
}

function freject(toId, fromId, paperid) {

	jQuery.ajax({
		url: "/addFriendReject.vs",
		type: "POST",
		dataType: "xml",
		data: {"toId" : toId, "fromId" : fromId, "paperid" : paperid},
		success: function(xml) {
			console.log("Success");
			jQuery(".box").html("");
			var result = jQuery(xml).find("content");
			jQuery(result).each(function() {
				var content = jQuery(this).text();
				jQuery("#noti_pop").append(content);
			});
		},
		error: function(xml) {
			alert("실패ㅠ");
		}
	});
}

function preject(toId, projectid, fromId, paperid) {
	jQuery.ajax({
		url: "/addRejectOk.vs",
		type: "POST",
		dataType: "xml",
		data: {"toId" : toId, "projectid": projectid, "fromId": fromId, "paperid": paperid},
		success: function(xml) {
			console.log("Success");
			jQuery(".box").html("");
			var result = jQuery(xml).find("content");
			jQuery(result).each(function() {
				var content = jQuery(this).text();
				jQuery("#noti_pop").append(content);
			});
		},
		error: function(xml) {
			alert("실패ㅠ");
		}
	});
}