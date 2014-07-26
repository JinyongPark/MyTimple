<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기능소개</title>


<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>



<link rel="stylesheet" href="/themes/base/jquery.ui.all.css">
<script src="/js/jquery-1.10.2.js"></script>
<script>
	var jb = jQuery.noConflict();
</script>


<script src="/ui/jquery.ui.core.js"></script>
<script src="/ui/jquery.ui.widget.js"></script>
<script src="/ui/jquery.ui.tabs.js"></script>
<link rel="stylesheet" href="/css/demos.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="/js/jquery-2.1.0.min.js"><\/script>')
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script>
	window.jQuery.ui
			|| document
					.write('<script src="/js/jquery-ui-1.10.4.min.js"><\/script>')
</script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.booklet.latest.js"></script>

<script>
	var bc = jQuery.noConflict();
</script>


<script>
	bc(function() {
		bc("#mybook").booklet();
	});
</script>



<script type="text/javascript">
	jb(document).ready(function() {
		jb("#tabs").tabs({
			event : "mouseover"
		});
	});
</script>



<link href="/css/jquery.booklet.latest.css" type="text/css"
	rel="stylesheet" media="screen, projection, tv" />


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

font {
	color: deepskyblue;
}

#fn {
	margin-top: 0px;
	margin-left: 0%;
	height: 210px;
	background-color: lightgray;
	text-align: center;
	padding: 20px;
	position: absulote;
	opacity: 0.87;
}

#section {
	width: 100%;
	min-height: 820px;
}

p {
	font-weight: bold;
	font-family: "바탕";
}

#p1 {
	color: gray;
	font-weight: bold;
	font-size: 20px;
	text-shadow: 5px 5px 5px gray;
}

#p2 {
	color: blue;
	opacity: 0.5;
	font-size: 17px;
}

#p3 {
	opacity: 0.6;
	letter-spacing: 2px;
	font-size: 14px;
}

#slider1_container {
	position: absolute;
	top: 50%;
	left: 50%;
}

#tabs001 {
	margin-top: 10px;
	font-size: 15px;
	text-align: justify;
}

body {
	font: normal 12px/1.2 arial, verdana, sans-serif;
}

#tabs {
	margin-top: 30px;
	margin-left: 18%;
	width: 60%;
	position: absolute;
	height: 57%;
}

#tabs-3 {
	letter-spacing: 3px;
	word-spacing: 3px;
	margin-top: 60px;
}

#book {
	color: lightblack;
	letter-spacing: 0.7px;
	position: absolute;
}

#downup {
	margin-top: 5%;
	margin-left: 50%;
}





#tabs-1 {

width: 700px;


}




</style>

<style type="text/css">
.down span {
	color: blue;
}

.down #intro {
	margin-top: 5%;
	margin-left: 30%;
}

.down table {
	margin-top: 50px;
	color: #7F7F7F;
	margin-left: 0.7%;
	border- collapse: collapse;
	font-size: 14px;
	border: white 1px solid;
	cellspacing: 1px;
	width: 550px;
	border: 0px;
}

.down table td {
	font-family: "명조";
	border: white 2px solid;
}

.down td,th {
	border: 1px solid black;
	border- collapse: collapse;
	height: 33px;
}

.down table td.center {
	text-align: center;
	background-color: aliceblue;
	font-weight: bold;
}

.down table td.left {
	background-color: lightcyan;
	text-align: center;
}

.down #p {
	font-family: "명조";
}

.down font {
	color: deepskyblue;
}

.down #vi {
	margin-top: 30px;
	margin-left: 0.7%;
}

.down #teampl {
	margin-left: 0.7%;
}
</style>


</head>



<body>

