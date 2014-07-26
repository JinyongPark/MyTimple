package visang.timple.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.dao.TeamMainDAO;
import visang.timple.interfaces.IBp;
import visang.timple.interfaces.IProject;
import visang.timple.model.BpDTO;
import visang.timple.model.FileDTO;
import visang.timple.model.TeamBusinessDTO;
import visang.timple.model.TeamMainDTO;
import visang.timple.util.FileManager;


@Controller("teamMainController")
public class TeamMainController {
	
	@Resource(name="teamMainService")
	private TeamMainDAO mdao;
	
	@Resource(name="fileManager")
	private FileManager fileManager; 
	
	
	@Resource(name = "projectDAO")
	private IProject dao;
	
	@Resource(name = "bpDAO")
	private IBp bpdao;	
	
	// 업무 리스트(업무 리스트)
	@RequestMapping(value="/teamMainList.vs", method={RequestMethod.GET})
	public String teamMainList(HttpServletRequest req, HttpSession session) {			
		
		// BP번호 받아오기
		String bpId = req.getParameter("bpid");				
					
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);		
		
		// 프로젝트 타이틀 가져오기
		String seq = session.getAttribute("seq").toString();
		System.out.println(seq);
		String title = dao.title(seq);
		req.setAttribute("title", title);	
		
		// 1. 해당 BP의 업무리스트 가져오기
		
		// 1) 업무 리스트 - 시작날짜, 끝날짜, 제목, 중요도, 이름, 진행상태, 번호
		ArrayList<Object> list = mdao.printList(bpId);			
	
		// 데이터 수정을 위한 공간
		for (int i = 0; i < list.size(); i++) {
			TeamMainDTO tdto = ((TeamMainDTO)list.get(i));
			
		}
		
		// 2. BP이름 가져오기
		String bpName = mdao.BPNamebyBP(bpId);
		req.setAttribute("bpName", bpName); // BP이름
		
		// BP 리스트와 진행률 가져오기
		ArrayList<Object> bpList = bpdao.list(seq);
		int bpSize = bpList.size();
		System.out.println(bpSize);
		String bpPercent = "0";
		for (int i = 0; i < bpSize; i++) {
			BpDTO bpdto = ((BpDTO)(bpList.get(0)));
			System.out.println("bp이름 :"+bpdto.getBname());
			if(bpdto.getBname().equals(bpName)) {
				bpPercent = bpdto.getBpercent();
			}
		}
		req.setAttribute("bpPercent", bpPercent);
		
