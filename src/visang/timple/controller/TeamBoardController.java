package visang.timple.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.interfaces.IProject;
import visang.timple.interfaces.ITeamBoard;
import visang.timple.model.TeamBoardDTO;
import visang.timple.model.TeamCommentDTO;
import visang.timple.model.TeamNoticeDTO;
import visang.timple.util.FileManager;

@Controller("TeamBoard")
public class TeamBoardController {
		
	@Resource(name="TBService")
	private ITeamBoard tdao;
		
	@Resource(name="fileManager")
	private FileManager fileManager;
	
	
	@Resource(name = "projectDAO")
	private IProject pdao;
	
	
	
	@RequestMapping(value="TeamBoard.vs", method=RequestMethod.GET)
	private String ExampleTeam(HttpServletRequest req, HttpSession session) {
		//teamseq 섹션에 담기
		String memSeq = session.getAttribute("loginSeq").toString();
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("memSeq", memSeq);
		map2.put("projectseq", projectseq);
		int teamseq = tdao.getteamseq(map2);
		session.setAttribute("teamseq", teamseq);
		//섹션 값 가져오기 int teamseq = (int)session.getAttribute("teamseq");
		
		//게시판 소트번호 가져오기(아 뭐 있단 소스가 다있냐? ㅋㅋㅋ)
		int teamBoardSortSeq = 0;
		if (req.getParameter("TeamBoardSortSeq") == null){
			String check = tdao.searchsortseq(projectseq);
			if(check == null){
				String a = tdao.madesort(projectseq);
				teamBoardSortSeq = Integer.parseInt(a);
			} else {
				teamBoardSortSeq = Integer.parseInt(check);
			}
		}else {
			teamBoardSortSeq = Integer.parseInt(req.getParameter("TeamBoardSortSeq"));
		}
				
		
		req.setAttribute("TeamBoardSortSeq", teamBoardSortSeq);
		
		//게시판 이름
		String sortsubject =(String) req.getParameter("sortsubject");
		req.setAttribute("sortsubject", sortsubject);
		
		//프로젝트 이름
		String projectname = tdao.getprojectname(projectseq);
		req.setAttribute("projectname", projectname);
		
		//조회수 방지염~
		String read = "";
		if (session.getAttribute("TBread") == "y") {
			read = "n";
		} else {
			read = "n";
		}
		
		session.setAttribute("TBread", read);
		
		//팀원 등급 가져와서 넘기기
		int grade = tdao.teamgrade(teamseq);
		req.setAttribute("grade", grade);
		req.setAttribute("teamseq", teamseq);
		
		//테스트용
		/*int projectseq = 1;
		int teamseq = 1;
		int grade = 2;
		int teamBoardSortSeq = 1;
		req.setAttribute("grade", grade);
		req.setAttribute("teamseq", teamseq);*/
		
		//팀게시판 댓글 받아온거
		//Object TBSseq = req.getAttribute("teamBoardSortSeq");
		
		//ArrayList<Object> list = tdao.list();
		//req.setAttribute("list", list);
			
		//페이징 처리
		int total = 0; //총게시물수?
		int pages = 0; //총페이지수
		int pageSize = 10; //한페이지 출력 게시물
		int temp2 = 0, loop = 0;
		int nowPage = 0; //현재 페이지
		int blockSize = 2; //페이지바의 페이지 갯수
		
		if (req.getParameter("page") == null) nowPage = 1;
		else nowPage = Integer.parseInt(req.getParameter("page"));
				
		req.setAttribute("nowPage", nowPage);
		
		int start=((nowPage - 1) * pageSize);
		
		
		//검색을 시작한다!
		boolean search = false;
				
		String col = req.getParameter("col");
		String word = req.getParameter("word");
						
		if (col != null && word != null)
			search = true;
		
		ArrayList<Object> list = null;
				
		if (search) { 
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("start", start);
			map1.put("pageSize", pageSize);
			map1.put("col", col);
			map1.put("word", word);
			map1.put("projectseq", projectseq);
			map1.put("teamBoardSortSeq", teamBoardSortSeq);
			map1.put("teamseq", teamseq);
			list = tdao.searchlist(map1);
			
		} else {		
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("pageSize", pageSize);
			map.put("projectseq", projectseq);
			map.put("teamBoardSortSeq", teamBoardSortSeq);
			map.put("teamseq", teamseq);
			list = tdao.paging(map);
		}		
						
		req.setAttribute("paging", list);
						
		
		//페이지 이동수단
		TeamBoardDTO dto = tdao.page(pageSize);;
		
		total = dto.getTotal(); pages = dto.getPages();		
				
		req.setAttribute("total", total);
		req.setAttribute("pages", pages);
		
		String pageBar ="";
		
		
		loop = 1;
		//출력페이지 번호
		temp2 = ((nowPage -1) / blockSize) * blockSize + 1;
		
		//이전 2페이지
		if (temp2 == 1) {
			//현재 페이지가 첫번째 블럭인가?
			pageBar += String.format("[이전 %d 페이지]", blockSize);
		} else {
			//반대 경우
			pageBar += String.format("<a href='/TeamBoard.vs?page=%d'>[이전 %d 페이지]</a>",(temp2-1), blockSize);
		}
		
		while (!(loop > blockSize || temp2 > pages)) {
			
			if (temp2 == nowPage) { //현재페이지?
				pageBar += String.format(" </b>%d</b> ", temp2);
			} else {//다른페이지?
				pageBar += String.format(" <a href='/TeamBoard.vs?page=%d'>%d</a>",temp2,temp2);
			}
		
			loop++;
			temp2++;
		}
			
		
		//다음 2페이지
		if (temp2 > pages) {
			//마지막 블럭에 속한 페이지
				pageBar += String.format("다음 %d 페이지]", blockSize);
		} else {
			//마지막 블럭에 속하지 않은 페이지
			pageBar += String.format("<a href='/TeamBoard.vs?page=%d'>[다음 %d 페이지]</a>", temp2, blockSize);
		}
		
		
		req.setAttribute("pageBar", pageBar);
		
		//리스트		
				
		return "/team/TeamBoard.jsp";	
	}
	
