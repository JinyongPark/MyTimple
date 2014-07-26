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

import visang.timple.dao.NoticeDAO;
import visang.timple.model.NoticeDTO;

@Controller("NoticeController")
public class NoticeController {

	// DAO 생성
	@Resource(name = "NoticeDaoImpl")
	// 서비스 이름 가져오기
	private NoticeDAO dao;

	// 공지사항 게시판 리스트 불러오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/help/NoticeList.vs")
	public String list(HttpServletRequest req, HttpSession session) {
		
		if (session.getAttribute("loginSeq") == null) {
			String memSeq = String.valueOf(session.getAttribute("loginSeq").toString());
			
			req.setAttribute("memSeq", memSeq);		
			
			// 1. 게시판 리스트 출력

			// 2. 페이징 처리
			int totalCount = 0; // 총 게시물 수
			int totalPage = 0; // 총 페이지 수
			int pageSize = 15; // 한 페이지 게시물 수
			int nowPage = 0; // 현재 페이지
			int temp2 = 0, loop = 0;

			// 2.1
			// NoticeList.vs?page=1 치환
			// NoticeList.vs?page=5 : 5페이지
			if (req.getParameter("page") == null) // 페이지 표시가 없으면 현재 페이지 1
				nowPage = 1;
			else
				nowPage = Integer.parseInt(req.getParameter("page")); // 현재 페이지 표시

			req.setAttribute("nowPage", nowPage);

			// nowPage와 pageSize를 가지고 페이징 범위 계산(rNum의 조건으로 사용할 범위)
			int start = ((nowPage - 1) * pageSize) + 1; // 페이지 별 게시물 시작번호
			int end = start + pageSize - 1; // 페이지 별 게시물 끝번호

			ArrayList<Object> list = null;
			
			boolean search = false; // 검색 플래그
			
			String cKind = req.getParameter("content"); // 게시물 검색 내용 종류
			String content = req.getParameter("txtSearch"); // 검색 키워드
			
			if(cKind != null && content != null) search = true;

				
			if(search == true) {
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				if(cKind.equals("제목+내용")) {
					
					// 제목 + 내용 검색

					map.put("content", content);
					map.put("start", String.valueOf(start));
					map.put("end", String.valueOf(end));
					
					ArrayList<Object> list2 = dao.searchAll(map);
					
					list = list2;
					
				} else if(cKind.equals("제목")) {
					
					// 제목 검색
					
					map.put("content", content);
					map.put("start", String.valueOf(start));
					map.put("end", String.valueOf(end));
					
					ArrayList<Object> list2 = dao.searchSubject(map);
					
					list = list2;
					
				} else if(cKind.equals("내용")) {
					
					// 내용 검색
					
					map.put("content", content);
					map.put("start", String.valueOf(start));
					map.put("end", String.valueOf(end));
					
					ArrayList<Object> list2 = dao.searchContent(map);
					
					list = list2;
					
				}
				
			} else {
				
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("start", start);
				map.put("end", end);
							
				list = dao.list(map);
				
			}
			
			// 글자수 자르기
			for(int i=0; i<list.size(); i++) {
				
				if(((NoticeDTO)list.get(i)).getSubject().length() > 90) {
					
					String temp = ((NoticeDTO)list.get(i)).getSubject().substring(0,90) + "...";
					
					// 잘라낸 제목을 덮어쓰기
					((NoticeDTO)list.get(i)).setSubject(temp);
				}
				
				Calendar now = Calendar.getInstance();
				
				Date regDate = ((NoticeDTO)list.get(i)).getRegDate();
				
				long span = now.getTime().getTime() - regDate.getTime();//글쓰고 난뒤 흘러간 시간..
				
				if ((span / 1000 / 60 / 60) < 24) {
					//최신글..
					((NoticeDTO)list.get(i)).setNewImg("<img src='/bbs/bbs_Image/new.gif' />");				
				}
				
				//c. 제목, 이름에 태그 사용 불가
				((NoticeDTO)list.get(i)).setSubject(((NoticeDTO)list.get(i)).getSubject().replace("<", "&lt").replace(">", "&gt;"));
				
			}
			
			req.setAttribute("list", list);

			// 2.2
			// 페이징 -> 페이지 바(페이지 이동 수단)
			// a. 총 게시물 수 - total
			// b. 총 페이지 수 - pages
			Object pList = dao.pList(pageSize);

			NoticeDTO bdto = (NoticeDTO) pList;

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
			if (temp2 == 1) {
				// 현재 페이지가 첫번재 블럭이냐?
				pageBar += String.format("[ 이전 %d 페이지 ]", blockSize);
			} else {
				// 반대 - 앞에 넘어갈 페이지가 있는 경우
				pageBar += String.format("<a href='/help/NoticeList.vs?page=%d'>[이전 %d 페이지]</a>", (temp2 - 1), blockSize);
			}

			while (!(loop > blockSize || temp2 > totalPage)) {

				if (temp2 == nowPage) { // 현재 페이지 강조
					pageBar += String.format(" <b>%d</b> ", temp2);
				} else { // 다른 페이지
					pageBar += String.format(" <a href='/help/NoticeList.vs?page=%d'>%d</a> ", temp2, temp2);
				}

				loop++;
				temp2++;
			}

			// 다음 10페이지
			if (temp2 > totalPage) {
				// 마지막 블럭에 속한 페이지
				pageBar += String.format("[ 다음 %d 페이지 ]", blockSize);
			} else {
				// 마지막 블록에 속하지 않는 페이지
				pageBar += String.format("<a href='/help/NoticeList.vs?page=%d'>[ 다음  %d 페이지 ]</a>", temp2, blockSize);
			}

			// 2. 페이징
			req.setAttribute("pageBar", pageBar); // 페이징 부분 태그 추가

		}
		
		return "/help/NoticeList.jsp";

	}
	
