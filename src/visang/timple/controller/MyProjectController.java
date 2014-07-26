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

import visang.timple.dao.MyprojectDAO;
import visang.timple.interfaces.IHeader;
import visang.timple.model.MyProjectDTO;
import visang.timple.model.ProjectMemberDTO;

/**
 * @author YJH
 *
 */
@Controller("MyProjectController")
public class MyProjectController {
//	@Resource(name = "MyprojectDAO")
//	MyprojectDAO mdao;
	
	@Resource(name="HeaderDAOSV")
	private IHeader hdao;
	
	@RequestMapping(value="/MyProject.vs", method={RequestMethod.POST, RequestMethod.GET})
	public String MyProjectList(HttpSession session, HttpServletRequest req) {
		
		int memberId = Integer.parseInt(session.getAttribute("loginSeq").toString());
		//int memberId = 1;
		
//		List<MyProjectDTO> myprojectlist = mdao.myprojectList(memberId);
		List<ProjectMemberDTO> myprojectlist = hdao.getMyProject(memberId);
		req.setAttribute("myprojectlist", myprojectlist);
		
		return "/mypage/MyProject.jsp";
	}
}
