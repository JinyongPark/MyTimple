package visang.timple.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.dao.SetDAO;
import visang.timple.interfaces.IProject;
import visang.timple.model.BpDTO;
import visang.timple.model.OrderDTO;
import visang.timple.model.ThemeDTO;

@Controller
public class SettingController {
	
	@Resource(name="SetDAO")
	private SetDAO dao;
	
	@Resource(name = "projectDAO")
	private IProject pdao;
	
	@RequestMapping(method=RequestMethod.GET, value="/Theme.vs")
	public String ThemeMain(HttpServletRequest req, HttpSession session, ThemeDTO dto){
		
		String seq = session.getAttribute("seq").toString();
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		return "/team/Theme.jsp";
	}

	@RequestMapping(method=RequestMethod.GET, value="/ThemeChange.vs")
	public String theme(HttpServletRequest req, HttpSession session, ThemeDTO dto){
		
		String seq = session.getAttribute("seq").toString();
		
		String skin = req.getParameter("val");

		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		dto.setSeq(seq);
		dto.setSkin(skin);
		
		dao.update(dto);
		
		return "/team/Theme.jsp";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/Order.vs")
	public String Order(HttpServletRequest req, HttpSession session, OrderDTO dto){
		
		String seq = session.getAttribute("seq").toString();
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		dto.setSeq(seq);
		
		dao.selectList(dto);
		
		req.setAttribute("dto", dto);
		
		return "/team/OrderChange.jsp";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/OrderChange.vs")
	public String OrderChange(HttpServletRequest req, HttpSession session, OrderDTO dto
			) {

		String seq = session.getAttribute("seq").toString();
		String name[] = req.getParameterValues("name");
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		map.put("num", num);
		
		for (int i=0; i<name.length; i++) {
			int number = 1;
			number += i;
			map.put("name", name[i]);
			map.put("number", number);
			dao.orderupdate(map);
		}
		
		
		dao.selectList(dto);
		
		req.setAttribute("dto", dto);
		
		return "/team/OrderChange.jsp";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/BpSelect.vs")
	public String BpSelect (HttpServletRequest req, HttpSession session
			) {
		
		String seq = session.getAttribute("seq").toString();
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		System.out.println("프로젝트" + seq);
		
		ArrayList<Object> list = dao.list(seq);
		
		req.setAttribute("list", list);
		
		return "/team/BpEdit.jsp";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/BpUpdate.vs")
	public String BpUpdate(HttpServletRequest req, HttpSession session, OrderDTO dto
			) {

		//String seq = session.getAttribute("seq").toString();
		String name[] = req.getParameterValues("name");
		String bpid[] = req.getParameterValues("bpid");
		String seq = session.getAttribute("seq").toString();
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		map.put("num", num);
		
		for (int i=0; i<name.length; i++) {
			for (int j=0; j<bpid.length; j++)
			map.put("name", name[i]);
			map.put("bpid", bpid[i]);
			dao.BpUpdate(map);
		}

		return "/team/OrderChange.jsp";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/Bpdelete.vs")
	public String Bpdelete (HttpServletRequest req, HttpSession session, BpDTO dto
			) {
		
		String bpid = req.getParameter("num");
	
		String seq = session.getAttribute("seq").toString();
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		dao.business(bpid);
		
		dao.teambp(bpid);
		
		dao.Bpdelete(bpid);
		
		// req.setAttribute("list", list);
		
		return "/team/BpEdit.jsp";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/ProjectEidt.vs")
	public String ProjectSelect (HttpServletRequest req, HttpSession session
			) {
		
		String seq = session.getAttribute("seq").toString();
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		ArrayList<Object> list = dao.Projectname(seq);
		
		req.setAttribute("list", list);
		
		return "/team/ProjectEidt.jsp";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/proupdate.vs")
	public String ProUpdate(HttpServletRequest req, HttpSession session
			) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String seq = session.getAttribute("seq").toString();
		String name = req.getParameter("name");
		
		String title = pdao.title(seq);

		req.setAttribute("title", title);
		
		map.put("seq", seq);
		map.put("name", name);
		
		System.out.println(name);
		
		dao.proupdate(map);
		
		return "/team/ProjectEidt.jsp";
	}
}





