package visang.timple.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.interfaces.IProject;
import visang.timple.interfaces.TelDAO;
import visang.timple.model.TelDTO;

@Controller("telController")
public class TelController {

	@Resource(name = "TelDAO")
	private TelDAO dao;

	
	@Resource(name = "projectDAO")
	private IProject pdao;
	
	
	// 일반 리스트 출력
	@RequestMapping(method = { RequestMethod.GET }, value = "/team/TeamTel.vs")
	public String selTel(TelDTO tdto, HttpServletRequest request, HttpSession session) {
		ArrayList<Object> list = null;
		
	// 페이징 처리
    int totalCount = 0; // 총 게시물수 
    int totalPage = 0; // 총페이지수
    int pageSize = 25; // 한페이지 출력 게시물수
    int temp2 = 0, loop = 0;
    int nowPage = 0;  // 현재페이지 
    
    tdto.setMemseq(session.getAttribute("loginSeq").toString()); // 세션 멤버 번호
    String project = (String) session.getAttribute("seq");
    tdto.setProjectseq(project);
    
    
    
    String title = pdao.title(project);
	
	request.setAttribute("title", title);
	
	String mseq = session.getAttribute("loginSeq").toString();

    
    
    
    String two = dao.grade(tdto); // 팀장인지 ? 아닌지 ?
    // 팀장 확인
    String one = dao.Team(tdto);
    
    request.setAttribute("two", two);
    request.setAttribute("one", one);
    System.out.println("팀장 ㅇㅇㅇㅇㅇㅇㅇㅇㅇ확인" + one);
    
    
    
    
    
    if (request.getParameter("page") == null){
         nowPage = 1;
         
      }else{
    	 
         nowPage = Integer.parseInt(request.getParameter("page"));
         
      }   
    request.setAttribute("nowPage", nowPage);
      
    // nowPage와 pageSize 를 가지고 페이징 범위 계산 (rnum의 조건으로 사용할 범위)
    int start = ((nowPage - 1) * pageSize);
    int end = start + pageSize -1;	  
 
    tdto.setStart(start); // 1
    tdto.setEnd(end); // 10
  
    String sort = tdto.getSort();
    String word = tdto.getWord();
    String num = tdto.getNum();
    
    request.setAttribute("mseq", mseq);
  	request.setAttribute("word", tdto.getWord());
  	request.setAttribute("sort", tdto.getSort());
  	request.setAttribute("num", tdto.getNum());  	
  	
    // 페이징 -> 페이지 바에 관련된 작업
	      
      // 1. 총 게시물 수
      // 2. 총 페이지 수
    tdto.setPagesize(pageSize);
    
    if (num == null) { // 초기 리스트
 		list = dao.rowlist(tdto);
 		tdto  = dao.getPage(tdto); // 페이지수 구하기 일반
 	  	
 	  } else if (num.equals("0")) {
 	
 	  	if (word.equals("null") && sort.equals("null")) { // 정렬
 	  		list = dao.list2(tdto);
 	  		tdto  = dao.getPage2(tdto); // 페이지수 구하기 정렬용
 	  	
 	  	} else {
 	  		list = dao.list3(tdto); // 검색
 	  		tdto  = dao.getPage3(tdto); // 페이지수 구하기 검색용

 	  	}
 	  } else if (num.equals("1")) {
 	  	if (word.equals("null") && sort.equals("null")) { // 정렬
 	  		list = dao.rowlist(tdto);
 	  		tdto  = dao.getPage(tdto); // 페이지수 구하기 일반
 	  		
 	  	} else {
 	  		list = dao.list3(tdto); // 검색
 	  		tdto  = dao.getPage3(tdto); // 페이지수 구하기 검색용

 	  	}
 	  } else {
 	  	
 	  }      
    
    
    int pages = tdto.getCeil();
    int total = tdto.getTotal();
    //String memberid = tdto.getMemberId(); 슈발 안받아 오잖아
    request.setAttribute("list", list);
    request.setAttribute("total", total);
    request.setAttribute("pages", pages);
   
      // 페이지바에 들어갈 태그들을 이곳에 작업
      String pageBar = "";
            
      int blockSize = 10; // 페이지바의 페이지 제한갯수
      totalCount = tdto.getTotal();
      totalPage = tdto.getCeil();
 
      loop = 1;
      temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

      // 이전 10 페이지
      if (temp2 == 1) { 
         // 현재 페이지가 첫번째 블럭이냐 ?
         pageBar += String.format("<img src='../team/img/left.JPG' alt='이전'"
         + " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/>", blockSize);
      } else {
         // 반대
         pageBar += String.format("<a href='../team/TeamTel.vs?"
         + "page=%d'><img src='../team/img/left.JPG' alt='이전'"
         + " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/></a>", (temp2-1), blockSize);         
      }
            
      while (!(loop > blockSize || temp2 > totalPage)) {
         if (temp2 == nowPage) { // 현재 페이지
            pageBar += String.format("<b style='color: red;'>&nbsp;&nbsp; %d &nbsp; &nbsp;</b>", temp2);
         } else { // 다른 페이지
        	 
        	 if (num == null && sort == null && word == null)
        		 pageBar += String.format("<a href='../team/TeamTel.vs?page=%d'>%d</a>", temp2, temp2);
        	 else
        		 pageBar += String.format("<a href='../team/TeamTel.vs?page=%d"
            		+ "&num="+ num +"&sort="+ sort +"&word="+ word +"'>%d</a>", temp2, temp2);
         }
         loop++;
         temp2++;
      }
            
      // 다음 10 페이지
      if (temp2 > totalPage) {
         // 마지막 블럭에 속한 페이지(끝페이지)
         pageBar += String.format("<img src='../team/img/right.JPG' alt='다음'"
         + " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/>", blockSize);
      } else {
         // 마지막 블럭에 속하지 않은 페이지
         pageBar += String.format("<a href='../team/TeamTel.vs?"
               + "page=%d&&num="+ num +"&sort="+ sort +"&word="+ word +"'>"
               		+ "<img src='../team/img/right.JPG' alt='다음'"
         + " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/>"
         + "</a>", temp2, blockSize);
      }
       
      	request.setAttribute("nowPage", nowPage);
      	request.setAttribute("pageBar", pageBar);

		request.setAttribute("list", list);

		return "/team/TeamTel.jsp";
	} // 1 method

	
	
	
	
	
	
