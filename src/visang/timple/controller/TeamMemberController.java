package visang.timple.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.interfaces.IApply;
import visang.timple.interfaces.IBoardAdd;
import visang.timple.interfaces.IBp;
import visang.timple.interfaces.IBplan;
import visang.timple.interfaces.IProject;

@Controller("teammemberController")
public class TeamMemberController {
	
	@Resource(name = "projectDAO")
	private IProject dao;

	@Resource(name = "planDAO")
	private IBplan pdao;

	@Resource(name = "boardaddDAO")
	private IBoardAdd bdao;

	@Resource(name = "bpDAO")
	private IBp bpdao;
	
	@Resource(name = "applyDAO")
	private IApply adao;
	
//	@RequestMapping(method={RequestMethod.GET}, value="/projects/TeamMember.vs")
//	public String member(HttpSession session, HttpServletRequest request){
//		String seq = session.getAttribute("seq").toString();
//		// 프로젝트 타이틀 가져오기
//		String title = dao.title(seq);
//		request.setAttribute("title", title);
//
//		// Business Plan 가져오기
//		ArrayList<Object> list2 = pdao.name(seq);
//
//		request.setAttribute("list2", list2);
//
//		// BP 리스트와 진행률 가져오기
//		ArrayList<Object> bpList = bpdao.list(seq);
//
//		request.setAttribute("bpList", bpList);
//
//		// 게시판 리스트 가져오기
//		ArrayList<Object> boardList = bdao.name(seq);
//
//		request.setAttribute("boardList", boardList);
//		return "/projects/TeamMember.jsp";
//	}
	
	@RequestMapping(method={RequestMethod.GET}, value="/projects/ApplyMember.vs")
	public String apply(HttpSession session, HttpServletRequest request){
		String seq = session.getAttribute("seq").toString();
		// 프로젝트 타이틀 가져오기
		String title = dao.title(seq);
		request.setAttribute("title", title);

		// Business Plan 가져오기
		ArrayList<Object> list2 = pdao.name(seq);

		request.setAttribute("list2", list2);

		// BP 리스트와 진행률 가져오기
		ArrayList<Object> bpList = bpdao.list(seq);

		request.setAttribute("bpList", bpList);

		// 게시판 리스트 가져오기
		ArrayList<Object> boardList = bdao.name(seq);

		request.setAttribute("boardList", boardList);
		
		//프로젝트 참가신청한 인원가져오기
		ArrayList<Object> memberList = adao.view(seq);
		
		request.setAttribute("memberList", memberList);
		
		return "/projects/ApplyMember.jsp";
	}
	
	//프로젝트 참가 신청 수락한 경우
	@RequestMapping(method={RequestMethod.GET}, value="/projects/ApplyYes.vs")
	public String yes(HttpServletRequest request, HttpSession session){
		String mseq = request.getParameter("aseq");
		String seq = session.getAttribute("seq").toString();
		String acceptanceid = request.getParameter("acceptanceid");
		HashMap<String, String> map = new HashMap<String, String>();
		
		//팀원추가
		map.put("seq", seq);
		map.put("mseq", mseq);	
		adao.add(map);
		
		//수락여부 변경(수락)
		adao.addok(acceptanceid);
		return "/projects/ApplyYes.jsp";
	}
	
	//프로젝트 참가 신청 거부한 경우
	@RequestMapping(method={RequestMethod.GET}, value="/projects/ApplyNo.vs")
	public String no(HttpServletRequest request, HttpSession session){
		
		String acceptanceid = request.getParameter("acceptanceid");
		adao.reject(acceptanceid);
		return "/projects/ApplyNo.jsp";
	}
	
	//팀원정보페이지에서 회원 검색 창
	@RequestMapping(method={RequestMethod.GET}, value="/projects/SearchMember.vs")
	public String search(){
		
		return "/projects/SearchMember.jsp";
	}
	
	//팀원정보페이지에서 회원 검색 결과
	@RequestMapping(method={RequestMethod.POST}, value="/projects/SearchResult.vs")
	public String result(HttpServletRequest request, HttpSession session){
		
		//검색 이름 값
		String name = request.getParameter("name");
		
		//프로젝트 seq
		String seq = session.getAttribute("seq").toString();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("seq", seq);
		ArrayList<Object> list = adao.result(map);
		
		request.setAttribute("list", list);
		return "/projects/SearchResult.jsp";
	}
	
	//팀원초대메세지 보내기
	@RequestMapping(method={RequestMethod.GET}, value="/projects/Invite.vs")
	public String invite(HttpSession session, HttpServletRequest request){
		
		String sseq = session.getAttribute("loginSeq").toString();
		String rseq = request.getParameter("rseq");
		String seq = session.getAttribute("seq").toString();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sseq", sseq);
		map.put("rseq", rseq);
		map.put("seq", seq);
		
		//메세지 보내기
		adao.invite(map);
		
		//수락여부테이블에 값 추가하기
		String pseq = adao.seq(); //초대 메세지의 seq		
		adao.accept(pseq);
		
		return "/projects/Invite.jsp";
	}
}


















