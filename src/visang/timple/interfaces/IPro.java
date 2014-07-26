package visang.timple.interfaces;

import java.util.ArrayList;

import visang.timple.model.ProjectCalendarDTO;
import visang.timple.model.ProjectPaperDTO;

public interface IPro {

	
	 public ArrayList<Object> list(Integer page);
	
	  public ArrayList<Object> search(String search);

	  public Object detail(Integer projectid);
	  
	  public Integer teamCnt(Integer projectid);
	  
	  
	  
	  
	  public void paperadd(ProjectPaperDTO dto) ;
	  
	  public Integer paperid();
	  
	  public void acceptance(int paperid);
	  
	  
	  
	  public ArrayList<Object> CalendarList(String loginseq);
	  
	  
	  public ArrayList<Object> nameList(String loginseq);
	  
	  
	  public ArrayList<Object> oneprojectList(String loginseq, String projectseq);
	  
	  
	  
	  public void calendarinsert(ProjectCalendarDTO dto);
	  
	  
	  public int calendarid() ;
	  
	  public void teamcalendarinsert(String cdrid, String teamseq);
	  
	  
	  public Integer getcalendarid(String deleteday, String projectseq);
	  
	  
	  public Integer getteamcalendarid(String calseq, String projectseq) ;
			
			
	  public void deleteteamcalseq(String teamcalseq) ;
			
	  public void deletecalseq(String calseq);
			
	  
	  
	  
}
