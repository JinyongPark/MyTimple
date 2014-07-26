/**
 * 
 */
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

/**
 * @author YJH
 *
 */
@Controller("FriendsList")
public class FriendsListController {
	@Resource(name = "HeaderDAOSV")
	private IHeader hdao;

	@RequestMapping(value = "/FriendsList.vs", method = RequestMethod.GET)
	public String friendsList(HttpServletRequest req, HttpSession session) {

		try {
			// List<FriendsListDTO> friendsList = hdao.getFriendsList(memberId);
			List<FriendsListDTO> friendsList = hdao.getFriendsList(Integer
					.parseInt(session.getAttribute("loginSeq").toString()));
			req.setAttribute("Friends", friendsList);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "/mypage/FriendsList.jsp";
	}

	@RequestMapping(value = "/addFriendOk.vs", method = RequestMethod.POST)
	public String addFriendOk(HttpServletRequest req,
			@RequestParam Integer toId, @RequestParam Integer fromId) {

		int result = 0;

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memseq", toId);
		map.put("friendseq", fromId);

		try {
			// result =
			// hdao.unfriend(Integer.parseInt(session.getAttribute("loginSeq").toString()));
			result = hdao.addFriend(map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		req.setAttribute("result", result);
		return "/mypage/unFriendOk.jsp";
	}

	@RequestMapping(value = "/unFriendOk.vs", method = RequestMethod.POST)
	public String unFriendOk(HttpServletRequest req, HttpSession session,
			@RequestParam Integer memseq, @RequestParam Integer friendseq) {

		int result = 0;

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memseq", memseq);
		map.put("friendseq", friendseq);

		try {
			// result =
			// hdao.unfriend(Integer.parseInt(session.getAttribute("loginSeq").toString()));
			result = hdao.unfriend(map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		req.setAttribute("result", result);
		return "/mypage/unFriendOk.jsp";
	}
}
