/**
 * 
 */
package visang.timple.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;

/**
 * @author YJH
 *
 */
@Controller("MyNotiController")
public class MyNotiController {
	@Resource(name="MyNotiControllerSV")
	IMyNoti mdao;
	
	@RequestMapping(value="/myNoti.vs", method=RequestMethod.GET)
	public String MyNoti(HttpServletRequest req, HttpSession session) {
		
		int memberId = Integer.parseInt(session.getAttribute("loginSeq").toString());
		
		List<NotiListDTO> nlist = mdao.notiList(memberId);
		List<PaperListDTO> plist = mdao.paperList(memberId);
		
		req.setAttribute("nlist", nlist);
		req.setAttribute("plist", plist);
		return "/mypage/myNoti.jsp";
	}
	
	
	
}
