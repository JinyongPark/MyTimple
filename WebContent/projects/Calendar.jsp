<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="visang.timple.model.ProjectCalendarDTO" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.*"%>

<%
ArrayList<ProjectCalendarDTO> list= new ArrayList<ProjectCalendarDTO>();

list =(ArrayList<ProjectCalendarDTO>)request.getAttribute("list");

String grade = list.get(0).getGrade();

if(grade==null){
	
	grade ="";
	
}else if(grade.equals("1")){
	
	grade = "등급: 팀장 ";
	
}else if(grade.equals("2")){
	
	grade = "등급: 팀원  ";	
}

//System.out.println(grade);

%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='/lib/fullcalendar.css' rel='stylesheet' />
<link href='/lib/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="/js/vendor/modernizr.js"></script>
<script src='/lib/moment.min.js'></script>
<script src='/lib/jquery.min.js'></script>
<script src='/lib/jquery-ui.custom.min.js'></script>
<script src='/lib/fullcalendar.min.js'></script>
<script src='/lib/lang-all.js'></script>

<script>
	var jb = jQuery.noConflict();
</script>




<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/timple.css" /> 
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/projectmain.css" />



<!-- Side Menu Script Start-->

<link rel="stylesheet" href="/css/sidemenu/layout.css" media="screen" />
<script>
	var ja = jQuery.noConflict();
</script>
<script src="/js/sidemenu/hideshow.js"></script>


<script src="/js/sidemenu/jquery.tablesorter.min.js"></script>
<script src="/js/sidemenu/jquery.equalHeight.js"></script>
<script src='/js/header.js'></script>


	
	
<script>
jb(document).ready(function() {
		
		var currentLangCode = 'ko';
		
		jb('#calendar').fullCalendar({
       	
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2014-07-21',	
			selectable: true,
			lang: currentLangCode,
			selectHelper: true,
		
			select: function(start, end) {
				
		    var startday = start.toString();
		            
		        startday.substring(11, 15); //년도
		      
		        var startdaymonth = startday.substring(4,7); // 월
		       
		        startday.substring(8, 10);  // 일
		       
		        
		        switch(startdaymonth){
		        
		        
		        case 'Jan':{
	        		
	        		startdaymonth = '01';
	        		break;
	        	};
	        	
	        	   
		        case 'Feb':{
	        		
	        		startdaymonth = '02';
	        		break;
	        	};
		        
		        
                case 'Mar':{
	        		
	        		startdaymonth = '03';
	        		break;
	        	};
		        
	            
                case 'Apr':{
	        		
	        		startdaymonth = '04';
	        		break;
	        	};
	        	
                case 'May':{
	        		
	        		startdaymonth = '05';
	        		break;
	        	};
	        	 
	        	
		         case 'Jun':{
		        		
		        	startdaymonth = '06';
		        	break;
		        	};
		        	
		         case 'Jul':{
		        		
		        		startdaymonth = '07';
		        		break;
		        	};
		        	
		          	
		         case 'Aug':{
		        		
		        		startdaymonth = '08';
		        		break;
		        	};	
		        	
		         case 'Sep':{
		        		
		        		startdaymonth = '09';
		        		break;
		        	};		
		        	
		        	
		         case 'Oct':{
		        		
		        		startdaymonth = '10';
		        		break;
		        	};	
		        	
		         case 'Nov':{
		        		
		        		startdaymonth = '11';
		        		break;
		        	};		
		        	
		        
		         case 'Dec':{
		        		
		        		startdaymonth = '12';
		        		break;
		        	};			
		        	
		        }
		        
		        	        	               
				jb('#startday').val(startday.substring(11,15) + '-' + startdaymonth + '-' + startday.substring(8, 10)  +" " + startday.substring(16,18) +":" + startday.substring(19, 21) + ":" +startday.substring(22,24)   );
				jb('#endday').val(startday.substring(11,15) + '-' + startdaymonth + '-' + startday.substring(8, 10)  +" " + startday.substring(16,18) +":" + startday.substring(19, 21) + ":" +startday.substring(22,24)   );				
				jb('#deleteday').val(startday.substring(11,15) + '-' + startdaymonth + '-' + startday.substring(8, 10)   );				

							
				
			},
			editable: false,
			events: [
			                  
                     <%  for(int i=0; i <list.size(); i++ ){       %>  
	         
			         
			         { 			        	 
			        	    title: '<%= list.get(i).getSubject() %>' ,
							start: '<%= list.get(i).getStartday() %>',		
							end:  '<%= list.get(i).getEndday() %>'		
							
			         },
			         
			         			         		       			         			            		         
			 		<%    }   %>  
			         		 			 																							
			        ]
				
		});
		
	});
	
	
	function transfer() {
		
		var form = document.forms[1];
		
		form.submit();
		
	}
	
	