<jsp:include page="/header.vs"></jsp:include>
	

	<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>

	<script>
		var hs = jQuery.noConflict();
	</script>




	<!-- use jssor.slider.mini.js (39KB) or jssor.sliderc.mini.js (31KB, with caption, no slideshow) or jssor.sliders.mini.js (26KB, no caption, no slideshow) instead for release -->
	<!-- jssor.slider.mini.js = jssor.sliderc.mini.js = jssor.sliders.mini.js = (jssor.core.js + jssor.utils.js + jssor.slider.js) -->
	<script type="text/javascript" src="/js/jssor.core.js"></script>
	<script type="text/javascript" src="/js/jssor.utils.js"></script>
	<script type="text/javascript" src="/js/jssor.slider.js"></script>


	<script>
		hs(document)
				.ready(
						function(hs) {

							var _SlideshowTransitions = [
							//Fade in L
							{
								$Duration : 1200,
								$During : {
									$Left : [ 0.3, 0.7 ]
								},
								$FlyDirection : 1,
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade out R
							, {
								$Duration : 1200,
								$SlideOut : true,
								$FlyDirection : 2,
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade in R
							, {
								$Duration : 1200,
								$During : {
									$Left : [ 0.3, 0.7 ]
								},
								$FlyDirection : 2,
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade out L
							, {
								$Duration : 1200,
								$SlideOut : true,
								$FlyDirection : 1,
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}

							//Fade in T
							, {
								$Duration : 1200,
								$During : {
									$Top : [ 0.3, 0.7 ]
								},
								$FlyDirection : 4,
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade out B
							, {
								$Duration : 1200,
								$SlideOut : true,
								$FlyDirection : 8,
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade in B
							, {
								$Duration : 1200,
								$During : {
									$Top : [ 0.3, 0.7 ]
								},
								$FlyDirection : 8,
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade out T
							, {
								$Duration : 1200,
								$SlideOut : true,
								$FlyDirection : 4,
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}

							//Fade in LR
							, {
								$Duration : 1200,
								$Cols : 2,
								$During : {
									$Left : [ 0.3, 0.7 ]
								},
								$FlyDirection : 1,
								$ChessMode : {
									$Column : 3
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade out LR
							, {
								$Duration : 1200,
								$Cols : 2,
								$SlideOut : true,
								$FlyDirection : 1,
								$ChessMode : {
									$Column : 3
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade in TB
							, {
								$Duration : 1200,
								$Rows : 2,
								$During : {
									$Top : [ 0.3, 0.7 ]
								},
								$FlyDirection : 4,
								$ChessMode : {
									$Row : 12
								},
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade out TB
							, {
								$Duration : 1200,
								$Rows : 2,
								$SlideOut : true,
								$FlyDirection : 4,
								$ChessMode : {
									$Row : 12
								},
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}

							//Fade in LR Chess
							, {
								$Duration : 1200,
								$Cols : 2,
								$During : {
									$Top : [ 0.3, 0.7 ]
								},
								$FlyDirection : 4,
								$ChessMode : {
									$Column : 12
								},
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade out LR Chess
							, {
								$Duration : 1200,
								$Cols : 2,
								$SlideOut : true,
								$FlyDirection : 8,
								$ChessMode : {
									$Column : 12
								},
								$Easing : {
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade in TB Chess
							, {
								$Duration : 1200,
								$Rows : 2,
								$During : {
									$Left : [ 0.3, 0.7 ]
								},
								$FlyDirection : 1,
								$ChessMode : {
									$Row : 3
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}
							//Fade out TB Chess
							, {
								$Duration : 1200,
								$Rows : 2,
								$SlideOut : true,
								$FlyDirection : 2,
								$ChessMode : {
									$Row : 3
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$Opacity : 2
							}

							//Fade in Corners
							, {
								$Duration : 1200,
								$Cols : 2,
								$Rows : 2,
								$During : {
									$Left : [ 0.3, 0.7 ],
									$Top : [ 0.3, 0.7 ]
								},
								$FlyDirection : 5,
								$ChessMode : {
									$Column : 3,
									$Row : 12
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$ScaleVertical : 0.3,
								$Opacity : 2
							}
							//Fade out Corners
							, {
								$Duration : 1200,
								$Cols : 2,
								$Rows : 2,
								$During : {
									$Left : [ 0.3, 0.7 ],
									$Top : [ 0.3, 0.7 ]
								},
								$SlideOut : true,
								$FlyDirection : 5,
								$ChessMode : {
									$Column : 3,
									$Row : 12
								},
								$Easing : {
									$Left : $JssorEasing$.$EaseInCubic,
									$Top : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$ScaleHorizontal : 0.3,
								$ScaleVertical : 0.3,
								$Opacity : 2
							}

							//Fade Clip in H
							, {
								$Duration : 1200,
								$Delay : 20,
								$Clip : 3,
								$Assembly : 260,
								$Easing : {
									$Clip : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$Opacity : 2
							}
							//Fade Clip out H
							, {
								$Duration : 1200,
								$Delay : 20,
								$Clip : 3,
								$SlideOut : true,
								$Assembly : 260,
								$Easing : {
									$Clip : $JssorEasing$.$EaseOutCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$Opacity : 2
							}
							//Fade Clip in V
							, {
								$Duration : 1200,
								$Delay : 20,
								$Clip : 12,
								$Assembly : 260,
								$Easing : {
									$Clip : $JssorEasing$.$EaseInCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$Opacity : 2
							}
							//Fade Clip out V
							, {
								$Duration : 1200,
								$Delay : 20,
								$Clip : 12,
								$SlideOut : true,
								$Assembly : 260,
								$Easing : {
									$Clip : $JssorEasing$.$EaseOutCubic,
									$Opacity : $JssorEasing$.$EaseLinear
								},
								$Opacity : 2
							} ];

							var options = {
								$AutoPlay : false, //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
								$AutoPlayInterval : 1500, //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
								$PauseOnHover : 1, //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, default value is 1

								$DragOrientation : 3, //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
								$ArrowKeyNavigation : true, //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
								$SlideDuration : 800, //Specifies default duration (swipe) for slide in milliseconds

								$SlideshowOptions : { //[Optional] Options to specify and enable slideshow or not
									$Class : $JssorSlideshowRunner$, //[Required] Class to create instance of slideshow
									$Transitions : _SlideshowTransitions, //[Required] An array of slideshow transitions to play slideshow
									$TransitionsOrder : 1, //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
									$ShowLink : true
								//[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
								},

								$ArrowNavigatorOptions : { //[Optional] Options to specify and enable arrow navigator or not
									$Class : $JssorArrowNavigator$, //[Requried] Class to create arrow navigator instance
									$ChanceToShow : 1
								//[Required] 0 Never, 1 Mouse Over, 2 Always
								},

								$ThumbnailNavigatorOptions : { //[Optional] Options to specify and enable thumbnail navigator or not
									$Class : $JssorThumbnailNavigator$, //[Required] Class to create thumbnail navigator instance
									$ChanceToShow : 2, //[Required] 0 Never, 1 Mouse Over, 2 Always

									$ActionMode : 1, //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
									$SpacingX : 8, //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
									$DisplayPieces : 10, //[Optional] Number of pieces to display, default value is 1
									$ParkingPosition : 360
								//[Optional] The offset position to park thumbnail
								}
							};

							var jssor_slider1 = new $JssorSlider$(
									"slider1_container", options);
							//responsive code begin
							//you can remove responsive code if you don't want the slider scales while window resizes
							function ScaleSlider() {
								var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
								if (parentWidth)
									jssor_slider1.$SetScaleWidth(Math.max(Math
											.min(parentWidth, 800), 300));
								else
									window.setTimeout(ScaleSlider, 30);
							}

							ScaleSlider();

							if (!navigator.userAgent
									.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
								$(window).bind('resize', ScaleSlider);
							}

							//if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
							//    $(window).bind("orientationchange", ScaleSlider);
							//}
							//responsive code end

						});
	</script>


	<div id="section">

		<div id="fn">

			<p id="p1">
				팀플로 프로젝트를 효율적으로 관리해보세요!<br> <br>
			</p>
			<p id="p2">종합적인 프로젝트 관리 툴은 없을까?</p>
			<p id="p3">
				이런 물음에 답하고자 저의 팀플에서는 다채로운 기능을<br> 구현하였습니다. 지금부터 몇가지 놀라운 기능을
				여러분께 소개해드립니다.
			</p>


		</div>


		<div id="tabs">
			<ul>
				<li><a href="#tabs-3">들어가면서</a></li>
				<!-- <li><a href="#tabs-1">슬라이드로 보기</a></li> -->
				<li><a href="#tabs-2">책으로 보기</a></li>
			</ul>


			<!-- <div id="tabs-1">


				<div id="slider1_container"
					style="position: relative; top: 0px; left: 0px; width: 750px; height: 456px; background: lightgray; overflow: hidden;">

					Loading Screen
					<div u="loading" style="position: absolute; top: 0px; left: 0px;">
						<div
							style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
						</div>
						<div
							style="position: absolute; display: block; background: url(img/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
						</div>
					</div>

					Slides Container

					<div u="slides"
						style="cursor: move; position: absolute; left: 0px; top: 0px; width: 750px; height: 356px; overflow: hidden;">

						<div>
							<img u="image" src="/images/inst/01.png" /> <img u="thumb"
								src="/images/inst/01.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/02.png" /> <img u="thumb"
								src="/images/inst/02.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/03.png" /> <img u="thumb"
								src="/images/inst/03.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/04.png" /> <img u="thumb"
								src="/images/inst/04.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/05.png" /> <img u="thumb"
								src="/images/inst/05.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/06.png" /> <img u="thumb"
								src="/images/inst/06.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/07.png" /> <img u="thumb"
								src="/images/inst/07.png" />
						</div>


						<div>
							<img u="image" src="/images/inst/08.png" /> <img u="thumb"
								src="/images/inst/08.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/09.png" /> <img u="thumb"
								src="/images/inst/09.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/10.png" /> <img u="thumb"
								src="/images/inst/10.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/11.png" /> <img u="thumb"
								src="/images/inst/11.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/12.png" /> <img u="thumb"
								src="/images/inst/12.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/13.png" /> <img u="thumb"
								src="/images/inst/13.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/14.png" /> <img u="thumb"
								src="/images/inst/14.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/15.png" /> <img u="thumb"
								src="/images/inst/15.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/16.png" /> <img u="thumb"
								src="/images/inst/16.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/17.png" /> <img u="thumb"
								src="/images/inst/17.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/18.png" /> <img u="thumb"
								src="/images/inst/18.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/19.png" /> <img u="thumb"
								src="/images/inst/19.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/20.png" /> <img u="thumb"
								src="/images/inst/20.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/21.png" /> <img u="thumb"
								src="/images/inst/21.png" />
						</div>



						<div>
							<img u="image" src="/images/inst/22.png" /> <img u="thumb"
								src="/images/inst/22.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/23.png" /> <img u="thumb"
								src="/images/inst/23.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/24.png" /> <img u="thumb"
								src="/images/inst/24.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/25.png" /> <img u="thumb"
								src="/images/inst/25.png" />
						</div>

						<div>
							<img u="image" src="/images/inst/26.png" /> <img u="thumb"
								src="/images/inst/26.png" />
						</div>

					</div>


					Arrow Navigator Skin Begin
					<style>
/* jssor slider arrow navigator skin 05 css */
/*
            .jssora05l              (normal)
            .jssora05r              (normal)
            .jssora05l:hover        (normal mouseover)
            .jssora05r:hover        (normal mouseover)
            .jssora05ldn            (mousedown)
            .jssora05rdn            (mousedown)
            */
.jssora05l,.jssora05r,.jssora05ldn,.jssora05rdn {
	position: absolute;
	cursor: pointer;
	display: block;
	background: url(img/a17.png) no-repeat;
	overflow: hidden;
}

.jssora05l {
	background-position: -10px -40px;
}

.jssora05r {
	background-position: -70px -40px;
}

.jssora05l:hover {
	background-position: -130px -40px;
}

.jssora05r:hover {
	background-position: -190px -40px;
}

.jssora05ldn {
	background-position: -250px -40px;
}

.jssora05rdn {
	background-position: -310px -40px;
}
</style>
					Arrow Left
					<span u="arrowleft" class="jssora05l"
						style="width: 40px; height: 40px; top: 158px; left: 8px;">
					</span>
					Arrow Right
					<span u="arrowright" class="jssora05r"
						style="width: 40px; height: 40px; top: 158px; right: 8px">
					</span>
					Arrow Navigator Skin End

					Thumbnail Navigator Skin Begin
					<div u="thumbnavigator" class="jssort01"
						style="position: absolute; width: 800px; height: 100px; left: 0px; bottom: 0px;">
						Thumbnail Item Skin Begin
						<style>
/* jssor slider thumbnail navigator skin 01 css */
/*
                .jssort01 .p           (normal)
                .jssort01 .p:hover     (normal mouseover)
                .jssort01 .pav           (active)
                .jssort01 .pav:hover     (active mouseover)
                .jssort01 .pdn           (mousedown)
                */
.jssort01 .w {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
}

.jssort01 .c {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 68px;
	height: 68px;
	border: #000 2px solid;
}

.jssort01 .p:hover .c,.jssort01 .pav:hover .c,.jssort01 .pav .c {
	background: url(img/t01.png) center center;
	border-width: 0px;
	top: 2px;
	left: 2px;
	width: 68px;
	height: 68px;
}

.jssort01 .p:hover .c,.jssort01 .pav:hover .c {
	top: 0px;
	left: 0px;
	width: 70px;
	height: 70px;
	border: #fff 1px solid;
}
</style>


						<div u="slides" style="cursor: move;">
							<div u="prototype" class="p"
								style="position: absolute; width: 72px; height: 72px; top: 0; left: 0;">
								<div class=w>
									<thumbnailtemplate
										style=" width: 100%; height: 100%; border: none;position:absolute; top: 0; left: 0;"></thumbnailtemplate>
								</div>
								<div class=c></div>
							</div>
						</div>
						Thumbnail Item Skin End
					</div>
					Thumbnail Navigator Skin End
					<a style="display: none" href="http://www.jssor.com">slideshow
						html</a>
				</div>



			</div>

 -->


			<div id="tabs-2">

				<div id="mybook">
					<div title="first page">
						<br>
						<p id="book">상단 메뉴를 선택했을 때 나오는 화면입니다. 상단 메뉴는 왼쪽부터 순서대로 나의
							프로젝트, 쪽지, 메모, 알림, 그리고 회원이름이 나타납니다. 하단 화면은 위쪽부터 순서대로 프로젝트 목록, 쪽지,
							알림, 회원이름을 눌렀을 때 나타나는 화면입니다. 쪽지에는 수락/거절이 필요할 경우 화면 버튼이 나타나게 됩니다.
							회원이름을 클릭했을 때는 회원사진과 간단한 직종, 그리고 하단에는 친구 목록이 나타나게 됩니다.</p>


					</div>
					<div title="second page">
						<br>
						<p id="book">진행 중인 프로젝트 리스트 웹에서 진행 중인 프로젝트들 중 공개상태로 진행 중인
							프로젝트를 보여줍니다. 관련 직군들 중 기본적으로 3개의 프로젝트들을 보여주며, ‘더 보기’(More View)를
							누르면 다른 프로젝트들을 볼 수 있습니다. 프로젝트 메뉴 진입 시 상단 메뉴의 색깔이 바뀝니다. 한 개의 프로젝트를
							선택 시 해당 프로젝트에 대한 세부 내용을 볼 수 있습니다.</p>


					</div>
					<div title="third page">
						<br>
						<p id="book">충원 중인 프로젝트 리스트 충원 중인 프로젝트 중 한 개를 선택하였을 시 보여지는
							화면입니다. 프로젝트의 시작일과 팀장명, 현재 프로젝트를 진행 중인 인원 수를 볼 수 있습니다. 프로젝트에 대한
							간략한 소개 글이 있으며 쪽지 보내기 버튼을 통해 팀장에게 연락을 취할 수 있습니다.</p>


					</div>
					<div title="fourth page">
						<br>
						<p id="book">프로젝트 검색 화면 상단 메뉴바 중앙에 있는 ‘프로젝트를 검색해보세요!’를 누르면
							공개적으로 진행 중인 프로젝트들 중 검색어에 해당하는 프로젝트를 검색할 수 있다. 기존 페이지는 회색빛으로 변하고
							기존 검은색 배경화면의 레이아웃이 생기고 결과는 그 위에 출력된다. ‘검색어’에 대한 검색 결과(개수) 로 몇 개가
							검색되었는지 알려줍니다.</p>

					</div>
					<div title="fifth page">
						<br>
						<p id="book">가입한 모든 회원이 이용할 수 있는 게시판입니다. 게시판목록에는 해당 카테고리, 글
							번호, 글 제목, 작성자, 작성일, 조회, 추천수가 출력됩니다. 밑에는 페이징 기능을 통해 10개씩 글을 볼 수
							있습니다. 기간별, 제목 또는 내용을 통해 게시글을 검색할 수 있습니다. 운영자가 입력하는 공지사항은 항상 게시판의
							1순위로 올라오고 각 게시글 중 가장 많은 추천을 받은 3개의 게시글을 공지사항 다음으로 보여줍니다.</p>


					</div>
					<div title="sixth page">
						<br>
						<p id="book">글 내용 보기 게시판의 리스트 중 1개의 글을 선택하면 볼 수 있는 화면 입니다. 맨
							위에는 게시글의 제목이 출력되고 제목 좌측하단에는 작성자명, 우측에는 게시날짜, 가운데에는 게시글의 내용이
							출력됩니다. 본문 밑에는 해당게시글의 댓글들을 볼 수 있습니다. 댓글은 댓글 작성자, 댓글 내용, 댓글 작성 날짜,
							삭제를 할 수 있는 ‘X’ 버튼으로 구성되어 있습니다.</p>



					</div>


					<div title="seventh page">
						<br>

						<p id="book">글 작성 게시판에 글을 등록할 수 있습니다. 카테고리를 통해 어떤 프로젝트와 관련된 것
							인지 글을 남길 수 있습니다. 비밀번호는 해당 글을 삭제하거나 수정할 때 조건을 확인 합니다.</p>

					</div>



					<div title="eighth page">
						<br>
						<p id="book">My Page My Page는 크게 4가지로 구성이 되어 있습니다. 개인 정보 수정
							기본적인 개인정보를 수정할 수 있습니다. 경력과 직군, 연락처를 수정할 수 있습니다. Password 변경 계정의
							Password를 변경할 수 있습니다. Project List 보기 자신이 그 동안 참여하였던 Project 들을
							확인 할 수 있습니다. 링크를 통해 해당 프로젝트로 이동할 수 있습니다.</p>

					</div>




					<div title="nine page">
						<br>
						<p id="book">고객센터(공지사항) 고객센터는 공지사항, 자주하는 질문, Q&A게시판 등 총 3개로
							구성이 되어있습니다. 공지사항은 웹페이지 관리자가 이용규정 등 회원들에게 알려주는 사항들을 기록하는 게시판입니다.
							회원들은 보는 것 이외에는 아무런 기능을 할 수 없으며 오직 운영자만이 글을 등록할 수 있습니다.</p>

					</div>


					<div title="ten page">
						<br>
						<p id="book">고객센터(자주하는 질문) 자주하는 질문은 회원들이 고객센터에 문의하는 질문들 중 자주하는
							질문들을 모아 알려주는 역할을 합니다. 해당 질문을 클릭하면 그에 대한 답변창이 열리게 됩니다.</p>

					</div>








					<div title="eleven page">

						<p id="book">고객센터(Q&A) Q&A 게시판은 회원들이 관리자 측에 궁금한 사항들을 묻는
							게시판입니다. 답변 글은 오직 관리자만이 쓸 수 있습니다.</p>

					</div>






					<div title="twelve page">

						<p id="book">프로젝트 등록 페이지 프로젝트 등록을 클릭시 나오는 페이지 이며 자신의 팀의 프로젝트를
							등록이 가능합니다. 프로젝트명 : 진행시 대표 명칭 팀원 : 프로젝트에 참가하는 인원 지정 및 팀장을 지정 합니다.
							예상기간 : 시작 일자 및 종료 일자를 선택하며 텍스트 박스를 누를시 캘린더가 지원이 되어서 클릭시 텍스트 박스에
							입력이 됩니다. 알림 : 팀원들에게 등록후 팀원으로 등록 되었음을 알릴지 말지를 선택합니다.</p>

					</div>








					<div title="thirteen page">

						<p id="book">참여중인 프로젝트 선택 첫 화면 차트 : 프로젝트 일정에 기간을 나타내며 간단한 차트
							형태로 현재 진행 예정이거나 아니면 추후 일정기간을 눈으로 쉽게 보도록 설정이 가능합니다. 팀 일정 : 팀에 그날
							당일의 하루 팀 일정을 보여주며 자세한 내용은 캘린더로 확인이 가능합니다. 설정 : 차트의 프로젝트 일정에 관련된
							내용을 추가를 하거나 삭제를 하여 보기 편하도록 한다.</p>

					</div>









					<div title="fourteen page">

						<p id="book">프로젝트 플랜 화면 프로젝트의 세부 업무에 관한 글을 작성이 될 경우에 리스트로 출력을
							하여 알려줍니다. 기한 : 시작날짜 와 완료 날짜를 기한에 표시 하여 주며 기한이 얼마 남지 않은 업무 (대략 3
							일) 는 붉은 색으로 표시를 하여 알려줍니다. 또 각 담당자에게 쪽지를 보내어 업무 기간이 얼마 남지 않았단 사실을
							알려줍니다. 내용 : 업무 내용을 간략하게 작성하여 표시해주며 자세한 업무 사항은 클릭을 하였을 경우에 보여줍니다.
						</p>

					</div>









					<div title="fifteen page">

						<p id="book">프로젝트 플랜 화면 프로젝트의 세부 업무에 관한 글을 작성이 될 경우에 리스트로 출력을
							하여 알려줍니다. 기한 : 시작날짜 와 완료 날짜를 기한에 표시 하여 주며 기한이 얼마 남지 않은 업무 (대략 3
							일) 는 붉은 색으로 표시를 하여 알려줍니다. 또 각 담당자에게 쪽지를 보내어 업무 기간이 얼마 남지 않았단 사실을
							알려줍니다. 내용 : 업무 내용을 간략하게 작성하여 표시해주며 자세한 업무 사항은 클릭을 하였을 경우에 보여줍니다.
						</p>

					</div>






					<div title="sixteen page">

						<p id="book">프로젝트 업무 등록 프로젝트의 세부 업무에 관한 글을 작성 하는 장소 이며 각각의 개인의
							업무를 부여 하며 작성 후 보는 페이지를 통하여 보기가 가능합니다. 기한 : 세부 업무의 시작 날짜와 완료 날짜를
							지정하며 입력창 선택시 캘린더가 뜨며 캘린더에서 날짜를 선택시 적용이 됩니다. 담당자 : 프로젝트 업무를 진행할
							담당자를 선택하며 첫 선택자는 리더 형식의 약간의 책임자이며 그 외 다른 선택자는 같이 진행을 할 담당자 입니다.</p>

					</div>







					<div title="seventeen page">

						<p id="book">프로젝트 업무 내용 보기 프로젝트의 세부 업무에 관한 글을 보는 페이지 이며 등록시
							작성했던 내용이 나와 있으며 작성자는 보기 페이지를 통하여 수정 및 삭제 또 한 보류도 가능하게 합니다. 업무 :
							업무 담당자는 자신의 역할을 완료시에 완료 및 보류를 선택 할수 있으며 보류시에는 간단한 쪽지창이 뜨며 팀장에게
							사유를 작성하여야 합니다.</p>

					</div>








					<div title="eightteen page">

						<p id="book">게시판 프로젝트 멤버 끼리 사용이 가능한 공간 입니다. 단순한 게시판 기능을 가지고
							있으며 이미지에 기능에 대하여 약간 작성 하였습니다. 검색 : 작성글 검색이 가능하며 내용은 이름 제목 내용 제목 +
							내용으로 검색이 가능합니다. 페이징뷰 : 페이징 기능이 작동하며 페이징을 통한 빠른 게시물 보기가 가능합니다. 설정
							: 게시판 추가 및 삭제 같은 기능을 설정이 가능하며 게시판 별로 테마 (색) 변경도 가능한 공간 입니다.</p>

					</div>











					<div title="nineteen page">

						<p id="book">예산 관리 프로젝트 팀 멤버끼리 사용한 예산을 관리를 하는 페이지 입니다. 내용 :
							사용한 날짜와 사용한 이력에 대한 내용 과 금액이 출력이 됩니다. 이 금액이 출금이면 출금에 금액을 작성 입금이면
							입금 내역에 금액을 작성 합니다. 그리고 기존에 금액에서 계속적으로 + 나 – 를 적용하여 총 금액을 글을 작성시
							마다 지속적으로 출력을 하여 줍니다.</p>

					</div>










					<div title="twenty page">

						<p id="book">예산 관리 (보기 및 등록) 프로젝트 팀 멤버끼리 사용한 예산을 관리를 하는 페이지
							입니다. 보기 : 현재 스샷에 나와있는 내용이 글을 눌렀을때 보여지는 페이지 입니다. 담당자와 입금일 경우에 금액과
							출금일 경우에 금액 그리고 종류에 상관없이 금액이 작성이 되어서 보여지며 마지막으로 사용내역과 기본적인 기능은 수정
							및 삭제가 제공 됩니다. 단 수정 및 삭제 기능 같은 경우 회계 담당자가 아니라면 아예 보이지 않습니다.</p>

					</div>






					<div title="twentyone page">

						<p id="book">자료실 기본적인 자료를 업로드와 다운로드를 할 수가 있으며 팀의 프로젝트 진행시 필요한
							파일을 사용하게 도움을 주는 공간 입니다. N 드라이브 형식 : 기본적으로 보여지는 형식은 네이버의 N 드라이브를
							모티브로 하여서 사용합니다.폴더 및 파일 형식을 이용하여 유저가 좀 더 편하게 사용을 할수 있도록 지원합니다.</p>

					</div>










					<div title="twentytwo page">

						<p id="book">메모 사용자 끼리 간단하게 메모를 할수 있는 형식이며 간단한 텍스트 내용과 수정 삭제를
							제공 합니다. 메모를 작성을 하면 기본적으로 새로운 글로 처리가 되어서 가장 상단 부분에 표시가 됩니다. 기본적으로
							20개 까지 보여지며 그 뒤는 페이징 처리가 되어서 보여집니다. 게시물이 작성이 되면은 유저의 이름과 그리고 유저가
							등록한 이미지가 표시가 되며 내용을 출력 후 그 상단쪽에 수정과 삭제가 가능하도록 되있습니다.</p>

					</div>









					<div title="twentythree page">

						<p id="book">캘린더 팀의 스케쥴을 구성할때 도움이 되도록 지원이 되는 캘린더 기능입니다. 월간일정 :
							월간 일정은 월 단위로 달력을 출력하여 날짜를 보여주고 날짜를 선택시에 일정을 등록 할수 있는 등록창이 뜨며 작성
							내용을 클릭하면 작성 내용을 수정할수 있는 창이 뜹니다. 일정목록 : 일정 목록은 아래 페이지에서 설명 하겠습니다.
						</p>

					</div>

					<div title="twentyfour page">

						<p id="book">캘린더 (일정 목록) 팀의 스케쥴을 구성할때 도움이 되도록 지원이 되는 캘린더
							기능입니다. 일정 목록 : 일정 목록은 일주일 단위 월요일 ~ 일요일 까지의 일정을 보여주며 보다 눈에 어지러운
							기분이 들지 않도록 리스트 형식으로 제공이 되며 날짜와 시간 제목과 장소 참가자가 보이며 제목을 클릭을 하면은 자세한
							내용이 출력 됩니다.</p>

					</div>

					<div title="twentyfive page">

						<p id="book">팀원 정보 팀원의 정보를 보여주는 페이지 입니다. 등록 : 단순한 팀원의 정보를 등록하여
							보여지는 페이지로 이름과 이메일 및 전화번호 만을 등록을 합니다. 수정 : 팀원의 정보를 수정할시 필요할때 수정을
							하는 기능 입니다.</p>

					</div>


					<div title="twentysix page">

						<p id="book">환경 설정 프로젝트 공간을 설정하는 환경 설정 공간 입니다. 테마 변경 : 게시판에서 각
							게시판 별로 테마를 지정이 가능하듯이 각 카테고리 별로 테마를 설정하여 색깔 변경이 가능합니다. 순서 변경 : 왼쪽
							메뉴바 순서를 유저가 편하도록 순서를 설정하여 관리가 가능 합니다. 전체 쪽지 : 전체적으로 팀원들에게 쪽지를
							발송하는 부분이며 팀장은 전체 쪽지를 통하여 보다 팀원 들에게 빠른 소식 전달이 가능합니다.</p>

					</div>

				</div>

			</div>


			<div id="tabs-3">

				<p>
					여러분은 하루에 몇 가지 업무를, 몇 명의 사람들과 진행하시나요? 쌓여만 가는 다양한 업무를 효과적으로 진행하지 못하면,
					시간 관리가 허술하게 되고, 이는 업무의 지연을 가져오게 됩니다 그러므로 올바른 "업무관리"는 팀원에게도, 또한 여러
					명의 팀원 업무를 함께 관리해야 하는 팀장에게 매우 큰 이슈입니다. 그렇다면, 더욱 효과적인 업무관리 방법은 무엇일까요?
					팀 오피스는 이러한 궁금증/필요 때문에 의해 만들어졌습니다. 업무 시작부터 완료될 때까지 업무진행에 필요한 모든 기능을
					제공하여, 더욱 효과적인 업무 관리가 가능합니다. 머리로만 기억하는 업무 진행상황에 의존하지 마시고, 간단히 기록하고,
					전달하여 본인의 업무관리 능력을 한 층 더 높여보시기 바랍니다. 


				</p>

			</div>
		</div>

	

	</div>
	
	<hr />
	
	<br />
	
	<div class="down">
	
	<div id="intro">

		<div id="teampl">
			<font size="+1"><b>최고의 서비스, 팀플!</b></font><br>
			<p id="p">
				2014년 3월에 설립하여 시장을 선도해온 팀플은 사용자들에게 최고의 서비스<br> 를 제공해온 <span>대한민국
					대표 인터넷 기반의 협업 어플리케이션으로의 위치</span>를<br> 유지하고 있는1위 소셜그룹웨어 입니다.
			</p>
		</div>



		<table>

			<tr>
				<td id="cl" colspan="2" height="39"><font size="+1"><b>회사개요</b></font></td>
			</tr>


			<tr>
				<td class="center" width="100">사이트명</td>
				<td class="left">Teampl</td>
			</tr>

			<tr>
				<td class="center">대표</td>
				<td class="left">안상욱</td>
			</tr>

			<tr>
				<td class="center">설립일</td>
				<td class="left">2014. 07. 04</td>
			</tr>

			<tr>
				<td class="center">자본금</td>
				<td class="left">1억</td>
			</tr>

			<tr>
				<td class="center">임직원수</td>
				<td class="left">9명</td>
			</tr>

			<tr>
				<td class="center">주소</td>
				<td class="left">서울시 영등포구 은행로 11, 5층~6층(여의동,일신빌딩)</td>
			</tr>



		</table>


		<div id="vi">

			<font size="+1"><b>비전</b></font> <br> <img
				src="../images/vision.png" />

		</div>



	</div>
	
	</div>
	<br />

	<%@ include file="/base/footer.jsp"%>



	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</body>


</html>