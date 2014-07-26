package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.TelDAO;
import visang.timple.model.TelDTO;

@Service("TelDAO")
public class TelDAOImpl implements TelDAO{
	
	@Autowired
	private CommonDAO cdao;
	
	@Override
	public ArrayList<Object> list2(TelDTO dto) {
		ArrayList<Object> list = new ArrayList<Object>();

		try {
			
		list = (ArrayList<Object>) cdao.selectList("tel.selTel2", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString() + "�대쫫 ��젆");
		}
		
		return list;
	}

	
	@Override
	public ArrayList<Object> list3(TelDTO dto) {
		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
		
			list = (ArrayList<Object>)cdao.selectList("tel.selTeam", dto);

		} catch (Exception e) {
			System.out.println(e.toString() + "寃�깋");
		}
		return list;
	}

	@Override
	public String who(String name) {
		
		String who = "";
		
		try {
			who = (String) cdao.selectOne("tel.who", name);
			
		} catch (Exception e) {
			System.out.println(e.toString() );
		}
		
		return who;
	}

	@Override
	public void addMember(String who, String projectseq) {
		try {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("who", who);
			map.put("projectseq", projectseq);	
			cdao.insert("tel.addMember", map);
		} catch (Exception e) {
			System.out.println("硫ㅻ쾭 �꾨줈�앺듃 異붽�" + e.toString());
		}
		
	}

	@Override
	public String check(String who, String projectseq) {
		String check = "";
		
		try {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("who", who);
			map.put("projectseq", projectseq);	
			check = (String) cdao.selectOne("tel.checkmember", map);
		
		} catch (Exception e) {
			System.out.println("硫ㅻ쾭 �덈뒗吏��뺤씤" + e.toString());
		}
		return check;
	}
	
	@Override
	public String passcheck(String memberId, String pw) {
		String checkpass = "";
		
		try {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("memberid", memberId);
			map.put("pw", pw);

			checkpass = (String) cdao.selectOne("tel.PassCheck", map);
		} catch (Exception e) {
			System.out.println("�뷀샇 �뺤씤" + e.toString());
		}
		
		return checkpass;
	}

	@Override
	public void delMember(String teamid) {
		try {
			cdao.selectOne("tel.Del", teamid);
			
		} catch (Exception e) {
			System.out.println("湲���젣" + e.toString());
		}		
	}

	@Override
	public String fixMember(TelDTO tdto) {
		String fix = "";
		try {
			fix = (String) cdao.selectOne("tel.Fix", tdto);
		} catch (Exception e) {
			System.out.println("湲��섏젙" + e.toString());
		}
		return fix;
	}

	@Override
	public ArrayList<Object> rowlist(TelDTO dto) {
		ArrayList<Object> rowlist = new ArrayList<Object>();
		
		try {
			rowlist = (ArrayList<Object>)cdao.selectList("tel.rowlist",dto);
		} catch (Exception e) {
			System.out.println("로우넘 리스트" + e.toString());
		}
		return rowlist;
	}

	@Override
	public TelDTO getPage(TelDTO dto) {
		TelDTO pages = new TelDTO();
		
		try {
			pages = (TelDTO)cdao.selectOne("tel.pages", dto);
		} catch (Exception e) {
			System.out.println("페이지 리스트" + e.toString());
		}
		
		return pages;
	}


	@Override
	public TelDTO getPage2(TelDTO dto) {
		TelDTO pages = new TelDTO();
		
		try {
			pages = (TelDTO)cdao.selectOne("tel.pages2", dto);
		} catch (Exception e) {
			System.out.println("페이지 리스트" + e.toString());
		}
		
		return pages;
	}


	@Override
	public TelDTO getPage3(TelDTO dto) {
		TelDTO pages = new TelDTO();
		
		try {
			pages = (TelDTO)cdao.selectOne("tel.pages3", dto);
		} catch (Exception e) {
			System.out.println("페이지 리스트" + e.toString());
		}
		
		return pages;
	}


	@Override
	public String Team(TelDTO dto) {
		String member = "";
		try {
			member = (String)cdao.selectOne("tel.one",dto);
		} catch (Exception e) {
			System.out.println("팀장인지 맞춰라" + e.toString());
		}
		
		return member;		
	}


	@Override
	public String passcheck2(String pw,String team) {
		String pass = "";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("team", team);		
		
		try {
			pass = (String)cdao.selectOne("tel.onePw",map);
		} catch (Exception e) {
			System.out.println("팀장인지 맞춰라" + e.toString());
		}
		
		return pass;		
	}


	@Override
	public void news(String memseq) {
		try {
			cdao.selectOne("tel.news", memseq);
		} catch (Exception e) {
			System.out.println("팀알림" + e.toString());
		}
		
	}


	@Override
	public String grade(TelDTO dto) {
		String grade = "";
		try {
			grade = (String) cdao.selectOne("tel.grade",dto);
		} catch (Exception e) {
			System.out.println("직위 알림" + e.toString());
		}
		return grade;
	}
}
	
