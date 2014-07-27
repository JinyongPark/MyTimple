package visang.timple.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.interfaces.IBoardAdd;
import visang.timple.interfaces.IBp;
import visang.timple.interfaces.IBplan;
import visang.timple.interfaces.IProject;
import visang.timple.model.BoardAddDTO;

@Controller("boardaddController")
public class BoardAddController {
	@Resource(name = "projectDAO")
	private IProject dao;

	@Resource(name = "planDAO")
	private IBplan pdao;

	@Resource(name = "boardaddDAO")
	private IBoardAdd bdao;

	@Resource(name = "bpDAO")
	private IBp bpdao;

	@RequestMapping(method = { RequestMethod.GET }, value = "/projects/BoardAdd.vs")
	public String add(HttpServletRequest request, HttpSession session) {
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
		return "/projects/BoardAdd.jsp";
	}

	@RequestMapping(method = { RequestMethod.POST }, value = "/projects/BoardAddOk.vs")
	public String addOk(BoardAddDTO dto, HttpSession session) {
		String seq = session.getAttribute("seq").toString();
		dto.setProjectseq(seq);
		bdao.add(dto);

		return "/projects/BoardAddOk.jsp";
	}
}
