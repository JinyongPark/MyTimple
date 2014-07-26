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
import visang.timple.model.EditMemberDTO;
import visang.timple.model.MemberDTO;
import visang.timple.model.PaperDTO;
import visang.timple.util.Encryption;
import visang.timple.util.FileManager;

@Controller("memberController")
public class MemberController {

	@Resource(name = "memberService")
	private MemberDAO mdao;

	@Resource(name = "fileManager")
	private FileManager fileManager;
 
	@RequestMapping(value = "/login.vs", method = RequestMethod.GET)
	public String login(HttpServletRequest req, HttpSession session,
			@RequestParam String email, @RequestParam String pw) {

		int result = 0;

		if (mdao.emailCheck(email) == 1)
			result++;

		if (result == 1) {

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("pw", pw);

			MemberDTO mdto = mdao.login(map);

			if (mdto != null) {

				session.setAttribute("loginSeq", mdto.getMemberId());
				session.setAttribute("loginName", mdto.getName());
				session.setAttribute("loginPicture", "/images/profile/"+mdto.getFileName());
				result++;
			}
		}

		req.setAttribute("result", result);

		return "/member/ajaxResult.jsp";
	}

	@RequestMapping(value = "/addMember.vs", method = RequestMethod.POST)
	public String addMember(MemberDTO mdto, @RequestParam String questionId,
			@RequestParam String quereply) {

		mdao.addMember(mdto);
		int memseq = mdao.getMemberId(mdto.getEmail());

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("questionId", questionId);
		map.put("quereply", quereply);
		map.put("memseq", memseq);

		mdao.addMemberQuestion(map);

		System.out.println("회원등록 완료");
		return "redirect:/index.vs";
	}

	@RequestMapping(value = "/getMemQuestion.vs", method = RequestMethod.GET)
	public String getMemQuestion(HttpServletRequest req, HttpSession session,
			@RequestParam String name, @RequestParam String email) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);

		HashMap<String, Object> resultMap = mdao.getMemQuestion(map);

		session.setAttribute("tempId", resultMap.get("memberid"));

		req.setAttribute("result", resultMap.get("content"));

		return "/member/ajaxResult.jsp";
	}

	@RequestMapping(value = "/quereplyCheck.vs", method = RequestMethod.GET)
	public String quereplyCheck(HttpServletRequest req, HttpSession session,
			@RequestParam String quereply) {

		Integer memberid = (Integer) session.getAttribute("tempId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("quereply", quereply);
		map.put("memberid", memberid);

		int result = mdao.quereplyCheck(map);

		req.setAttribute("isResult", result);

		if (result == 1) {
			String newPw = Encryption.createPw();

			HashMap<String, Object> pwMap = new HashMap<String, Object>();
			pwMap.put("memberid", memberid);
			pwMap.put("newPw", newPw);

			mdao.resetPw(pwMap);
			req.setAttribute("newPw", newPw);
		}

		return "/member/ajaxPw.jsp";
	}

	@RequestMapping(value = "/emailCheck.vs", method = RequestMethod.GET)
	public String emailCheck(HttpServletRequest req, @RequestParam String email) {

		int result = mdao.emailCheck(email);
		req.setAttribute("result", result);

		return "/member/ajaxResult.jsp";
	}

	@RequestMapping(value = "/sendPaper.vs", method = RequestMethod.POST)
	public String sendPaper(PaperDTO pdto, HttpServletRequest req) {

		pdto.setSendMemSeq((Integer) req.getSession().getAttribute("loginSeq"));
		System.out.println(pdto.toString());
		int result = mdao.sendPaper(pdto);

		// 친구 추가 종류라면 acceptance 테이블에도 insert 해준다.
		if (pdto.getKind() == 3) {
			Integer paperId = mdao.getPaperId();
			mdao.addAcceptance(paperId);
		}

		req.setAttribute("result", result);
		return "/member/formResult.jsp";
	}

	@RequestMapping(value = "/edit_member.vs")
	public String editMember(HttpServletRequest req) {

		EditMemberDTO emdto = (EditMemberDTO) mdao.getMemberInfo((Integer) req
				.getSession().getAttribute("loginSeq"));

		ArrayList<Object> questionList = mdao.getQuestion();
		ArrayList<Object> oneCategoryList = mdao.getOneCategory();
		ArrayList<Object> twoCategoryList = mdao.getTwoCategory(emdto
				.getOneCategorySeq());

		req.setAttribute("member", emdto);
		req.setAttribute("questionList", questionList);
		req.setAttribute("oneCategoryList", oneCategoryList);
		req.setAttribute("twoCategoryList", twoCategoryList);

		return "/mypage/edit_member.jsp";
	}

	@RequestMapping(value = "/editMemberOk.vs", method = RequestMethod.POST)
	public String editMemberOk(MemberDTO mdto, @RequestParam String tel_first,
			@RequestParam String tel_second, @RequestParam String tel_last,
			@RequestParam String questionId, @RequestParam String quereply,
			@RequestParam String twoCategory, @RequestParam String career,
			HttpServletRequest req) {

		Integer memberId = (Integer) req.getSession().getAttribute("loginSeq");
		String tel = tel_first + "-" + tel_second + "-" + tel_last;

		mdto.setMemberId(memberId);
		mdto.setTel(tel);
		System.out.println(mdto.toString());

		// 2. MemQuestion
		HashMap<String, Object> mqMap = new HashMap<String, Object>();
		mqMap.put("memSeq", memberId);
		mqMap.put("questionSeq", questionId);
		mqMap.put("quereply", quereply);
		mdao.editMemQuestion(mqMap);

		// 3. Occupation
		HashMap<String, Object> oMap = new HashMap<String, Object>();
		oMap.put("memSeq", memberId);
		oMap.put("twoCategorySeq", twoCategory);
		oMap.put("career", career);
		mdao.editOccupation(oMap);

		// 4. Profile
		String root = req.getSession().getServletContext().getRealPath("/");
		String path = root + "/images/profile";
		
		// 저장할 파일명
		String newFileName = "";

		// 첨부파일이 있는지?
		if (!mdto.getAttach().isEmpty()) {
			// 첨부파일을 서버에 저장하기
			byte[] bytes = null;
			try {
				bytes = mdto.getAttach().getBytes();
				// 실제 파일 저장 & 저장 파일명 반환
				newFileName = fileManager.doFileUpload(bytes, mdto.getAttach()
						.getOriginalFilename(), path);
				// 방금 저장한 파일을 dto에 옮겨 담기
				mdto.setOrgFileName(req.getParameter("orgFileName")); // (dto.getAttach().getOriginalFilename());//X
				mdto.setFileName(newFileName);// ***저장되는 파일명
				req.getSession().setAttribute("loginPicture", "/images/profile/"+mdto.getFileName());
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		System.out.println("prof : " + mdto.getFileName());
		// 1. Member
		mdao.editMember(mdto);
		return "redirect:/mypage.vs";
	}

}