	// 등록 및 수정 삭제
	@RequestMapping(method = { RequestMethod.POST }, value = "/team/TeamTel.vs")
	public String insertTeam(TelDTO tdto, HttpServletRequest request, HttpSession session) {
	
	    String projectseq = (String) session.getAttribute("seq");
	    tdto.setProjectseq(projectseq);
		
		String check = "";
		String checkpass = "";
		String ment = "";
/*--------------------------------------인원등록--------------------------------------------------*/		

		String who = dao.who(tdto.getName()); // 회원 번호 구하기
		if (who != null) {
			tdto.setMemseq(who);
	
		} else {
			ment = "5";
		}
		check = dao.check(tdto.getMemseq(), projectseq); // 팀원에 있는지 확인

		if (check.equals("0")) {
			dao.addMember(who, projectseq); // 회원 프로젝트 참여
			ment = "1";
		} else {
			ment = "0";			
		}
/*--------------------------------------인원등록--------------------------------------------------*/		

		
/*--------------------------------------수정삭제--------------------------------------------------*/		
		System.out.println("숫자 확인 ㅇㅇㅇㅇㅇㅇ" + tdto.getQuest());
		System.out.println("숫자 확인 ㅇㅇㅇㅇㅇㅇ" + tdto.getFixmem());
		System.out.println("숫자 확인 ㅇㅇㅇㅇㅇㅇ" + tdto.getFixpw());
		
		System.out.println();
		
		
		// 수정 및 삭제
		if (tdto.getQuest().equals("1")) {
			// 수정
			checkpass =	dao.passcheck(tdto.getFixmem(),tdto.getFixpw()); // 암호확인
			System.out.println("암호 체크  ㅇㅇㅇㅇㅇㅇㅇㅇㅇ확인" + checkpass);
			if (checkpass.equals("1")) {
				
				String fix = dao.fixMember(tdto);
				
				ment = "2";
							
			} else {
				ment = "4";
			}
		} else if (tdto.getQuest().equals("2")) {
			// 삭제
			String team = session.getAttribute("loginSeq").toString(); 
			
			System.out.println("팀 번호 확인 :" + team);
			
			checkpass =	dao.passcheck2(tdto.getPw(),team); // 암호확인
			System.out.println("암호체크 확인 :" + checkpass);
			if (checkpass.equals("1")) {
				dao.delMember(tdto.getMemberId()); // 삭제
				
				dao.news(tdto.getTeamid()); // 프로젝트 알림
				ment = "3";
							
			} else {
				ment = "4";
			}
			
		} else {
			
		}
			
		request.setAttribute("ment", ment);

		return "../team/TeamTelPost.jsp";
	}

} // main
