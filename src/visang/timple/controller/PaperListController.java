package visang.timple.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.dao.PaperListDAO;
import visang.timple.interfaces.IPaperList;
import visang.timple.model.PaperListDTO2;

@Controller("PaperListController")
public class PaperListController {
	// 모든 브라우저 요청 받아서 DAO 처리하는 클래스
	
	// DAO 만들기
	
	@Resource(name="PaperListSV") // 서비스 이름 가져오기
	private IPaperList dao;
	
	// 게시판 리스트 불러오기
	@RequestMapping(value="/Paper/PaperList.vs", method={RequestMethod.GET})
	public String list(HttpServletRequest req, HttpSession session) {
		
		// 1. 게시판 리스트 출력
		String memberId = session.getAttribute("loginSeq").toString();

		// 2. 페이징 처리
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0;  // 총 페이지 수
		int pageSize = 10;   // 한 페이지 게시물 수
		int nowPage = 0;    // 현재 페이지
		int temp2 = 0, loop=0;
		
		// 2.1 
		// BbsList.vs?page=1 치환
		// BbsList.vs?page=5 : 5페이지
		if(req.getParameter("page") == null) // 페이지 표시가 없으면 현재 페이지 1
			nowPage = 1;
		else
			nowPage = Integer.parseInt(req.getParameter("page")); // 현재 페이지 표시
		
		req.setAttribute("nowPage", nowPage);
		
		// nowPage와 pageSize를 가지고 페이징 범위 계산(rNum의 조건으로 사용할 범위)
		int start = ((nowPage - 1) * pageSize) + 1; // 페이지 별 게시물 시작번호
		int end = start + pageSize - 1;             // 페이지 별 게시물 끝번호
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("memberId", memberId);
		
		List<PaperListDTO2> paper = dao.getPaperListPerOnePage(map); // 한페이지에 출력될 게시물들
		
		req.setAttribute("paper", paper);
		
		// 2.2
		// 페이징 -> 페이지 바(페이지 이동 수단)
		// a. 총 게시물 수 - total
		// b. 총 페이지 수 - pages
		HashMap<String, Integer> pList = dao.pageBar(memberId); 
		
		// System.out.println("총 게시물 수" + bdto.getTotal() + " 총 페이지 수 : " + bdto.getPages());
		
		int blockSize = 10; // 페이지 바의 페이지 갯수
		System.out.println("test : " + pList.keySet().toString());
		totalCount = pList.get("total");
		totalPage = pList.get("pages");
		
		req.setAttribute("total", totalCount);
		req.setAttribute("pages", totalPage);
		
		// 페이지 바에 들어갈 태그들 이곳에 작업
		String pageBar = "";
		
		loop = 1;
		temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호
		
		
		// 이전 10 페이지
		if(temp2 == 1) {
			// 현재 페이지가 첫번재 블럭이냐?
			pageBar += String.format("[ 이전 %d 페이지 ]", blockSize);
		} else {
			// 반대 - 앞에 넘어갈 페이지가 없는 경우
			pageBar += String.format("<a href='/PaperList.vs?page=%d>[이전 %d 페이지]</a>", (temp2 - 1), blockSize);
		}
		
		while(!(loop > blockSize || temp2 > totalPage)) {
			
			if(temp2 == nowPage) { // 현재 페이지 강조
				pageBar += String.format(" <b>%d</b> ", temp2);
			} else { // 다른 페이지
				pageBar += String.format(" <a href=/PaperList.vs?page=%d>%d</a> ", temp2, temp2);
			}
			
			loop++;
			temp2++;
		}
		
		
		// 다음 10페이지
		if(temp2 > totalPage) {
			// 마지막 블럭에 속한 페이지
			pageBar += String.format("[ 다음 %d 페이지 ]", blockSize);
		} else {
			// 마지막 블록에 속하지 않는 페이지
			pageBar += String.format("<a href='/PaperList.vs?page=%d>[ 다음  %d 페이지 ]</a>", temp2, blockSize);
		}
		
		
		// 2. 페이징
		req.setAttribute("pageBar", pageBar); // 페이징 부분 태그 추가
		
		return "/Paper/PaperList.jsp";
	}
	
	@RequestMapping(value="/Paper/PaperDelete.vs", method=RequestMethod.POST)
	public String PaperDelete(HttpServletRequest req, @RequestParam String paperid) {
		
		String[] paperids = paperid.split(",");
		
		int result = dao.deletePapers(paperids);
		req.setAttribute("code", result);
		return "/mypage/unFriendOk.jsp";
	}
}