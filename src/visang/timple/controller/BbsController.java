package visang.timple.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.dao.BbsDAO;
import visang.timple.model.BbsDTO;

@Controller("BbsController")
public class BbsController {
	// 모든 브라우저 요청 받아서 DAO 처리하는 클래스
	
	// DAO 만들기
	@Resource(name="BbsDaoImpl") // 서비스 이름 가져오기
	private BbsDAO dao;
	
	// 게시판 리스트 불러오기
	@RequestMapping(value="/bbs/BbsList.vs", method={RequestMethod.GET})
	public String list(HttpServletRequest req, HttpSession session) {
		
		// 1. 게시판 리스트 출력
		ArrayList<Object> list1 = dao.list1(); // 공지 3개
		ArrayList<Object> list2 = dao.list2(); // 추천 3개
		// ArrayList<Object> list3 = dao.list3(); // 전체 
		
		// 제목 글자수 자르기
		for(int i=0; i<list1.size(); i++) {
			
			if(((BbsDTO)list1.get(i)).getSubject().length() > 90) {
				
				String temp = ((BbsDTO)list1.get(i)).getSubject().substring(0,90) + "...";
				
				// 잘라낸 제목을 덮어쓰기
				((BbsDTO)list1.get(i)).setSubject(temp);
			}
			
			if(((BbsDTO)list2.get(i)).getSubject().length() > 90) {
				
				String temp = ((BbsDTO)list2.get(i)).getSubject().substring(0,90) + "...";
				
				// 잘라낸 제목을 덮어쓰기
				((BbsDTO)list2.get(i)).setSubject(temp);
			}
			
			// 최신글 표시
			Date regDate = ((BbsDTO)list1.get(i)).getRegDate();
			
			Calendar now = Calendar.getInstance();
			long span = now.getTime().getTime() - regDate.getTime();//글쓰고 난뒤 흘러간 시간..
			
			if ((span / 1000 / 60 / 60) < 24) {
				//최신글..
				((BbsDTO)list1.get(i)).setNewImg("<img src='/bbs/bbs_Image/new.gif' />");				
			}
			
			Date regDate2 = ((BbsDTO)list2.get(i)).getRegDate();
			
			long span2 = now.getTime().getTime() - regDate2.getTime();//글쓰고 난뒤 흘러간 시간..
			
			if ((span2 / 1000 / 60 / 60) < 24) {
				//최신글..
				((BbsDTO)list2.get(i)).setNewImg("<img src='/bbs/bbs_Image/new.gif' />");				
			}
			
			//c. 제목, 이름에 태그 사용 불가
			((BbsDTO)list1.get(i)).setSubject(((BbsDTO)list1.get(i)).getSubject().replace("<", "&lt").replace(">", "&gt;"));
			
			((BbsDTO)list2.get(i)).setSubject(((BbsDTO)list2.get(i)).getSubject().replace("<", "&lt").replace(">", "&gt;"));
			
		}

		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		// req.setAttribute("list3", list3);
		
		// 2. 페이징 처리
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0;  // 총 페이지 수
		int pageSize = 15;   // 한 페이지 게시물 수
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
		
		ArrayList<Object> list4 = null;
		
		/** ************* 검 색 **************** **/
		// BbsList.vs : 모든 목록
		// BbsList.vs?col=name&word=홍길동 : 검색
		
		boolean search = false; // 검색 플래그
		
		String post_type = req.getParameter("genre"); // 게시물 종류
		//if(post_type.equals("자유")) post_type = "일반";
		
		String cKind = req.getParameter("content");   // 게시물 검색 내용 종류
		String content = req.getParameter("txtSearch"); // 검색 키워드
		
		if(post_type != null && cKind != null && content!=null) {
			search = true;
		}
		
		if(search == true) {
			// 검색하기
			HashMap<String, String> map2 = new HashMap<String, String>();
			
			if(post_type.equals("전체")){
				
				if(cKind.equals("전체")) {
					// 전체 검색
					map2.put("post_type", post_type);
					map2.put("cKind", cKind);
					map2.put("content", content);
					map2.put("start", String.valueOf(start));
					map2.put("end", String.valueOf(end));
				
					list4 = dao.searchAll2(map2);	
				} else {
					// 부분 검색
					map2.put("post_type", post_type);
					map2.put("cKind", cKind);
					map2.put("content", content);
					map2.put("start", String.valueOf(start));
					map2.put("end", String.valueOf(end));
					
					if(cKind.equals("작성자")) list4=dao.searchName2(map2);
					else if(cKind.equals("내용")) list4=dao.searchSubject2(map2);
					else if(cKind.equals("제목")) list4=dao.searchContent2(map2);
				}
				
				
			} else {
			
				if(cKind.equals("전체")) {
					// 전체 검색
					map2.put("post_type", post_type);
					map2.put("cKind", cKind);
					map2.put("content", content);
					map2.put("start", String.valueOf(start));
					map2.put("end", String.valueOf(end));
				
					list4 = dao.searchAll(map2);	
				} else {
					// 부분 검색
					map2.put("post_type", post_type);
					map2.put("cKind", cKind);
					map2.put("content", content);
					map2.put("start", String.valueOf(start));
					map2.put("end", String.valueOf(end));
					
					if(cKind.equals("작성자")) list4=dao.searchName(map2);
					else if(cKind.equals("내용")) list4=dao.searchSubject(map2);
					else if(cKind.equals("제목")) list4=dao.searchContent(map2);
				}
			}
			
		} else {
			
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		list4 = dao.list4(map); // 전체 - 페이징
		
		}
		
		// 글자수 자르기
		for(int i=0; i<list4.size(); i++) {
			
			if(((BbsDTO)list4.get(i)).getSubject().length() > 90) {
				
				String temp = ((BbsDTO)list4.get(i)).getSubject().substring(0,90) + "...";
				
				// 잘라낸 제목을 덮어쓰기
				((BbsDTO)list4.get(i)).setSubject(temp);
			}
			
			Calendar now = Calendar.getInstance();
			
			Date regDate4 = ((BbsDTO)list4.get(i)).getRegDate();
			
			long span4 = now.getTime().getTime() - regDate4.getTime();//글쓰고 난뒤 흘러간 시간..
			
			if ((span4 / 1000 / 60 / 60) < 24) {
				//최신글..
				((BbsDTO)list4.get(i)).setNewImg("<img src='/bbs/bbs_Image/new.gif' />");				
			}
			
			//c. 제목, 이름에 태그 사용 불가
			((BbsDTO)list4.get(i)).setSubject(((BbsDTO)list4.get(i)).getSubject().replace("<", "&lt").replace(">", "&gt;"));
			
		}
		
		req.setAttribute("list4", list4);
		
		// 2.2
		// 페이징 -> 페이지 바(페이지 이동 수단)
		// a. 총 게시물 수 - total
		// b. 총 페이지 수 - pages
		Object pList = dao.pList(pageSize); 

		BbsDTO bdto = (BbsDTO) pList;
		
		req.setAttribute("total", bdto.getTotal()); // 총 게시물 수
		req.setAttribute("pages", bdto.getPages()); // 총 페이지 수
		
		// 페이지 바에 들어갈 태그들 이곳에 작업
		String pageBar = "";
		
		int blockSize = 3; // 페이지 바의 페이지 갯수
		totalCount = bdto.getTotal();
		totalPage = bdto.getPages();
		
		loop = 1;
		temp2 = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호
		
		
		// 이전 10 페이지
		if(temp2 == 1) {
			// 현재 페이지가 첫번재 블럭이냐?
			// pageBar += String.format("[ 이전 %d 페이지 ]", blockSize);
		} else {
			// 반대 - 앞에 넘어갈 페이지가 있는 경우
			pageBar += String.format("<a href='/bbs/BbsList.vs?page=%d'>[이전 %d 페이지]</a>", (temp2 - 1), blockSize);
		}
		
		
		while(!(loop > blockSize || temp2 > totalPage)) {
			
			if(temp2 == nowPage) { // 현재 페이지 강조
				pageBar += String.format(" <b>%d</b> ", temp2);
			} else { // 다른 페이지
				pageBar += String.format(" <a href='/bbs/BbsList.vs?page=%d'>%d</a> ", temp2, temp2);
			}
			
			loop++;
			temp2++;
		}
		
		
		// 다음 10페이지
		if(temp2 > totalPage) {
			// 마지막 블럭에 속한 페이지
			// pageBar += String.format("[ 다음 %d 페이지 ]", blockSize);
		} else {
			// 마지막 블록에 속하지 않는 페이지
			pageBar += String.format("<a href='/bbs/BbsList.vs?page=%d'>[ 다음  %d 페이지 ]</a>", temp2, blockSize);
		}
		
		
		// 2. 페이징
		req.setAttribute("pageBar", pageBar); // 페이징 부분 태그 추가
		
		return "/bbs/BbsList.jsp";
	}
	