	// 게시판 글내용 확인
	@RequestMapping(method={RequestMethod.GET}, value="/help/NoticeView.vs")
	public String view(HttpServletRequest req, HttpSession session) {
		
		String noticeId = req.getParameter("noticeId");
		String memSeq = String.valueOf(session.getAttribute("loginSeq").toString());
		
		Object dto = dao.view(noticeId);
		
		req.setAttribute("dto", dto);
		req.setAttribute("memSeq", memSeq);
		
		return "/help/NoticeView.jsp";
		
	}
	
	// 게시판 글쓰기 페이지 요청
	@RequestMapping(value="/help/NoticeWriter.vs", method={RequestMethod.GET})
	public String write(){
		// 페이지 요청
		return "/help/NoticeWriter.jsp";
	}
	
	// 게시판 글쓰기 완료 페이지
	@RequestMapping(value="/help/NoticeWriterOk.vs", method={RequestMethod.POST})
	public String writeOk(HttpServletRequest req, HttpSession session) {
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		
		dao.write(map);
				
		return "/help/NoticeWriterOk.jsp";
	}
	
	// 글 삭제
	@RequestMapping(value="/help/NoticeDel.vs", method={RequestMethod.GET})
	public String del(HttpServletRequest req) {
		
		String noticeId = req.getParameter("noticeId");
		
		dao.del(noticeId);
		
		return "/help/NoticeDel.jsp";
	}
	
	// 게시판 글 수정 ( 내용 불러오기 )
	@RequestMapping(value="/help/NoticeUpdate.vs", method={RequestMethod.GET})
	public String update(HttpServletRequest req) {
		
		String noticeId = req.getParameter("noticeId");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("noticeId", noticeId);
			
		NoticeDTO dto = (NoticeDTO) dao.nUpdateSel(map);

		req.setAttribute("dto", dto);
		
		return "/help/NoticeUpdate.jsp";
	}
	
	// 게시판 글 수정 쿼리작업 및 완료
	@RequestMapping(value="/help/NoticeUpdateOk.vs", method={RequestMethod.POST})
	public String updateOk(HttpServletRequest req) {
	
		String noticeId = req.getParameter("noticeId");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
				
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("noticeId", noticeId);
		map.put("subject", subject);
		map.put("content", content);
			
		dao.nUpdate(map);
		
		req.setAttribute("noticeId", noticeId);
		
		return "/help/NoticeUpdateOk.jsp";
		
	}
	
	
	
	
	
	
	
	

}
































