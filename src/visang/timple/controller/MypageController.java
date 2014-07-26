/**
 * 
 */
package visang.timple.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author YJH
 *
 */
@Controller("mypage")
public class MypageController {
	
	@RequestMapping(value="/mypage.vs")
	public String mypage() {
		return "/mypage/mypage.jsp";
	}
}
