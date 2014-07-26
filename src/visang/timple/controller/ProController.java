package visang.timple.controller;


import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.dao.ProDAO;

@Controller("ProController")
public class ProController {

	
	@Resource(name="ProDAO")
	private ProDAO dao;
	
	@RequestMapping(value="/projects/ProjectList.vs")			
	public String projectlist(HttpServletRequest request) {
		
		ArrayList<Object> list = null;
		
		boolean isSearch = false;
		
		String searchResult = "";
		
		String search = request.getParameter("search");
		
		if (search != null)
			isSearch = true;

		if (isSearch) {
			
			list = dao.search(search);
			searchResult = String.format("검색어 %s가 총 %d건 검색되었습니다.", search, list.size());
			
			request.setAttribute("search", isSearch);
			request.setAttribute("searchResult", searchResult);
			request.setAttribute("list", list);
			System.out.println(searchResult);
			
		} else {
			
			list = dao.list(0);
			request.setAttribute("search", isSearch);
			request.setAttribute("list", list);
				
		}
			
		return "/projects/ProjectList.jsp";
			
	}
	
	@RequestMapping(value="/nextProjectList.vs", method=RequestMethod.GET)
	public String nextProjectList(HttpServletRequest req, @RequestParam String page) {
		
		ArrayList<Object> list = null;
		
		Integer startPage = Integer.parseInt(page) * 12;
		list = dao.list(startPage);
		
		req.setAttribute("list", list);
		
		return "/projects/nextProjectList.jsp";
	}
	
	

	@RequestMapping(method={RequestMethod.GET}
	, value="/ProjectDetail.vs")			
    public String projectDetail(HttpServletRequest request, @RequestParam String projectid) {

		Object detail = null;
		Integer cnt = null;
		int pid = Integer.parseInt(projectid);
		detail = dao.detail(pid);
		cnt = dao.teamCnt(pid);
		
		request.setAttribute("projectid", projectid);
		request.setAttribute("detail", detail);
		request.setAttribute("cnt", cnt);
		
		return "/projects/ProjectRecruit.jsp";
	}
	
	
	
	
}
