package visang.timple.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.dao.MemberDAO;
import visang.timple.model.MemberDTO;

@Controller("indexController")
public class IndexController {
	
	@Resource(name="memberService")
	private MemberDAO mdao;
	
	@RequestMapping(value="/index.vs")
	public String index(HttpServletRequest req, HttpSession session,
			@RequestParam(required=false) String param) {
		
		if (session.getAttribute("loginSeq") == null) {
		
			ArrayList<Object> questionList = mdao.getQuestion();
			ArrayList<Object> oneCategoryList = mdao.getOneCategory();
			
			req.setAttribute("questionList", questionList);
			req.setAttribute("oneCategoryList", oneCategoryList);
			
			if (param != null) {
				req.setAttribute("param", param);
			}
			
			return "/index.jsp";
		} else {
			System.out.println("로그인 완료후 진입");
			return "redirect:/projects/ProjectList.vs";
		}
	}
	
	@RequestMapping(value="/socialLogin.vs", method=RequestMethod.POST)
	public void socialLogin(
			HttpSession session,
			@RequestParam String loginEmail,
			@RequestParam String loginName,
			@RequestParam String loginPicture,
			@RequestParam String socialType) {
		
		System.out.println("소셜네트워크로 로그인..");
		MemberDTO mdto = new MemberDTO();
		mdto.setEmail(loginEmail);
		mdto.setName(loginName);
		mdto.setSocialType(socialType);
		System.out.println("*********" + socialType);
		// 회원인지 아닌지 체크 (회원이 아니면 회원가입 처리)
		if (mdao.socialEmailCheck(mdto) == 0) {
			System.out.println("회원가입이 되어있지 않습니다.");
			mdao.addSocialMember(mdto);
			System.out.println("회원가입 처리");
		}
		
		// 이메일과 socialType으로 회원번호를 가져와 세션에 저장한다.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", loginEmail);
		map.put("socialType", socialType);
		
		int loginSeq = mdao.getMemberIdWithSocial(map);
		session.setAttribute("loginSeq", loginSeq);
		session.setAttribute("loginName", loginName);
		session.setAttribute("loginPicture", loginPicture);
		
	}
	
	@RequestMapping(value="/ajax_twocategory.vs", method=RequestMethod.GET)
	public String ajaxTwoCategory(HttpServletRequest req, 
			@RequestParam String oneCategorySeq) {

		ArrayList<Object> twoCategoryList = mdao.getTwoCategory(Integer.parseInt(oneCategorySeq));
		
		req.setAttribute("twoCategoryList", twoCategoryList);
		
		return "/member/twocategory.jsp"; 
	}
	
	@RequestMapping(value="/adminLogin.vs", method=RequestMethod.POST)
	public String adminLogin(
			@RequestParam String id,
			@RequestParam String pw,
			HttpServletRequest req) {
		
		HashMap<String, Object> adMap = new HashMap<String, Object>();
		adMap.put("id", id);
		adMap.put("pw", pw);
		
		int result = mdao.adminLogin(adMap);
		
		if (result == 1) {
			req.getSession().setAttribute("isAdmin", "yes");
			req.getSession().setAttribute("loginSeq", "0");
			req.getSession().setAttribute("loginName", "관리자");
			
		} else {
			req.getSession().setAttribute("isAdmin", "no");
		}
			
		req.setAttribute("result", result);
		
		return "/member/ajaxResult.jsp";
	}

}
