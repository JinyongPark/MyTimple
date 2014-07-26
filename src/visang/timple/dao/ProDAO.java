package visang.timple.dao;



import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IPro;
import visang.timple.model.ProjectCalendarDTO;
import visang.timple.model.ProjectPaperDTO;



@Service("ProDAO")
public class ProDAO implements IPro {


	
	@Autowired
	private CommonDAO cdao;
	
	    
	
    public ArrayList<Object> list(Integer page) {
		
		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
			
			list = (ArrayList<Object>)cdao.selectList("pro.list", page);
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
		
	}
	

 
    public ArrayList<Object> search(String search) {
		
		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
			
			   HashMap<String, String> map = new HashMap<String,String>();
			   map.put("search", search);
				
			   System.out.println("map:" + map.get("search"));

			
		   list= (ArrayList<Object>)cdao.selectList("pro.search", map);
			
		
		     
		   
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
		
	}
    
    
    
    public Object detail(Integer projectid) {
			  		   		   
  		   return cdao.selectOne("pro.detail", projectid);
  	}

    
    
    
    public Integer teamCnt(Integer projectid) {
		
  		int cnt = 0;
    	
  		try {
  			
  		  cnt = cdao.getIntValue("pro.teamcnt", projectid);
  			
  		   
  		   
  		   
  		} catch (Exception e) {
  			
  			System.out.println(e.toString());
  		}
  		
  		return cnt;
  		
  	}

	public void paperadd(ProjectPaperDTO dto) {
		
		try{
			
			cdao.insert("pro.paperadd", dto);  
					
		}catch (Exception e){
				
		}
			
		// TODO Auto-generated method stub	
	}



	public Integer paperid() {
		
		int paperid=0;
		
		
		
		try{
			
			
			paperid=cdao.getIntValue("pro.paperid");
			
		
		}catch(Exception e){
			
		}
			
		return paperid;
		
	}



	public void acceptance(int paperid) {
		
		try {
			
			cdao.insert("pro.acceptance", paperid); 
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}



	
	//ĵ���� ���
	public ArrayList<Object> CalendarList(String loginseq) {


		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
			
			
			HashMap<String, String> map = new HashMap<String,String>();
			map.put("loginseq", loginseq);
			
			
			list= (ArrayList<Object>)cdao.selectList("pro.calendar", map);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}


    //������Ʈ �̸� ���
	public ArrayList<Object> nameList(String loginseq) {
		
		
		
		ArrayList<Object> namelist = new ArrayList<Object>();
		
		try {
			
			
			HashMap<String, String> map = new HashMap<String,String>();
			map.put("loginseq", loginseq);
			
			
			namelist= (ArrayList<Object>)cdao.selectList("pro.namelist", map); 
			
			
		} catch (Exception e) {
			
			
			
			// TODO: handle exception
		}
		
		
		
		
		
		return namelist;
	}



	public ArrayList<Object> oneprojectList(String loginseq, String projectseq) {
		
		
		ArrayList<Object> oneprojectlist = new ArrayList<Object>();
		
		
		try {
			
			HashMap<String, String> map = new HashMap<String,String>();
			map.put("loginseq", loginseq);
			map.put("projectseq", projectseq);
			
			
			

			oneprojectlist= (ArrayList<Object>)cdao.selectList("pro.oneprojectlist", map);
			
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
		return oneprojectlist;
	}



  


    //calendar ���̺��� ������ ��ȯ�ϱ�
	
	public int calendarid() {
		
		
	   int calendarid=0;
		
	   
		try{
		
			
			
			
			calendarid=cdao.getIntValue("pro.calendarid");
			
		
		}catch(Exception e){
			
		}
			
		return calendarid;
		
	}


	
	

	public void teamcalendarinsert(String cdrid, String teamseq) {


		
	try {
		
		
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("cdrid", cdrid);
		map.put("teamseq", teamseq);
		
			
	    cdao.insert("pro.teamcalendarinsert", map); 
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
			
	}



	public Integer getcalendarid(String deleteday, String projectseq) {
		
		
		
	    int calendarid=0;
  		
		try {
  			
	  		   HashMap<String, String> map = new HashMap<String,String>();
	  		   map.put("deleteday", deleteday);
	  		   map.put("projectseq", projectseq);
	  		   
	  		   
	  		   calendarid = cdao.getIntValue("pro.getcalendarid", map);
	  		   		   
	  		 		
	  		    	  
	  		} catch (Exception e) {
	  			
	  			System.out.println(e.toString());
	  		}
		
		return calendarid;
		
	}



	
	public Integer getteamcalendarid(String calseq, String projectseq) {
		
		
		
		 int teamcalendarid=0;
	  		
			try {
	  			
		  		   HashMap<String, String> map = new HashMap<String,String>();
		  		   map.put("calseq", calseq);
		  		   map.put("projectseq", projectseq);
		  		   
		  		   
		  		   teamcalendarid = cdao.getIntValue("pro.getteamcalendarid", map);
		  		   		   
		  		 		
		  		    	  
		  		} catch (Exception e) {
		  			
		  			System.out.println(e.toString());
		  		}
			
			return teamcalendarid;
		
	}



	
	public void deleteteamcalseq(String teamcalseq) {
		
		
		
		
		try {
			
			   HashMap<String, String> map = new HashMap<String,String>();
	  		   map.put("teamcalseq", teamcalseq);
	  		 
	  		   
	  		   cdao.delete("pro.deleteteamcalseq", map);   
	  		   
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}



	public void deletecalseq(String calseq) {
		
				
		try {
			
			   HashMap<String, String> map = new HashMap<String,String>();
	  		   map.put("calseq", calseq);
	  		 
	  		   
	  		   cdao.delete("pro.deletecalseq", map);  
	  		   
		} catch (Exception e) {
			// TODO: handle exception
		}
				
	}
	
	
	
	public void calendarinsert(ProjectCalendarDTO dto) {
		
		
        try{
			
			cdao.insert("pro.calendarinsert", dto);
			
			
		}catch (Exception e){
			
			
			
		}
		
			
		// TODO Auto-generated method stub
		
	}
	
	



	
	
}
