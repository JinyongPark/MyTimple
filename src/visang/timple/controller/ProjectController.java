package visang.timple.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import visang.timple.interfaces.IBoardAdd;
import visang.timple.interfaces.IBp;
import visang.timple.interfaces.IBplan;
import visang.timple.interfaces.IJob;
import visang.timple.interfaces.IOverview;
import visang.timple.interfaces.IProject;
import visang.timple.interfaces.ITeamAdd;
import visang.timple.interfaces.IaddAccept;
import visang.timple.model.JobDTO;
import visang.timple.model.ProjectDTO;
import visang.timple.model.TeamAddDTO;
import visang.timple.util.FileManager;

@Controller("projectController")
public class ProjectController {

	@Resource(name = "projectDAO")
	private IProject dao;

	@Resource(name = "jobDAO")
	private IJob jdao;

	@Resource(name = "teamaddDAO")
	private ITeamAdd tdao;

	@Resource(name = "planDAO")
	private IBplan pdao;

	@Resource(name = "boardaddDAO")
	private IBoardAdd bdao;

	@Resource(name = "bpDAO")
	private IBp bpdao;
	
	@Resource(name = "overviewDAO")
	private IOverview odao;

	@Resource(name = "addAcceptDAO")
	private IaddAccept adddao;
	
	
	
	@Resource(name="fileManager")
	private FileManager fileManager;
	 

	@RequestMapping(method = { RequestMethod.GET }, value = "/projects/ProjectAdd.vs")
	public String add(HttpServletRequest request, HttpSession session) {		
		
		String mname = session.getAttribute("loginName").toString();

		ArrayList<Object> one = jdao.one();

		String oneSeq = ((JobDTO) one.get(0)).getSeq();

		ArrayList<Object> two = jdao.two(oneSeq);

		request.setAttribute("one", one);
		request.setAttribute("two", two);
		request.setAttribute("mname", mname);	
		
		return "/projects/ProjectAdd.jsp";
		
	}

	@RequestMapping(method = { RequestMethod.POST }, value = "/projects/ProjectAddOk.vs")
	public String addOk(ProjectDTO dto, TeamAddDTO tdto,
			HttpServletRequest request, HttpSession session) {

		String mseq = session.getAttribute("loginSeq").toString();

		// 프로젝트 생성하기
		String content = dto.getContent();
		content = content.replace("\r\n", "<br/>");
		dto.setContent(content);
		
		String[] temp = dto.getStartday().split("/");
		dto.setStartday(String.format("%s-%s-%s", temp[2], temp[0], temp[1]));
		
		String[] temp1 = dto.getEndday().split("/"); 
		dto.setEndday(String.format("%s-%s-%s", temp1[2], temp1[0], temp1[1]));
		
		
		// 저장경로 만들기(*****) //TODO 저장경로 서버로 가져가기!
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files"; //경로 (저장서버 진호 알아보는중)
		System.out.println("이미지파일 저장경로 : " + path);   
		
		//저장할 파일명
		String newFileName = "";
		
		//첨부파일이 있는지?		
		if (!dto.getAttach().isEmpty()) {
			
			//첨부파일을 서버에 저장하기(*****) - 바이트로 쪼개서 저장.getBytes().
			byte[] bytes = null;
			try {
				bytes = dto.getAttach().getBytes(); 
				
				// attach는 MultipartFile 클래스 변수 
				
				//실제 파일 저장 & 저장 파일명 반환
				newFileName = fileManager.doFileUpload(bytes, dto.getAttach().getOriginalFilename(), path);
				
				//방금 저장한 파일을 (dto에 옮겨 담기)
				dto.setOrgFileName((dto.getAttach().getOriginalFilename()));    //(dto.getAttach().getOriginalFilename());//X
				dto.setThumnail(newFileName);//***저장되는 파일명
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		if (dto.getThumnail() == null || dto.getThumnail() == "") {
			dto.setThumnail("noimg.JPG");
		}
			dao.add(dto); 
			// 신규 프로젝트 seq 호출하기
			String seq = dao.seq();

			// 팀장 등록하기
			tdao.add(tdto, seq, mseq);

			session.setAttribute("pseq", seq); 		
		
		return "/projects/ProjectAddOk.jsp";
	}
	@RequestMapping(method = { RequestMethod.GET }, value = "/projects/ProjectMain.vs")
	public String main(HttpServletRequest request, HttpSession session) {

		// 실제 구현시 사용할 seq
		String seq = request.getParameter("projectid");

		// String seq = "15"; //임의로 정한 프로젝트Seq (Test용)

		// 프로젝트 seq 세션에 저장
		session.setAttribute("seq", seq);

		// 프로젝트 타이틀 가져오기
		String title = dao.title(seq);

		request.setAttribute("title", title);

		// 프로젝트 전체 진행률 가져오기
		int percent = (int) dao.percent(seq);

		request.setAttribute("percent", percent);

		// 오늘의 일정 가져오기
		Calendar c1 = Calendar.getInstance();

		String year = String.valueOf(c1.get(1));
		String month = String.valueOf(c1.get(2) + 1);
		String date = String.valueOf(c1.get(5));

		String nowdate = year + "-" + month + "-" + date;

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("seq", seq);
		map.put("nowdate", nowdate);

		ArrayList<Object> list = dao.list(map);

		request.setAttribute("list", list);

		// Business Plan 가져오기
		ArrayList<Object> list2 = pdao.name(seq);

		request.setAttribute("list2", list2);
		//
		// //Business Plan 진행률 가져오기
		// String bpid = "12"; //임시 bpid
		// HashMap<String, String> map2 = new HashMap<String, String>();
		//
		// map2.put("seq", seq);
		// map2.put("bpid", bpid);
		// int bpercent = (int)dao.bpercent(map2);
		//
		// request.setAttribute("bpercent", bpercent);

		// BP 리스트와 진행률 가져오기
		ArrayList<Object> bpList = bpdao.list(seq);

		request.setAttribute("bpList", bpList);

		// 게시판 리스트 가져오기
		ArrayList<Object> boardList = bdao.name(seq);

		request.setAttribute("boardList", boardList);
		
		//Overview 가져오기 (일단 업무만...)
		ArrayList<Object> overview = odao.view(seq);
		
		request.setAttribute("overview", overview);

		return "/projects/ProjectMain.jsp";
	}
	
	@RequestMapping(value="/addAcceptOk.vs", method=RequestMethod.POST)
	public String addAcceptOk(HttpServletRequest req, @RequestParam Integer toId, @RequestParam Integer projectid, @RequestParam Integer paperid) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("toId", toId);
		map.put("projectid", projectid);
		map.put("paperid", paperid);
		
		adddao.addAccept(map);
		
		return "/mypage/unFriendOk.jsp";
	}
}
