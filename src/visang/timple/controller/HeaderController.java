package visang.timple.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.interfaces.IHeader;
import visang.timple.model.FriendsListDTO;
import visang.timple.model.MemoDTO;
import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;
import visang.timple.model.ProjectMemberDTO;

@Controller("HeaderController")
public class HeaderController {
	
	@Resource(name="HeaderDAOSV")
	private IHeader hdao;
	
	@RequestMapping(value="/header.vs")
	public String header(HttpSession session, HttpServletRequest req){
		if (session.getAttribute("loginSeq") != null) {
			
			int memberId = Integer.parseInt(session.getAttribute("loginSeq").toString());
			//int memberId = 1;
			// hdao.getMyProject(memberId);
			List<ProjectMemberDTO> projectList = hdao.getMyProject(memberId);
			List<FriendsListDTO> friendsList = hdao.getFriendsList(memberId);
			List<PaperListDTO> paperList = hdao.getPaperList(memberId);
			List<NotiListDTO> notiList = hdao.getNotiList(memberId);
			List<PaperListDTO> paperListAtnoti = hdao.getPaperListAtNoti(memberId);
			List<MemoDTO> memoList = hdao.getMemoList(memberId);
			
			req.setAttribute("Memo", memoList);
			if (notiList.size() != 0) {
				req.setAttribute("Noti", notiList);
				req.setAttribute("ncount", notiList.size());
			} else {
				req.setAttribute("Noti", null);
				req.setAttribute("ncount", 0);
			}
			
			req.setAttribute("Paper", paperList);
			req.setAttribute("paperListAtnoti", paperListAtnoti);
			req.setAttribute("Friends", friendsList);
			req.setAttribute("MyProject", projectList);
		}
		return "/base/header.jsp";
	}
//	
//	@RequestMapping(value="/header2.vs")
//	public String header2(){
//		
//		return "/base/header2.jsp";
//	}
	
	@RequestMapping(value="/header_ajax.vs", method=RequestMethod.POST)
	public String pub(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		try {
			hdao.updateNoti(Integer.parseInt(req.getParameter("id")));
			List<NotiListDTO> notiList = hdao.getNotiList(Integer.parseInt(req.getParameter("id")));
			
			if (notiList.size() != 0) {
				req.setAttribute("Noti", notiList);
				req.setAttribute("ncount", notiList.size());
			} else {
				req.setAttribute("Noti", null);
				req.setAttribute("ncount", 0);
			}
			
			
		} catch (Exception e) {
			
		}
		
		return "/base/header_ajax.jsp";
	}
	
	@RequestMapping(value="/addFriendReject.vs", method=RequestMethod.POST)
	public String addFriendReject(HttpServletRequest req, HttpSession session,@RequestParam Integer toId, @RequestParam Integer fromId, @RequestParam Integer paperid){
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("toId", toId);
		map.put("fromId", fromId);
		map.put("paperid", paperid);
		
		int result = hdao.addFriendReject(map);
		int memberId = Integer.parseInt(session.getAttribute("loginSeq").toString());
		List<PaperListDTO> paperListAtnoti = hdao.getPaperList(memberId);
		List<NotiListDTO> notiList = hdao.getNotiList(memberId);
		
		req.setAttribute("paperListAtnoti", paperListAtnoti);
		req.setAttribute("Noti", notiList);
		req.setAttribute("code", result);
		
		return "/base/header_ajax.jsp";
	}
	
	@RequestMapping(value="/addRejectOk.vs", method=RequestMethod.POST)
	public String addRejectOk(HttpServletRequest req, HttpSession session, @RequestParam Integer toId, @RequestParam Integer fromId, @RequestParam Integer paperid){
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("toId", toId);
		map.put("fromId", fromId);
		map.put("paperid", paperid);
		
		int result = hdao.addRejectOk(map);
		int memberId = Integer.parseInt(session.getAttribute("loginSeq").toString());
		List<PaperListDTO> paperListAtnoti = hdao.getPaperList(memberId);
		List<NotiListDTO> notiList = hdao.getNotiList(memberId);
		
		req.setAttribute("code", result);
		req.setAttribute("paperListAtnoti", paperListAtnoti);
		req.setAttribute("Noti", notiList);
		return "/base/header_ajax.jsp";
	}
}