</script>



<style>

body {
		margin: 0px auto;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
		z-index: 0;
		display:inline;
		
}

#calendar {

	    display: inline-block;
		width: 810px;
		margin-top: 0px;
		z-index: 0;
		position: relative;
        	
} 

#insert, #delete{

 background-color: Darkmagenta;   
 width: 100%;
 height: 35px;
 padding: 4px;
 
}	

.popupclose{

display: none; 
position: fixed; 
margin-left: 3px;
z-index: 3;

}

#close{


width: 20px;
height: 20px;

}
	
	
#startday, #endday, #plan, #subject, #deleteday{

z-index: 3;
position:relative;
width: 152px;
display: inline;
height: 23px;

}	


#subject {

width: 310px;
}

#day{

font-weight: bold;
color: white;

}

#sub{

color: white;
background-color: Darkmagenta;
}

input{

display: inline-block;


}

#msg1{
color: blue;
letter-spacing: 2px;
}

#del{
color: white;
}

#state{
height: 30px;
padding-top: 10px;
}

img{
height: 18px;
}

</style>


<title>달력</title>
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


<div id="title">
	<p>${title}</p>
</div> 
	



<script>
	var js = jQuery.noConflict();
</script>


<jsp:include page="/sidemenu.vs"></jsp:include>
 

<%-- <%@include file="/base/sidemenu.jsp"%>
 --%>
<div id='calendar'>

<div id="state">
현재 <span id="msg1"><%= session.getAttribute("loginName").toString() %></span>님의 일정 입니다.
<span id="msg1"><%= grade %></span> 
</div>
 
<c:forEach items="${list}" var="dto" begin ="1" end ="1">
	
<c:if test="${dto.grade == '1' }">			

<div id="insert">

<form method="GET" action="/CalendarInsert.vs"  >

<span id="day" >시작일</span>
<input type="text"  id="startday" name="startday"  >
<span id="day" >완료일</span>
<input type="text"  id="endday" name="endday"  >
<input type="text"  id="subject" name="subject"  placeholder = "일정을 입력해주세요"  size="43"   >
<input type="hidden" id="projectseq" name="projectseq"  value= "${dto.projectseq}"      >
<input type="submit" id="sub" value="등록"      >

</form>


</div>

</c:if>

</c:forEach>


<c:forEach items="${list}" var="dto" begin ="1" end ="1">
	

<c:if test="${dto.grade == '1' }">		


<div id="delete">

<form method="GET" action="/Calendardelete.vs"  >
<span id="day">취소하고자 하는 날짜를 선택 하십시오.    </span>
<input type="text"  id="deleteday" name="deleteday"  >
<input type="submit" id="sub" value="취소"      >
<input type="hidden" id="projectseq" name="projectseq"  value= "${dto.projectseq}"      >

</form>
</div>

</c:if>
</c:forEach>

</div>
	<%@ include file="/base/footer.jsp"%>
	<script src="/js/foundation.min.js"></script>
</c:if>
</body>



</html>