	// 게시판 뷰 불러오기
	@RequestMapping(value="/bbs/BbsView.vs", method={RequestMethod.GET})
	public String view(HttpServletRequest req, HttpSession session) {
		
		// 게시물 번호
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		
		// 회원인지 관리자인지 구별
		String memSeq = session.getAttribute("loginSeq").toString();
		
		// 조회수 업글
		dao.bCountUp(boardId);
		
		Object dto = dao.view(boardId);
		ArrayList<Object> cList = dao.cList(boardId);
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("cList", cList);
		req.setAttribute("Id", memSeq);
		
		return "/bbs/BbsView.jsp";
	}
	
	@RequestMapping(value="/bbs/BbsWriter.vs", method={RequestMethod.GET})
	public String write(HttpSession session, HttpServletRequest req){
		// 페이지 요청
		String memSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("memSeq", memSeq);
		
		return "/bbs/BbsWriter.jsp";
	}
	
	@RequestMapping(value="/bbs/BbsWriterOk.vs", method={RequestMethod.POST})
	public String writeOk(HttpServletRequest req, HttpSession session) {
		
		String memSeq = session.getAttribute("loginSeq").toString();
		String name = session.getAttribute("loginName").toString();
		String genreSel = req.getParameter("genreSel");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memSeq", memSeq);
		map.put("name", name);
		map.put("genreSel", genreSel);
		map.put("subject", subject);
		map.put("content", content);
		
		dao.write(map);
				
		return "/bbs/BbsWriterOk.jsp";
	}
	
