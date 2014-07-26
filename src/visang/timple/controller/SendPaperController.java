/**
 * 
 */
package visang.timple.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.interfaces.IHeader;

/**
 * @author YJH
 * 
 */
@Controller("sendPaper")
public class SendPaperController {

	@Resource(name = "HeaderDAOSV")
	private IHeader hdao;

	@RequestMapping(value = "/sendPaperOk.vs", method = RequestMethod.POST)
	public String sendPaperOk(HttpServletRequest req, @RequestParam String from, @RequestParam String to, @RequestParam String content) {

		int result_code = 0;

		try {
			result_code = hdao.insertPaper(from, to, content);
		} catch (Exception e) {
			// TODO: handle exception
		}
		req.setAttribute("code", result_code);
		return "/Paper/sendPaperOk.jsp";
	}

	@RequestMapping(value = "/Sendpaper.vs", method = RequestMethod.GET)
	public String sendPaper(HttpServletRequest req, @RequestParam String from, @RequestParam String to, @RequestParam String toname) {
		req.setAttribute("from", from);
		req.setAttribute("to", to);
		req.setAttribute("toname", toname);
		return "/Paper/Paper.jsp";
	}
}
