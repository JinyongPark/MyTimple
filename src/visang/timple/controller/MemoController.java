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
import visang.timple.interfaces.MemoDAO;
import visang.timple.model.MemoDTO;

@Controller("MemoController")
public class MemoController {

	@Resource(name = "MemoDAO")
	private MemoDAO dao;

	@Resource(name = "projectDAO")
	private IProject pdao;
	
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/team/TeamMemo.vs")
	public String Memo(MemoDTO mdto,HttpServletRequest request, HttpSession session) {
	    String project = (String) session.getAttribute("seq").toString();
	    mdto.setProjectseq(project);

	    
	    
	    String title = pdao.title(project);
		
		request.setAttribute("title", title);
		
	    	   	  	    
	    String user = (String) session.getAttribute("loginName");
	    request.setAttribute("user", user);

	    String mem = (String) session.getAttribute("loginSeq").toString();
	    request.setAttribute("mem", mem);	    
	    
	    System.out.println("값 들어간지 확인하기 ㅇㅇㅇㅇㅇㅇㅇ" + user);
	    System.out.println("값 들어간지 확인하기 ㅇㅇㅇㅇㅇㅇㅇ" + mem);
	    System.out.println("값 들어간지 확인하기 ㅇㅇㅇㅇㅇㅇㅇ" + project);
	    
		// 페이징 처리
		int totalCount = 0; // 총 게시물수
		int totalPage = 0; // 총페이지수
		int pageSize = 7; // 한페이지 출력 게시물수
		int temp2 = 0, loop = 0;
		int nowPage = 0; // 현재페이지

		if (request.getParameter("page") == null) {
			nowPage = 1;

		} else {

			nowPage = Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("nowPage", nowPage);

		// nowPage와 pageSize 를 가지고 페이징 범위 계산 (rnum의 조건으로 사용할 범위)
		int start = ((nowPage - 1) * pageSize);
		int end = start + pageSize - 1;
		

		mdto.getMent();
		mdto.setStart(start);
		mdto.setEnd(end);
	
		// 페이징 -> 페이지 바에 관련된 작업

		// 1. 총 게시물 수
		// 2. 총 페이지 수
		mdto.setPagesize(pageSize);
		
		ArrayList<Object> list = dao.rowlist(mdto); // 리스트 구하기
		mdto = dao.getPage(mdto); // 페이지수 구하기

		int pages = mdto.getCeil();
		int total = mdto.getTotal();

		
		request.setAttribute("total", total);
		request.setAttribute("pages", pages);
		

		// 페이지바에 들어갈 태그들을 이곳에 작업
		String pageBar = "";

		int blockSize = 10; // 페이지바의 페이지 제한갯수
		totalCount = mdto.getTotal();
		totalPage = mdto.getCeil();

		loop = 1;
		temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

		// 이전 10 페이지
		if (temp2 == 1) {
			// 현재 페이지가 첫번째 블럭이냐 ?
			pageBar += String
					.format("<img src='../team/img/left.JPG' alt='이전'"
							+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/>",
							blockSize);
		} else {
			// 반대
			pageBar += String
					.format("<a href='../team/TeamMemo.vs?"
							+ "page=%d'><img src='../team/img/left.JPG' alt='이전'"
							+ " style='cursor: pointer; width: 10px; height:10px; padding-right: 10px;'/></a>",
							(temp2 - 1), blockSize);
		}

		while (!(loop > blockSize || temp2 > totalPage)) {
			if (temp2 == nowPage) { // 현재 페이지
				pageBar += String
						.format("<b style='color: red;'>&nbsp;&nbsp; %d &nbsp; &nbsp;</b>",
								temp2);
			} else { // 다른 페이지
				pageBar += String.format(
						"<a href='../team/TeamMemo.vs?page=%d'>%d</a>", temp2,
						temp2);
			}
			loop++;
			temp2++;
		}

		// 다음 10 페이지
		if (temp2 > totalPage) {
			// 마지막 블럭에 속한 페이지(끝페이지)
			pageBar += String
					.format("<img src='../team/img/right.JPG' alt='다음'"
							+ " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/>",
							blockSize);
		} else {
			// 마지막 블럭에 속하지 않은 페이지
			pageBar += String
					.format("<a href='../team/TeamMemo.vs?"
							+ "page=%d'><img src='../team/img/right.JPG' alt='다음'"
							+ " style='cursor: pointer; width: 10px; height:10px; padding-left: 10px;'/></a>",
							temp2, blockSize);
		}

		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pageBar", pageBar);
	
		request.setAttribute("list", list);
		
		return "/team/TeamMemo.jsp";
	}
	
	@RequestMapping(value="/writeMemo.vs", method=RequestMethod.POST)
	public String writeMemo(HttpServletRequest req, @RequestParam String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memseq", req.getSession().getAttribute("loginSeq").toString());
		map.put("content", content);
		
		int result = dao.writeMemo(map);
		
		req.setAttribute("code", result);
		return "/mypage/unFriendOk.jsp";
	}
	
	@RequestMapping(value="/deleteMemo.vs", method=RequestMethod.POST)
	public String deleteMemo(HttpServletRequest req, @RequestParam String memoid){
		
		int result = dao.deleteMemo(memoid);
		req.setAttribute("code", result);
		return "/mypage/unFriendOk.jsp";
	}
}