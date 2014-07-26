package visang.timple.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.interfaces.IProject;
import visang.timple.interfaces.ITeamBoard;
import visang.timple.interfaces.ITeamData;
import visang.timple.model.TeamBoardDTO;
import visang.timple.model.TeamDataDTO;
import visang.timple.util.FileManager;

@Controller("TeamData")
public class TeamDataController {
	@Resource(name="TDService")
	private ITeamData ddao;
	
	@Resource(name="fileManager")
	private FileManager fileManager;
	
	
	@Resource(name = "projectDAO")
	private IProject dao;
	
	@Resource(name="TBService")
	private ITeamBoard tdao;
	
	
	@RequestMapping(value="TeamData.vs", method=RequestMethod.GET)
	private String teamdata(HttpServletRequest req, TeamDataDTO dto, HttpSession session) {
		String memSeq = session.getAttribute("loginSeq").toString();
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("memSeq", memSeq);
		map2.put("projectseq", projectseq);
		int teamseq = tdao.getteamseq(map2);
		session.setAttribute("teamseq", teamseq);
		
		ArrayList<Object> list = ddao.list(projectseq);
		req.setAttribute("list", list);
		
		String seq =  session.getAttribute("seq").toString();
		
		// 프로젝트 타이틀 가져오기
		String title = dao.title(seq);

		req.setAttribute("title", title);
				
		return "/team/TeamData.jsp";
	}
	
	@RequestMapping(method={RequestMethod.GET}, value="DataUpload.vs")
	private String DataUpload(HttpServletRequest req) {				
		return "/team/TeamDataUpload.jsp";
	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/DataUploadOk.vs")
	public String DataUploadOk(TeamDataDTO dto, HttpServletRequest req, HttpSession session) {
		int teamseq = (int)session.getAttribute("teamseq");
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		
		//파일 업로드할 폴더 지정하기
		// -> WebContent/files 폴더로 지정
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files"; 
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
				dto.setOrgFileName(req.getParameter("orgFileName")); //(dto.getAttach().getOriginalFilename());//X
				dto.setFileName(newFileName);//***저장되는 파일명
			} catch (Exception e) {
			}			
		}
		dto.setProjectseq(projectseq);
		req.setAttribute("dto", dto);		
			
		ddao.addData(dto);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orgFileName", req.getParameter("orgFileName"));
		map.put("projectseq", projectseq);
		int dataseq = ddao.getdataid(map);
		
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("teamseq", teamseq);
		map1.put("dataseq", dataseq);
		ddao.addfilelog(map1);
		
		ArrayList<Object> list = ddao.list(projectseq);
		req.setAttribute("list", list);
			
		return "/team/TeamData.jsp";
	}
	
	@RequestMapping(method = {RequestMethod.GET},value="DataDownload.vs")
	public String download(TeamDataDTO dto, HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		int teamseq = (int)session.getAttribute("teamseq");
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		
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
		
		ArrayList<Object> list = ddao.list(projectseq);
		req.setAttribute("list", list);
		
		String dataSeq = req.getParameter("dataId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dataSeq", dataSeq);
		map.put("teamseq", teamseq);
		ddao.addfilelog2(map);
		
		
		return "/team/TeamData.jsp";
	}
	
	
	@RequestMapping(method={RequestMethod.GET},value=("DataDel.vs"))
	public String DataDel (TeamDataDTO dto, HttpServletRequest req, HttpSession session){
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		
		// 프로젝트 타이틀 가져오기
		String seq =  session.getAttribute("seq").toString();
				
		String title = dao.title(seq);

		req.setAttribute("title", title);
		
		ArrayList<Object> list = ddao.list(projectseq);
		req.setAttribute("list", list);
		
		return "/team/TeamDataDel.jsp";
	}
	
	@RequestMapping(method={RequestMethod.POST},value=("DataDelOk.vs"))
	public String DataDelOk (TeamDataDTO dto, HttpServletRequest req, HttpSession session){
		int projectseq = Integer.parseInt((session.getAttribute("seq").toString()));
		
		int teamseq = (int)session.getAttribute("teamseq");
		
		HashMap<String, Object>map = new HashMap<String, Object>();
		
		String[] dataId = req.getParameterValues("del");
		System.out.println(dataId.length);
		for (int i=0; i < dataId.length; i++) {
			ddao.DataDel(dataId[i]);
			map.put("dataseq", dataId[i]);
			map.put("teamseq", teamseq);
			ddao.addfilefog3(map);
		}
		
		ArrayList<Object> list = ddao.list(projectseq);
		req.setAttribute("list", list);
		
		return "/team/TeamData.jsp";
	}
}
