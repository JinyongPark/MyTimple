/**
 * 
 */
package visang.timple.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author YJH
 *
 */
@Controller("Sign_out")
public class Sign_Out {
	
	@RequestMapping(value="/Sign_out.vs")
	public String signout(HttpSession req){
		req.invalidate();
		return "/base/Sign_Out.jsp";
	}
}
