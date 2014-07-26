<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>프로젝트 상세 내용</title>
<link rel="stylesheet" href="/css/timple.css" />
<link rel="stylesheet" href="/css/common.css" />
<script src="/js/vendor/modernizr.js"></script>


<style type="text/css">


div#section {

	min-height: 800px;
	margin-left: -20px;
		
}

img{

width: 339px;
height: 317px;


}


#header{


height: 100px;
text-align:center;
margin-top: 40px;
font-size: 22px;

}


#content{


margin-left: 163px;
height: 370px;
width: 980px;
padding: 20px;


}

#detail{

margin-top: 20px;
width: 742px;
margin-left: 282px;
height: 370px;
opacity: 0.8;
margin-bottom: 30px;
border: 1px solid gray;
padding: 50px;
letter-spacing: 2px;
word-spacing: 3px;


}


#article{


border: 1px solid gray;
width: 342px;
height: 320px;
margin-left: 500px;
margin-top: -320px;
background-color: white;
padding: 20px;



}


#img{

border: 1px solid gray;
width: 342px;
height: 322px;
margin-left: 100px;


}


#startday ,#projectName, #teamCount, #send, #endday, #teamcnt{
margin: 30px;
font-weight: bold;





}


#send{

border: 1px solid gray;
width: 150px;
height: 40px;
box-shadow: 3px 7px 4px rgba(83, 83, 93, 0.28);
background-color: white;

}



#send1{

border: 1px solid gray;
width: 150px;
height: 40px;
box-shadow: 3px 7px 4px rgba(83, 83, 93, 0.28);
background-color: white;

}







.popupMemo{

display: none; 
position: fixed; 
margin: 140px 0 0 -335px;
padding: 20px;
width: 430px; height: 330px;
top: 150px; left: 50%;
border-radius: 8px; 
z-index: 1;
background-color: LemonChiffon;




}


.popupclose{

display: none; 
position: fixed; 
margin-left: 368px;


}

#close{


width: 20px;
height: 20px;

}


#msg{

height: 100px;

}


span{

font-weight: bold;

}


</style>


</head>

<body>
<c:if test="${empty loginSeq }">
		<script type="text/javascript">
			alert("로그인이 필요합니다. 로그인해주세요!!.");
			location.href("/login.jsp");
		</script>
	</c:if>
	<c:if test="${!empty loginSeq }">
		
<jsp:include page="/header.vs"></jsp:include>

<div id="section" >

<div id="header">

 <c:forEach items="${detail}" var="dto">

     ${dto.projectname}

</c:forEach>

</div>


<div id="content">


<div id="img"><c:forEach items="${detail}" var="dto"><img src="/images/${dto.twoseq}.jpg" /></c:forEach></div>


<div id="article">

<div id="startday" >시작일    :<c:forEach items="${detail}" var="dto">${dto.startday}</c:forEach></div>

<div id="endday"   > 완료일   :<c:forEach items="${detail}" var="dto">${dto.endday}</c:forEach></div>

<div id="projectName">프로젝트 팀장:<c:forEach items="${detail}" var="dto">${dto.name}</c:forEach></div>


<div id="teamcnt">팀원 수 :<c:forEach items="${cnt}" var="dto">${dto.teamcnt}</c:forEach></div>



</div>


</div>

<div id="detail">


<p><c:forEach items="${detail}" var="dto">${dto.content}</c:forEach></p>


</div>


</div>


<%@ include file="/base/footer.jsp"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/js/foundation.min.js"></script>

</c:if>
</body>


</html>