	// 글 삭제
	@RequestMapping(value="/bbs/BbsDel.vs", method={RequestMethod.GET})
	public String del(HttpServletRequest req) {
		
		String boardId = req.getParameter("boardId");
		
		ArrayList<Object> cList = dao.cList(Integer.valueOf(boardId));
		
		if(cList.size() != 0) {
			dao.delRef(boardId);
		}
		
		dao.del(boardId);
		
		return "/bbs/BbsDel.jsp";
	}
	
	// 글 추천
	@RequestMapping(value="/bbs/BbsRecom.vs", method={RequestMethod.GET})
	public String recom(HttpServletRequest req) {
		
		String boardId = req.getParameter("boardId");
		
		dao.recom(boardId);
		
		req.setAttribute("boardId", boardId);
		
		return "/bbs/BbsRecom.jsp";
	}
	
	// 댓글 달기
	@RequestMapping(value="/bbs/BbsComment.vs", method={RequestMethod.POST})
	public String comment(HttpServletRequest req, HttpSession session) {
		
		String memSeq = session.getAttribute("loginSeq").toString();
		String boardSeq = req.getParameter("boardId");
		String content = req.getParameter("content");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardSeq", boardSeq);
		map.put("content", content);
		map.put("memSeq", memSeq);		
		
		dao.comment(map);
		
		req.setAttribute("boardId", boardSeq);
		
		return "/bbs/BbsComment.jsp";
	}
	
	// 게시판 글 수정 ( 내용 불러오기 )
	@RequestMapping(value="/bbs/BbsUpdate.vs", method={RequestMethod.GET})
	public String update(HttpServletRequest req) {
		
		String boardId = req.getParameter("boardId");
		String memSeq = req.getParameter("memSeq");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("boardId", boardId);
		map.put("memSeq", memSeq);
			
		BbsDTO dto = (BbsDTO) dao.bUpdateSel(map);

		req.setAttribute("dto", dto);
		
		return "/bbs/BbsUpdate.jsp";
	}
	
	// 게시판 글 수정 쿼리작업 및 완료
	@RequestMapping(value="/bbs/BbsUpdateOk.vs", method={RequestMethod.POST})
	public String updateOk(HttpServletRequest req) {
	
		String boardId = req.getParameter("boardId");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String post_type = req.getParameter("genreSel");
		
				
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("boardId", boardId);
		map.put("subject", subject);
		map.put("content", content);
		map.put("post_type", post_type);
			
		dao.bUpdate(map);
		
		req.setAttribute("boardId", boardId);
		
		return "/bbs/BbsUpdateOk.jsp";
		
	}
	
	// 댓글 삭제
	@RequestMapping(value="/bbs/BbsCommentDel.vs", method={RequestMethod.GET})
	public String commentDel(HttpServletRequest req) {
		
		String boardId = req.getParameter("boardId");
		String commentId = req.getParameter("commentId");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardId", boardId);
		map.put("commentId", commentId);
		
		dao.bCommentDel(map);
		
		req.setAttribute("boardId", boardId);
		
		return "/bbs/BbsCommentDelOk.jsp";
	}
	
		
	
}


















