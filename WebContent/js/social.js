window.onload = function facebookResult() {
	
	// 페이스북 SDK 초기화
	FB.init({
    	appId      : '248606635333902',
     	staus      : true,	         	
     	xfbml      : true,
     	version    : 'v2.0'
   	});	   
	
 	// 추가로 초기화할 코드들
};

var socialType;

function fb_login() {
	
	socialType = $(this).attr("class").substring(4, 6);
	
	FB.getLoginStatus(function(response) { // 로그인 상태 확인
		if (response.status === 'connected') {     			
				infoHandler(response);
		} else { // 로그인 상태가 아니면
			
			FB.login(function(response) { // 로그인 창 실행
				if (response.authResponse) {
					infoHandler(response);
				}				
	        }, 
	        {scope: 'email'});
		}
	});
};

// 페이스북 SDK 로딩
(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ko_KR/all.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

var accessToken, userEmail, userName, userPicture;

function infoHandler(response) {        
	accessToken = response.authResponse.accessToken; // 엑세스 토큰 저장
	     
	FB.api('/me', function(user) {
        
		$.ajax({
			type: "post",
			url: "/socialLogin.vs",
			data: $.param({ 
				loginEmail: user.email,
				loginName: user.name,
				loginPicture: 'http://graph.facebook.com/' + user.id + '/picture',
				socialType: socialType
			})
		});
		location.href="/index.vs";
    });

}

function checkLoginState() {
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
}

function auth() {
	socialType = $(this).attr("class").substring(4, 6);
	var config = {
		'client_id': '675877943219-gunb7emqtnnloa941d5h887pm3u6fl64.apps.googleusercontent.com',
		'scope': 'profile'
	};
	gapi.auth.authorize(config, function() {
		console.log('login complete');
		console.log(gapi.auth.getToken());
		gapi.client.load('oauth2', 'v2', function() {
			gapi.client.oauth2.userinfo.get().execute(function(response) {
				
				$.ajax({
					type: "post",
					url: "/socialLogin.vs",
					data: $.param({ 
						loginEmail: response.email,
						loginName: response.name,
						loginPicture: response.picture,
						socialType: socialType
					}),
					complete: function() {
						location.href="/index.vs";						
					}
				});
				
			});
		});
	});
}