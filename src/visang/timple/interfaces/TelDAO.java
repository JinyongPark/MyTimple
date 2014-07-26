package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.TelDTO;

public interface TelDAO {
	ArrayList<Object> list2(TelDTO dto);

	ArrayList<Object> list3(TelDTO dto);

	String who(String name);

	void addMember(String who, String projectseq);

	String check(String who, String projectseq);

	String passcheck(String memberId, String pw);

	void delMember(String teamid);

	String fixMember(TelDTO tdto);

	ArrayList<Object> rowlist(TelDTO dto);

	TelDTO getPage(TelDTO dto);

	TelDTO getPage2(TelDTO dto);

	TelDTO getPage3(TelDTO dto);

	String Team(TelDTO dto);

	String passcheck2(String pw,String team);

	void news(String memseq);

	String grade(TelDTO dto);

}
