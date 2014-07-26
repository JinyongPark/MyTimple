package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.TeamBoardDTO;
import visang.timple.model.TeamCommentDTO;
import visang.timple.model.TeamNoticeDTO;


public interface ITeamBoard {

	ArrayList<Object> list();

	TeamBoardDTO page(int pageSize);

	ArrayList<Object> paging(HashMap<String, Integer> map);

	ArrayList<Object> BoardSort(int projectseq);

	void add(TeamBoardDTO dto);

	TeamBoardDTO content(int parseInt);

	ArrayList<Object> searchlist(HashMap<String, Object> map1);

	ArrayList<Object> comment(int parseInt);

	void addcomment(TeamCommentDTO dto);

	void TeamBoardEdit(TeamBoardDTO dto);

	void TeamBoardDel(int i);

	void teamcommentdel(int teamcommentId);

	int getteamseq(HashMap<String, Object> map2);

	ArrayList<Object> getnotice(int teamseq);

	TeamNoticeDTO notice(int noticeId);

	void TeamNoticeEdit(TeamNoticeDTO dto);

	void TeamNoticeDel(int noticeId);

	int teamgrade(int teamseq);

	void AddTeamNotice(HashMap<String, Object> map);

	String getTeamBoardSortName(String TeamBoardSortSeq);

	ArrayList<Object> searchNotice(HashMap<String, Object> map1);

	ArrayList<Object> pagingNotice(HashMap<String, Integer> map);

	TeamNoticeDTO getnoticecontent(String noticeId);

	String searchsortseq(int projectseq);

	String madesort(int projectseq);

	void addread(String teamboardId);

	String getprojectname(int projectseq);

		
}