	@RequestMapping(method = {RequestMethod.GET}, value="/TeamBoardWrite.vs")
	public String TeamBoardWrite(HttpServletRequest req, HttpSession session) {
		int teamseq = (int)session.getAttribute("teamseq");
		String TeamBoardSortSeq = req.getParameter("TeamBoardSortSeq");
		
		req.setAttribute("teamseq", teamseq);
		req.setAttribute("TeamBoardSortSeq",TeamBoardSortSeq);
		
		String TeamBoardSortName = tdao.getTeamBoardSortName(TeamBoardSortSeq);
		req.setAttribute("TeamBoardSortName", TeamBoardSortName);				
		
		return "/team/TeamBoardWrite.jsp";
	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/TeamBoardWriteOk.vs")
	public String Upload(TeamBoardDTO dto, HttpServletRequest req, HttpSession session) {
		int teamseq = (int)session.getAttribute("teamseq");
		
		//파일 업로드할 폴더 지정하기
		// -> WebContent/files 폴더로 지정
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files"; //path -> 저장되는 경로
		//System.out.println(path);
		
		//저장할 파일명
		String newFileName = "";
		
		//첨부파일이 있는지?		
		if (!dto.getAttach().isEmpty()) {
			
			//첨부파일을 서버에 저장하기
			byte[] bytes = null;
			
			try {
				bytes = dto.getAttach().getBytes();
				
				//실제 파일 저장 & 저장 파일명 반환
				newFileName = fileManager.doFileUpload(bytes, dto.getAttach().getOriginalFilename(), path);
				
				
				//방금 저장한 파일을 dto에 옮겨 담기
				dto.setOrgFileName(dto.getAttach().getOriginalFilename());//X
				dto.setFileName(newFileName);//***저장되는 파일명
				
				
			} catch (Exception e) {
				
			}			
			
		}				
		
		int teamBoardSortSeq = Integer.parseInt(req.getParameter("TeamBoardSortSeq"));
		dto.setTeamBoardSortSeq(teamBoardSortSeq);
		dto.setTeamseq(Integer.toString(teamseq));
		req.setAttribute("dto", dto);	
		req.setAttribute("TeamBoardSortSeq", teamBoardSortSeq);
				
		tdao.add(dto);
		return "/team/TeamBoardWriteOk.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/TeamContent.vs")
	public String Content(TeamBoardDTO dto, HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		String read = "";
		String readcheck = (String) session.getAttribute("TBread");
		if (readcheck == "n"){
			System.out.println("여기는 되나요?");
			tdao.addread(req.getParameter("teamboardId"));
			read = "y";
		} 
		session.setAttribute("TBread", read);
		
		dto = tdao.content(Integer.parseInt(req.getParameter("teamboardId")));
		ArrayList<Object> list = tdao.comment(Integer.parseInt(req.getParameter("teamboardId")));		
		
		req.setAttribute("TeamBoardSortSeq",req.getParameter("TeamBoardSortSeq"));
		
		req.setAttribute("list", list);
		req.setAttribute("dto", dto);
		
		
		return "/team/TeamBoardView.jsp";
	}
	@RequestMapping(method = {RequestMethod.GET},value="TeamBoardDown.vs")
	public void download(HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		//파일명 가져오기
		String fileName = req.getParameter("fileName");
		String orgFileName = req.getParameter("orgFileName");
		
		//파일 경로
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files";
		
		System.out.println(path);
		
		//다운로드
		boolean flag = false;
		
		flag = fileManager.doFileDownload(fileName, orgFileName, path, response);
		
		if (!flag) {
			
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter writer = null;
			
			try {
				writer = response.getWriter();
			} catch (IOException e) {			
			}
			
			writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가능합니다.');</script>");			
		}
	}
	
	@RequestMapping(method={RequestMethod.POST}, value="/CommentWrite.vs")
	public String CommentWrite(HttpServletRequest req, TeamCommentDTO cdto, TeamBoardDTO dto, HttpSession session){
		int teamseq = (int)session.getAttribute("teamseq");		
		
		cdto.setTeamseq(teamseq);
		tdao.addcomment(cdto);
				
		dto = tdao.content(Integer.parseInt(req.getParameter("teamboardseq")));
		ArrayList<Object> list = tdao.comment(Integer.parseInt(req.getParameter("teamboardseq")));		
		
		dto.setTeamboardId((req.getParameter("teamboardseq")));
		req.setAttribute("list", list);
		req.setAttribute("dto", dto);
		
		String TeamBoardSortSeq = req.getParameter("TeamBoardSortSeq");
		req.setAttribute("TeamBoardSortSeq", TeamBoardSortSeq);
		
		return "/team/TeamBoardView.jsp";
		
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/TeamBoardEdit.vs")
	public String TeamBoardEdit(HttpServletRequest req, TeamBoardDTO dto, HttpSession session) {
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		
		String TeamBoardSortSeq = req.getParameter("TeamBoardSortSeq");
				
		req.setAttribute("TeamBoardSortSeq",TeamBoardSortSeq);
		
		String TeamBoardSortName = tdao.getTeamBoardSortName(TeamBoardSortSeq);
		req.setAttribute("TeamBoardSortName", TeamBoardSortName);
		
		dto = tdao.content(Integer.parseInt(req.getParameter("teamboardId")));
		ArrayList<Object>list = tdao.BoardSort(projectseq);
		
		req.setAttribute("list", list);
		
		req.setAttribute("dto", dto);
		
		return "/team/TeamBoardEdit.jsp";
	}
	
	@RequestMapping(method={RequestMethod.POST}, value="/TeamBoardEditOk.vs")
	public String TeamBoardEditOk (HttpServletRequest req, TeamBoardDTO dto) {
		int teamBoardSortSeq = Integer.parseInt(req.getParameter("TeamBoardSortSeq"));
		dto.setTeamBoardSortSeq(teamBoardSortSeq);
		tdao.TeamBoardEdit(dto);
		
		req.setAttribute("TeamBoardSortSeq", teamBoardSortSeq);
		
		return "/team/TeamBoardEditOk.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/TeamBoardDel.vs")
	public String TeamBoardDel (HttpServletRequest req, TeamBoardDTO dto) {
		String TeamBoardSortSeq = req.getParameter("TeamBoardSortSeq");
		
		req.setAttribute("TeamBoardSortSeq", TeamBoardSortSeq);
		tdao.TeamBoardDel(Integer.parseInt(req.getParameter("teamboardId")));
		
		return "/team/TeamBoardDelOk.jsp";
	}
		
	@RequestMapping(method={RequestMethod.GET}, value="TeamBoardCommentDel.vs")
	public String TeamBoardCommentDel (HttpServletRequest req, TeamBoardDTO dto) {
				
		tdao.teamcommentdel(Integer.parseInt(req.getParameter("teamcommentId")));
		
		
		dto = tdao.content(Integer.parseInt(req.getParameter("teamboardseq")));
		ArrayList<Object> list = tdao.comment(Integer.parseInt(req.getParameter("teamboardseq")));		
				
		req.setAttribute("list", list);
		req.setAttribute("dto", dto);
		
		String TeamBoardSortSeq = req.getParameter("TeamBoardSortSeq");
		req.setAttribute("TeamBoardSortSeq", TeamBoardSortSeq);
		
		return "/team/TeamBoardView.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="noticeContent.vs")
	public String noticeContent (HttpServletRequest req, TeamNoticeDTO dto){
		dto = tdao.notice(Integer.parseInt(req.getParameter("noticeId")));
		req.setAttribute("dto", dto);
		return "/team/TeamNotice.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="TeamNoticeEdit.vs")
	public String noticeEdit (HttpServletRequest req, TeamNoticeDTO dto){
		dto = tdao.notice(Integer.parseInt(req.getParameter("noticeId")));
				
		req.setAttribute("dto", dto);
		return "/team/TeamNoticeEdit.jsp";
	}
	
	@RequestMapping(method={RequestMethod.POST}, value="/TeamNoticeEditOk.vs")
	public String TeamNoticeEditOk (HttpServletRequest req, TeamNoticeDTO dto) {
		tdao.TeamNoticeEdit(dto);		
		return "/team/TeamNoticeEditOk.jsp";
	}
	@RequestMapping(method={RequestMethod.GET}, value="/TeamNoticeDel.vs")
	public String TeamNoticeDel (HttpServletRequest req, TeamBoardDTO dto) {
		tdao.TeamNoticeDel(Integer.parseInt(req.getParameter("noticeId")));
		return "/team/TeamNoticeDelOk.jsp";
	}

	@RequestMapping(method={RequestMethod.GET}, value="/AddTeamNotice.vs")
	public String AddTeamNotice (HttpServletRequest req) {
		req.setAttribute("teamseq", req.getParameter("teamseq"));		
		return "/team/AddTeamNotice.jsp";
	}
	
	@RequestMapping(method={RequestMethod.POST}, value="/AddTeamNoticeOk.vs")
	public String AddTeamNoticeOk (HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("teamseq", req.getParameter("teamseq"));
		map.put("subject", req.getParameter("subject"));
		map.put("content", req.getParameter("content"));
		
		tdao.AddTeamNotice(map);	
		
		return "/team/AddTeamNoticeOk.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="TeamNotice.vs")
	public String TeamNotice(HttpServletRequest req, HttpSession session) {
		String memSeq = session.getAttribute("loginSeq").toString();
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("memSeq", memSeq);
		map2.put("projectseq", projectseq);
		int teamseq = tdao.getteamseq(map2);
		
		
		
		// 프로젝트 타이틀 가져오기
		String title = pdao.title(String.valueOf(projectseq));
				
		req.setAttribute("title", title);
				
		
		
		//공지사항 이름 가져와서 넘기기
						
		//팀원 등급 가져와서 넘기기
		int grade = tdao.teamgrade(teamseq);
		req.setAttribute("grade", grade);
		req.setAttribute("teamseq", teamseq);
				
		//페이징을 시작한다.
		int total = 0; //총게시물수?
		int pages = 0; //총페이지수
		int pageSize = 15; //한페이지 출력 게시물
		int temp2 = 0, loop = 0;
		int nowPage = 0; //현재 페이지
		int blockSize = 2; //페이지바의 페이지 갯수
		
		if (req.getParameter("page") == null) nowPage = 1;
		else nowPage = Integer.parseInt(req.getParameter("page"));
				
		req.setAttribute("nowPage", nowPage);
		
		int start=((nowPage - 1) * pageSize);
		
		
		//검색을 시작한다!
		boolean search = false;
				
		String col = req.getParameter("col");
		String word = req.getParameter("word");
						
		if (col != null && word != null)
			search = true;
		
		ArrayList<Object> list = null;
				
		if (search) { 
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("start", start);
			map1.put("pageSize", pageSize);
			map1.put("col", col);
			map1.put("word", word);
			map1.put("projectseq", projectseq);
			map1.put("teamseq", teamseq);
			list = tdao.searchNotice(map1);
			
		} else {		
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("pageSize", pageSize);
			map.put("projectseq", projectseq);
			map.put("teamseq", teamseq);
			list = tdao.pagingNotice(map);
		}		
						
		req.setAttribute("notice", list);
						
		
		//페이지 이동수단
		TeamBoardDTO dto = tdao.page(pageSize);;
		
		total = dto.getTotal(); pages = dto.getPages();		
				
		req.setAttribute("total", total);
		req.setAttribute("pages", pages);
		
		String pageBar ="";
		
		
		loop = 1;
		//출력페이지 번호
		temp2 = ((nowPage -1) / blockSize) * blockSize + 1;
		
		//이전 2페이지
		if (temp2 == 1) {
			//현재 페이지가 첫번째 블럭인가?
			pageBar += String.format("[이전 %d 페이지]", blockSize);
		} else {
			//반대 경우
			pageBar += String.format("<a href='/TeamNotice.vs?page=%d'>[이전 %d 페이지]</a>",(temp2-1), blockSize);
		}
		
		while (!(loop > blockSize || temp2 > pages)) {
			
			if (temp2 == nowPage) { //현재페이지?
				pageBar += String.format(" </b>%d</b> ", temp2);
			} else {//다른페이지?
				pageBar += String.format(" <a href='/TeamNotice.vs?page=%d'>%d</a>",temp2,temp2);
			}
		
			loop++;
			temp2++;
		}		
		
		//다음 2페이지
		if (temp2 > pages) {
			//마지막 블럭에 속한 페이지
				pageBar += String.format("다음 %d 페이지]", blockSize);
		} else {
			//마지막 블럭에 속하지 않은 페이지
			pageBar += String.format("<a href='/TeamNotice.vs?page=%d'>[다음 %d 페이지]</a>", temp2, blockSize);
		}
		
		
		req.setAttribute("pageBar", pageBar);
				
		return "/team/TeamNotice.jsp";
	}

	@RequestMapping(method={RequestMethod.GET}, value="TeamNoticeContent.vs")
	public String TeamNoticeContent(HttpServletRequest req, HttpSession session, TeamNoticeDTO dto) {
		String memSeq = session.getAttribute("loginSeq").toString();
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("memSeq", memSeq);
		map2.put("projectseq", projectseq);
		int teamseq = tdao.getteamseq(map2);
		int grade = tdao.teamgrade(teamseq);
		req.setAttribute("grade", grade);
		
		String noticeId = req.getParameter("noticeId");
		dto = tdao.getnoticecontent(noticeId);
		req.setAttribute("dto", dto);	
		return "/team/TeamNoticeView.jsp";
	}
}
