package visang.timple.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.interfaces.MemoDAO;
import visang.timple.model.MemoDTO;

@Controller("MemoPOST")
public class MemoPOST {

	@Resource(name = "MemoDAO")
	private MemoDAO dao;
	
	@RequestMapping(value = "/team/MemoPOST.vs", method = RequestMethod.POST)
	public String selTel(HttpServletRequest request, MemoDTO dto, HttpSession session) {
				
	String ment = "";	
    
	String mem = (String) session.getAttribute("loginSeq").toString();

	dto.setTeamseq(mem);
	
    dto.setMemseq(session.getAttribute("loginSeq").toString()); // 세션 멤버 번호
    String project = (String) session.getAttribute("seq");
    dto.setProjectseq(project);
	    
	
	System.out.println("값 확인하기 ㅇㅇㅇㅇㅇㅇㅇㅇ" + dto.getTeamseq());
	
	// 이름 확인 및 암호 확인
	String namePwCheck = dao.namePwCheck(dto);
	String num = dto.getNum();
	
	if (namePwCheck.equals("1")) {
		if (num.equals("1")){

			// 글 엔터값 처리
			String content = dto.getContent();
			content = content.replace("\r\n", "<br />");
			dto.setContent(content);
			
			// 메모 쓰기
			dao.memoWrite(dto);
			ment = "1";
		} else if (num.equals("2")) {
			dao.memoFix(dto);
			ment = "2";					
		} else if (num.equals("3")) {
			dao.memoDel(dto);
			ment = "3";
		}
	} else {
		ment = "0";
	}
	request.setAttribute("ment", ment);
	return "../team/TeamMemoPOST.jsp";
	}
	
}