		// 3. 뷰로 보내기
		req.setAttribute("bpId", bpId);
		req.setAttribute("list", list);		// 업무 리스트 	
		
		
		return "/team/TeamMain.jsp";	
	}
	
	// 업무 디테일(업무 디테일)
	@RequestMapping(value="/teamBusiness.vs", method={RequestMethod.GET})
	public String teamBusiness(HttpServletRequest req,HttpSession session) {		
		
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!						
		String loginSeq = session.getAttribute("loginSeq").toString();
		String loginName = session.getAttribute("loginName").toString();	
		
		req.setAttribute("loginSeq", loginSeq);
		req.setAttribute("loginName", loginName);	
		
		// 프로젝트 타이틀 가져오기
		String seq = session.getAttribute("seq").toString();
		String title = dao.title(seq);
		req.setAttribute("title", title);		
		
		// 1. 업무번호 받아오기
		String businessid = req.getParameter("businessid");	
		
		//5. BP 번호 넘기기
		String bpId = req.getParameter("bpId");
		req.setAttribute("bpId", bpId);
		
		
		// 로그인 회원번호로 팀원번호 가져오기
		HashMap<String, Object> fmap = new HashMap<String, Object>();
		fmap.put("loginSeq", loginSeq);
		fmap.put("businessid", businessid);
		fmap.put("bpid", bpId);
		String teamId = mdao.findTeamSeq(fmap);
		
		req.setAttribute("teamId", teamId);
		
		// 2. 업무 디테일 받아오기
		TeamBusinessDTO bdto = mdao.businessDetail(businessid);	
		
			// 수정일자 처리
			String editdateTemp = bdto.getEditdate();			
			String year = editdateTemp.substring(0, 4);
			String month = editdateTemp.substring(5, 7);
			String day = editdateTemp.substring(8, 10);
			String hour = editdateTemp.substring(11, 13);
			String min = editdateTemp.substring(14, 16);
			String sec = editdateTemp.substring(17, 19);
			String editdate = String.format("최종 수정 : %s년 %s월 %s일 %s시 %s분 %s초",year,month,day,hour,min,sec);
					
			bdto.setEditdate(editdate);
		
		// 3. 파일 리스트
		ArrayList<Object> fileList = mdao.businessDataList(businessid);
		
		// 4. BP 이름		
		String BPName = mdao.BPNamebyBusiness(businessid);	
		
		
		
		
		// 업무 댓글 가져오기
		ArrayList<Object> commentList = mdao.commentList(businessid);
						
		// 6. 뷰로 넘기기		
		req.setAttribute("businessid", businessid);	// 업무번호		
		req.setAttribute("bdto", bdto);				// 업무 디테일			
		req.setAttribute("fileList", fileList);		// 파일 리스트			
		req.setAttribute("BPName", BPName);			// BP이름	
		req.setAttribute("commentList", commentList);
		
		return "/team/teamBusiness.jsp";	
	}
	
	
	// 파일 업로드(업무 디테일) > 파일 업로드 (파일 업로드)
	@RequestMapping(method = { RequestMethod.GET }, value = "/TeamBusinessData.vs")
	public String TeamBusinessData(HttpSession session,HttpServletRequest req) {
		
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!						
		String loginSeq = session.getAttribute("loginSeq").toString();			
		req.setAttribute("loginSeq", loginSeq);		
		
		return "/team/TeamBusinessData.jsp";
	}
			
	// 업무 등록(업무 리스트) > 업무등록(업무등록)
	@RequestMapping(method = { RequestMethod.GET }, value = "/TeamBusinessAdd.vs")
	public String TeamBusinessAdd(HttpServletRequest req, HttpSession session) {
					
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!						
		String loginSeq = session.getAttribute("loginSeq").toString();
		String loginName = session.getAttribute("loginName").toString();	
		
		req.setAttribute("loginSeq", loginSeq);
		req.setAttribute("loginName", loginName);
		
		// 프로젝트 타이틀 가져오기
		String seq = session.getAttribute("seq").toString();
		String title = dao.title(seq);
		req.setAttribute("title", title);
		
		// 1.데이터 받아오기
			//상태구분 종류 받아오기
			ArrayList<Object> statusList = mdao.statusSelector();
			String bpId = req.getParameter("bpId");				
		
		// 2. 팀원 리스트 받아오기
			ArrayList<Object> BpMemList = mdao.searchBpMem(bpId);
			
		// 3. 팀장 확인
			String rank = "2";
			
			// 지금있는 BP의 팀장 회원번호를 찾아옴
			String CMemberid = mdao.rankConfirm(bpId);
			
			// 사용자가 BP담당자 또는 프로젝트담당자인지 확인
			if(CMemberid.equals(loginSeq)) {
				
				rank = "1";			// 팀장& 프로젝트장 확인
			} else {
				rank = "2";			// 팀원 확인
			}
			
		// 4. 회원번호를 팀원번호로 교체
			HashMap<String, Object> cmap = new HashMap<String, Object>();
			cmap.put("bpId", bpId);
			cmap.put("loginSeq", loginSeq);
			String teamSeq = mdao.getTeamSeq(cmap);
			
		// 0. 뷰로 보내기
			req.setAttribute("statusList", statusList); // 업무 상태 목록
			req.setAttribute("rank", rank); 			// 신분
			
			req.setAttribute("loginSeq", loginSeq);		// 사용자 회원번호
			req.setAttribute("loginName", loginName);   // 사용자 이름
			
			req.setAttribute("BpMemList", BpMemList);	// 팀원 리스트
			
			req.setAttribute("teamSeq", teamSeq);		// 팀원 번호
			
			req.setAttribute("bpId", bpId);		// BP 번호
						
			return "/team/TeamBusinessAdd.jsp";
		
	}
	
	// 업무등록(업무등록 처리)
	@RequestMapping(method = { RequestMethod.POST }, value = "/TeamBusinessAddOk.vs")
	public String TeamBusinessAddOk(HttpServletRequest req,HttpSession session) {
				
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!						
		String loginSeq = session.getAttribute("loginSeq").toString();			
		req.setAttribute("loginSeq", loginSeq);		
		
		// 1. 헤쉬 맵 만들기
			HashMap<String, Object> map = new HashMap<String, Object>();
				
		// 2. form으로 전달 받은 것. 가져오기
			String businessSubject = req.getParameter("businessSubject");	// 제목 	
			String startDayCalendar = req.getParameter("startDayCalendar");	// 시작날짜 	
			String endDayCalendar = req.getParameter("endDayCalendar");		// 끝 날짜 	
			String chargePersonId = req.getParameter("chargePersonId");			// 담당자  팀원번호
			String selImportance = req.getParameter("selImportance");		// 중요도	
			String selStatus = req.getParameter("selStatus");				// 현재상태번호
			String businessTextarea = req.getParameter("businessTextarea");	// 업무내용 
							
		// 3. BP번호 가져오기. 담기
			String bpId = req.getParameter("bpId");	
			map.put("bpId", bpId);				
			req.setAttribute("bpId", bpId);
						
		// 4.담기
			map.put("businessSubject", businessSubject);	// 제목
			map.put("startDayCalendar", startDayCalendar);	// 시작날짜
			map.put("endDayCalendar", endDayCalendar);		// 끝날짜
			map.put("chargePersonId", chargePersonId);		// 담당자팀원번호	
			map.put("selImportance", selImportance);		// 증요도
			map.put("selStatus", selStatus);				// 현재상태번호
			map.put("businessTextarea", businessTextarea);	// 내용
					
		// 6. DB로 넘기기(업무 만들기)
		mdao.addBusiness(map);		
		
		// 7. 알람기능 넣기
		// 세션 아이디 넣기
		HashMap<String, Object> alarmMap = new HashMap<String, Object>();		
						
		String subject = (String) map.get("businessSubject");
		String subjectContence = "\"" + subject + "\"" + "업무가 등록 되었습니다.";
		
		alarmMap.put("loginId", loginSeq);
		alarmMap.put("subjectContence", subjectContence);
		
		mdao.addAlarm(alarmMap);
		
		return "/team/TeamBusinessAddOk.jsp";
	}
	
	// 업무 삭제(업무 리스트) > 업무삭제(업무삭제 리스트)
	@RequestMapping(value="/TeamBusinessDelete.vs", method={RequestMethod.GET})
	public String TeamBusinessDelete(HttpServletRequest req,HttpSession session) {			
					
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!						
		String loginSeq = session.getAttribute("loginSeq").toString();					
		req.setAttribute("loginSeq", loginSeq);
		
		String bpId = "1"; // 임시 BP번호   // TODO
		
		// 프로젝트 타이틀 가져오기
		String seq = session.getAttribute("seq").toString();
		String title = dao.title(seq);
		req.setAttribute("title", title);	
		
		ArrayList<Object> list = null;	
		
		// 1. 해당 BP의 업무리스트 가져오기
		list = mdao.printList(bpId);
		
		// 데이터 수정을 위한 공간
		for (int i = 0; i < list.size(); i++) {
			TeamMainDTO tdto = ((TeamMainDTO)list.get(i));
			String subject = tdto.getSubject();
			
			// 현재 수정내용 없음
			tdto.setSubject(subject);
		}
		
		// 2. BP이름 가져오기
		String bpName = mdao.BPNamebyBP(bpId);
		
		// 3. 뷰로 보내기
		req.setAttribute("bpId", bpId);
		req.setAttribute("bpName", bpName); // BP이름
		req.setAttribute("list", list);		// 업무 리스트 	
		
		return "/team/TeamBusinessDelete.jsp";	
	}
	
	//업무삭제(업무삭제 처리)
	@RequestMapping(value="/TeamBusinessDeleteOk.vs", method={RequestMethod.GET})
	public String TeamBusinessDeleteOk(HttpServletRequest req,HttpSession session) {			
				
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);	
		
		String businessid = req.getParameter("businessid");
		
		
		mdao.deleteBusiness(businessid);
		
		return "/team/TeamBusinessDeleteOk.jsp";	
	}
	
	//업무수정(업무리스트 클릭)
	@RequestMapping(value="/teamBusinessEdit.vs", method={RequestMethod.GET})
	public String teamBusinessEdit(HttpServletRequest req,HttpSession session) {
				
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		String loginName = session.getAttribute("loginName").toString();
		
		req.setAttribute("loginSeq", loginSeq);	
		req.setAttribute("loginName", loginName);		
		
		// 프로젝트 타이틀 가져오기
		String seq = session.getAttribute("seq").toString();
		String title = dao.title(seq);
		req.setAttribute("title", title);
		
		// 업무 번호 가져오기
		String businessid = req.getParameter("businessid");		
		
		TeamBusinessDTO bdto = mdao.businessDetail(businessid);	
		
		// 2. 날짜 받아오기			
			// 수정일자 처리
			String editdateTemp = bdto.getEditdate();
			String year = editdateTemp.substring(0, 4);
			String month = editdateTemp.substring(5, 7);
			String day = editdateTemp.substring(8, 10);
			String hour = editdateTemp.substring(11, 13);
			String min = editdateTemp.substring(14, 16);
			String sec = editdateTemp.substring(17, 19);
			String editdate = String.format("최종 수정 : %s년 %s월 %s일 %s시 %s분 %s초",year,month,day,hour,min,sec);
		
		bdto.setEditdate(editdate);			
		
		// 3. 그 업무에 해당하는 BP명 , BP번호 받아오기
		String BPName = mdao.BPNamebyBusiness(businessid);
		String BPId = mdao.findBpid(businessid);
		
		// 4. 파일 리스트
		ArrayList<Object> fileList = mdao.businessDataList(businessid);		
		
		// 5. 업무상태구분  리스트 (select박스 표시용)
		ArrayList<Object> statusList = mdao.statusSelector();		
							
		// 6. 팀원 리스트 받아오기
		ArrayList<Object> BpMemList = mdao.searchBpMem(BPId);
		
		// 7. 팀장 확인
		String rank = "2"; // 초기값 팀원
		
			System.out.println(BPId);
			// 지금있는 BP의 팀장 회원번호를 찾아옴
			String CMemberid = mdao.rankConfirm(BPId);
						
			// 사용자가 BP담당자 또는 프로젝트담당자인지 확인
			if(CMemberid.equals(loginSeq)) {
				
				rank = "1";			// 팀장& 프로젝트장 확인
			} else {
				rank = "2";			// 팀원 확인
			}
		
		// 8. 회원번호를 팀원번호로 교체
		HashMap<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("bpId", BPId);
		cmap.put("loginSeq", loginSeq);
		String teamSeq = mdao.getTeamSeq(cmap);
		
		// 0. 뷰로 보내기
		req.setAttribute("statusList", statusList); // 업무 상태 목록
		req.setAttribute("BpMemList", BpMemList);	// 팀원 리스트
		req.setAttribute("fileList", fileList);		// 파일 리스트
		
			//사용자
			req.setAttribute("rank", rank); 			// 신분
		
			req.setAttribute("loginSeq", loginSeq);		// 사용자 회원번호
			req.setAttribute("loginName", loginName);   // 사용자 이름
			req.setAttribute("teamSeq", teamSeq);  		// 사용자 팀원 번호
			
			// BP
			req.setAttribute("bpId", BPId);				// BP 번호			
			req.setAttribute("BPName", BPName);			// BP 이름	
		
			req.setAttribute("businessid", businessid);	// 업무 번호
			req.setAttribute("bdto", bdto);				// TeamBusinessDTO	
			
				
		return "/team/teamBusinessEdit.jsp";	
	}
	
	//업무수정(업무수정 처리)
	@RequestMapping(value="/teamBusinessEditOk.vs", method={RequestMethod.POST})
	public String teamBusinessEditOk(HttpServletRequest req,HttpSession session) {		
					
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);			
		
		// 1. 필수로 넘겨줘야할 데이터 처리
			String businessid = req.getParameter("businessid");		
			// 뷰로 넘기기		
			req.setAttribute("businessid", businessid);	
				
		// 2. form 데이터 받아오기
		String businessSubject = req.getParameter("businessSubject");	// 제목
		String editPeriodStart = req.getParameter("editPeriodStart");	// 시작날짜
		String editPeriodEnd = req.getParameter("editPeriodEnd");		// 끝날짜
		String selImportance = req.getParameter("selImportance");		// 중요도
		String businessEditText = req.getParameter("businessEditText");	// 내용
		
		String chargePersonId = req.getParameter("chargePersonId");		// 담당자(선택된 팀원)
		String editState = req.getParameter("editState");				// 현재상태
		
		// 3. 담기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("businessSubject", businessSubject);	// 제목
		map.put("editPeriodStart", editPeriodStart);	// 시작
		map.put("editPeriodEnd", editPeriodEnd);		// 끝
		map.put("selImportance", selImportance);		// 중요도
		map.put("businessEditText", businessEditText);	// 내용
		
		map.put("chargePersonId", chargePersonId);		// 담당자
		map.put("editState", editState);				// 현재상태
		
		map.put("businessid",businessid);
		
		// 4. BP번호 찾아 담기
		String BPId = mdao.findBpid(businessid);
		map.put("BPId",BPId);
		
		req.setAttribute("BPId", BPId);
		
		// 5. DB로 넘기기
		mdao.editBusiness(map);	
		
		// 6. 알람기능 넣기
		// 세션 아이디 넣기
		HashMap<String, Object> alarmMap = new HashMap<String, Object>();		
				
		String subject = businessSubject;
		String subjectContence = "\"" + subject + "\"" + "업무의 상태가 변경 되었습니다.";
		
		alarmMap.put("loginId", loginSeq);
		alarmMap.put("subjectContence", subjectContence);
		
		mdao.addAlarm(alarmMap);
		
		return "/team/teamBusinessEditOk.jsp";	
	}
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/TeamUpload.vs")
	public String upload() {		
		
		return "/team/TeamUpload.jsp";
	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/TeamUploadOk.vs")
	public String uploadOk(FileDTO dto, HttpServletRequest request, HttpSession session) {
						
		//파일 업로드할 폴더 지정하기
		// -> WebContent/files 폴더로 지정
		String root = session.getServletContext().getRealPath("/");		
		String path = root + "WebContent/files"; 
		//System.out.println(path);
		
		//저장할 파일명
		String newFileName = "";
		
		//첨부파일이 있는지?		
		if (!dto.getAttach().isEmpty()) {
			
			//첨부파일을 서버에 저장하기
			byte[] bytes = null;
			
			try {
				bytes = dto.getAttach().getBytes();
				
				//실제 파일 저장 & 저장 파일명 반환
				newFileName = fileManager.doFileUpload(bytes, dto.getAttach().getOriginalFilename(), path);
				
				
				//방금 저장한 파일을 dto에 옮겨 담기
				dto.setOrgFileName(dto.getAttach().getOriginalFilename());//X
				dto.setFileName(newFileName);//***저장되는 파일명
				
				
			} catch (Exception e) {
				
			}			
			
		}
		
		/*String OkSign = "1";*/
		
		//dto -> 이름, 숫자, 원본파일명, 저장파일명
		request.setAttribute("dto", dto);
		/*request.setAttribute("OkSign", OkSign);*/
		//dao.add(dto);		
		
		return "/team/TeamUploadOk.jsp";
	}
	
	
	
	//첨부파일 다운로드
	@RequestMapping(method = { RequestMethod.GET }, value = "/TeamDownload.vs")
	public void download(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		
		//파일명 가져오기
		String fileName = request.getParameter("fileName");
		String orgFileName = request.getParameter("orgFileName");
		
		
		//파일 경로
		String root = session.getServletContext().getRealPath("/");
		String path = root + "WebContent/files";
		//System.out.println(path);
		
		
		//다운로드
		boolean flag = false;
		
		flag = fileManager.doFileDownload(fileName, orgFileName, path, response);
		
		
		if (!flag) {
		
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter writer = null;
			
			try {
				writer = response.getWriter();
			} catch (IOException e) {			
			}
			
			writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가능합니다.');</script>");			
			
		}
		
	}
	@RequestMapping(method = { RequestMethod.POST }, value = "/TeamFileDelete.vs")
	public String delete(HttpServletRequest req,HttpSession session) {	// 파일 삭제
							
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);	
		
		String fileName = req.getParameter("fileName");
		String orgFileName = req.getParameter("orgFileName");
		
		// mdao.deleteBusinessFile(fileName);	// DB상에서 삭제		
		System.out.println("삭제기능 일시정지.. 주석처리중");
		
		req.setAttribute("orgFileName", orgFileName);
		return "/team/TeamFileDelete.jsp";
	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/TeamBusinessCommentOk.vs")
	public String TeamBusinessCommentOk(HttpServletRequest req,HttpSession session) {	// 업무 댓글 입력
							
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);
		
		req.setAttribute("businessid", req.getParameter("businessid"));
		// form 받아서 담기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("businessCommentFlame", req.getParameter("businessCommentFlame"));		
		map.put("businessComment", req.getParameter("businessComment"));
		map.put("businessCommentInput", req.getParameter("businessCommentInput"));
		map.put("businessCommentTextarea", req.getParameter("businessCommentTextarea"));
		map.put("businessid", req.getParameter("businessid"));
		map.put("teamid", req.getParameter("teamid"));
		
		mdao.insertBusinessComment(map);
		
		return "/team/TeamBusinessCommentOk.jsp";
	}
	
	@RequestMapping(method = { RequestMethod.GET }, value = "/businesscommentDelete.vs")
	public String businesscommentDelete(HttpServletRequest req,HttpSession session) {	// 업무 댓글 입력
							
		//사용자의 회원번호 받아오기(세션) 세션으로 채우기!!			
		String loginSeq = session.getAttribute("loginSeq").toString();
		req.setAttribute("loginSeq", loginSeq);
		
		String businessid = req.getParameter("businessid");
		req.setAttribute("businessid", businessid);
		
		// form 받아서 담기
		
		String businesscommentid = req.getParameter("businesscommentid");
		
		mdao.deleteBusinessComment(businesscommentid);
		
		return "/team/TeamBusinessComDel.jsp";
		
		
	}
	
	
	
}
