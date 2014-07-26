package visang.timple.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.dao.ProDAO;
import visang.timple.model.ProjectPaperDTO;



@Controller("ProjectPaperController")
public class ProjectPaperController {

	

	@Resource(name="ProDAO")
	private ProDAO dao;
	
	
	
	@RequestMapping(method={RequestMethod.POST}
	, value="/projects/ProjectPaper.vs")			
    public String projectPaper(ProjectPaperDTO dto, HttpServletRequest request) {

	    int paperid=0;
		dto.setSendmemseq(request.getSession().getAttribute("loginSeq").toString()); 
		dao.paperadd(dto);
		
		paperid=dao.paperid();
		
		dao.acceptance(paperid);
		
		System.out.println("프로번호:" + request.getParameter("projectid"));
		
		return "/projects/ProjectList.vs";
	
	}
	
}
