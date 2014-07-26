package visang.timple.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import visang.timple.dao.ProDAO;
import visang.timple.interfaces.IProject;
import visang.timple.model.ProjectCalendarDTO;


@Controller("ProjectCalendarController")
public class ProjectCalendarController {


	
	@Resource(name="ProDAO")
	private ProDAO dao;
	
	@Resource(name = "projectDAO")
	private IProject pdao;
	
	
	@RequestMapping(value="/Calendar.vs")			
	public String projectCalendar(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		ArrayList<Object> list = null;		
		//ArrayList<Object> namelist = null;

		
		
		String loginseq = session.getAttribute("loginSeq").toString();
		String projectseq = session.getAttribute("seq").toString();
		
		
		
		// 프로젝트 타이틀 가져오기
		String title = pdao.title(projectseq);
		
		request.setAttribute("title", title);
		
		
		
		System.out.println(loginseq);
		
		
		
		if(projectseq == null){
		
		list = (ArrayList<Object>)dao.CalendarList(loginseq);
		//namelist = (ArrayList<Object>)dao.nameList(loginseq);
		
		
		
		
		//�޷¿� ������ ����ϱ� ���� list
		request.setAttribute("list", list);
		
		//select �ڽ��� ������ �� ������Ʈ��
		//request.setAttribute("namelist", namelist);
		
		
		
		
		}else if(projectseq != null) {
			
			
			
			
		list = (ArrayList<Object>)dao.oneprojectList(loginseq, projectseq);  	
		//namelist = (ArrayList<Object>)dao.nameList(loginseq);	
		
		
		
		
		//�޷¿� ���õ� ������Ʈ�� ������ ����ϱ� ���� ����Ʈ
		request.setAttribute("list", list);
		
		
		//select �ڽ��� ������ �� ������Ʈ��
		//request.setAttribute("namelist", namelist);
			
			
				
		}
		
		System.out.println(list);
	
	    return "/projects/Calendar.jsp";
	
	}
	
	
	
	
	
	@RequestMapping(value="/CalendarInsert.vs")			
	public String CalendarInsert(ProjectCalendarDTO dto,  HttpServletRequest request) {
	
	//calendar���̺��� ������
	int calendarid;	
	String teamseq;	
	
	dao.calendarinsert(dto);
	
	
	//���⼭ ��� insert�� ���̺��� ���� ���� ū �⺻Ű ��������
	
	calendarid=dao.calendarid();
	
	
	String cdrid = String.valueOf(calendarid);
	
	teamseq=request.getParameter("projectseq");
	

	
	//teamcalendar���̺? ������ �߰�
	dao.teamcalendarinsert(cdrid, teamseq);
	
	
		
	
	return "/Calendar.vs";
	
	
	
	}
	
	
	
	
	

	@RequestMapping(value="/Calendardelete.vs")			
	public String Calendardelete(HttpServletRequest request) {

	
	String projectseq =request.getParameter("projectseq");		
	String deleteday = request.getParameter("deleteday");	
	
		
	
	
	
	
	//calendar  ���̺��� �⺻Ű ������
    String calseq =  String.valueOf(dao.getcalendarid(deleteday , projectseq));	
		
   
	//teamcalendar ���̺��� �⺻Ű ������ 	
    String teamcalseq = String.valueOf( dao.getteamcalendarid(calseq, projectseq));
    
    
    //teamcalenar �� �ش� ���ڵ� �����ϱ� 
    dao.deleteteamcalseq(teamcalseq);
    
    
    dao.deletecalseq(calseq);
    
    
	
	return "/Calendar.vs";
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
