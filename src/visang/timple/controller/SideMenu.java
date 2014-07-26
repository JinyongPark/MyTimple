package visang.timple.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import visang.timple.dao.CommonDAO;
import visang.timple.interfaces.IBoardAdd;
import visang.timple.interfaces.IBp;
import visang.timple.interfaces.IBplan;
import visang.timple.interfaces.IProject;
import visang.timple.interfaces.ISet;
import visang.timple.model.ThemeDTO;


@Controller("SideMenu")
public class SideMenu {

	@Resource(name = "projectDAO")
	private IProject dao;

	
	@Resource(name = "bpDAO")
	private IBp bpdao;
	
	@Resource(name = "planDAO")
	private IBplan pdao;

	
	@Resource(name = "boardaddDAO")
	private IBoardAdd bdao;
	
	@Resource(name = "SetDAO")
	private ISet tdao;
	
	@RequestMapping(value="/sidemenu.vs")
	public String sidemenu(HttpServletRequest request, HttpSession session) {

	//로그인 아이디
		
	String mseq = session.getAttribute("loginSeq").toString();	
	
	
	String seq = session.getAttribute("seq").toString();
	
	
	// 프로젝트 타이틀 가져오기
	String title = dao.title(seq);

	request.setAttribute("title", title);
	
	// BP 리스트와 진행률 가져오기
	ArrayList<Object> bpList = bpdao.list(seq);
	
	
	request.setAttribute("bpList", bpList);	

	
	
	// Business Plan 가져오기
	ArrayList<Object> list2 = pdao.name(seq);

	request.setAttribute("list2", list2);
	
	
	// 게시판 리스트 가져오기
	ArrayList<Object> boardList = bdao.name(seq);

	request.setAttribute("boardList", boardList);
			
	
	// 테마 가져 오기
	
	String skin = tdao.Themelist(seq);
	
	request.setAttribute("skin", skin);
	
	// 회원 등급 가져 오기
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	map.put("seq", seq);
	map.put("mseq", mseq);
	
	String grade = tdao.Grade(map);
	
	request.setAttribute("grade", grade);
	
	// 사이드 메뉴 카테고리 가져오기
	String sidename = tdao.SetList(map);
	
	System.out.println(sidename);
	
	request.setAttribute("map", map);
	
	return "/base/sidemenu.jsp";
	
	
	
	}
	
}
