/**
 * 지금 사용하는 js와는 별도로 아래의 js를 추가로 첨부할 것 
 * <script src="https://www.dropbox.com/static/api/1/dropins.js" id="dropboxjs" data-app-key="or00tiovexbz7jh"></script>
 * 
 * 사용하는 위치에 
 * <div id="container"></div> 는 반드시 쓸것!! 나중에 버튼 안보인다고 울지 않기.. >>
 * 
 * 버튼 css조절은 css명명 규칙이 조금 다르니 참고해서 사용하세요.(ex) font-size >> fontSize (수업시간에 배운내용임..) 
 */	 
	
	window.onload = function() {
		
		options = {
	
		    // Required. Called when a user selects an item in the Chooser.
		    success: function(files) {
		       
		       	$("#container a").attr("class","dropbox-dropin-btn dropbox-dropin-default");
		        location.href = files[0].link;			       	
		        
		    },
	
		    // Optional. Called when the user closes the dialog without selecting a file
		    // and does not include any parameters.
		    cancel: function() {
	
		    },
	
		    // Optional. "preview" (default) is a preview link to the document for sharing,
		    // "direct" is an expiring link to download the contents of the file. For more
		    // information about link types, see Link types below.
		    linkType: "direct", // or "preview"  
	
		    // Optional. A value of false (default) limits selection to a single file, while
		    // true enables multiple file selection.
		    multiselect: true, // or true
	
		    // Optional. This is a list of file extensions. If specified, the user will
		    // only be able to select files with these extensions. You may also specify
		    // file types, such as "video" or "images" in the list. For more information,
		    // see File types below. By default, all extensions are allowed.
		    extensions: ['.*','.jsp','.htm'], 
		    
		    // 다운 받을 수 있는 파일 형식으 관해서 추후 논의!!
		    
		};
		
		var button = Dropbox.createChooseButton(options);		
		document.getElementById("container").appendChild(button);
		$("#container a").html("<span class='dropin-btn-status'></span>에서 내려받기");
		$("#container a").css({			
			fontSize: "10pt",
			width : "110px",
			height : "15px",
			textAlign : "center"
		});		
	};

