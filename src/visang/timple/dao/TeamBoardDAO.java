package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ITeamBoard;
import visang.timple.model.TeamAddDTO;
import visang.timple.model.TeamBoardDTO;
import visang.timple.model.TeamCommentDTO;
import visang.timple.model.TeamNoticeDTO;

@Service("TBService")
public class TeamBoardDAO implements ITeamBoard{
	
	@Autowired
	private CommonDAO cdao;
	
	@Override
	public ArrayList<Object> list() {
		
		ArrayList<Object> list = null;
		
		try {
						
			list = cdao.selectList("TeamBoard.getlist");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public TeamBoardDTO page(int pageSize) {
		TeamBoardDTO dto = new TeamBoardDTO();
		
		try {
			dto = (TeamBoardDTO)cdao.selectOne("TeamBoard.page", pageSize);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return dto;
	}

	@Override
	public ArrayList<Object> paging(HashMap<String, Integer> map) {
		return cdao.selectList("TeamBoard.paging", map);
	}

	@Override
	public ArrayList<Object> BoardSort(int projectseq) {
		return cdao.selectList("TeamBoard.list1", projectseq);
	}

	@Override
	public void add(TeamBoardDTO dto) {
		cdao.insert("TeamBoard.insert", dto);
		
	}

	@Override
	public TeamBoardDTO content(int teamboardId) {
		return (TeamBoardDTO)cdao.selectOne("TeamBoard.list2", teamboardId);
	}

	@Override
	public ArrayList<Object> searchlist(HashMap<String, Object> map1) {
		
		System.out.println(map1.size());
		
		if (map1.get("col").equals("all")) {
			return cdao.selectList("TeamBoard.searchlist1", map1);			
		}
		else if(map1.get("col").equals("content")){
			return cdao.selectList("TeamBoard.searchlist2", map1);
		}	
		else {
			return cdao.selectList("TeamBoard.searchlist3", map1);
		}	
	}

	@Override
	public ArrayList<Object> comment(int TeamBoardSeq) {
				
		return cdao.selectList("TeamBoard.comment", TeamBoardSeq);
	}

	@Override
	public void addcomment(TeamCommentDTO dto) {
		cdao.insert("TeamBoard.addcomment", dto);		
	}

	@Override
	public void TeamBoardEdit(TeamBoardDTO dto) {
		cdao.update("TeamBoard.edit", dto);
		
	}

	@Override
	public void TeamBoardDel(int teamboardId) {
		cdao.delete("TeamBoard.del1", teamboardId);
		cdao.delete("TeamBoard.del2", teamboardId);	
		cdao.delete("TeamBoard.del", teamboardId);
	}

	@Override
	public void teamcommentdel(int teamcommentId) {
		cdao.delete("TeamBoard.commentdel", teamcommentId);
	}

	@Override
	public int getteamseq(HashMap<String, Object> map2) {
		return (int) cdao.selectOne("TeamBoard.getteamseq", map2);
	}

	@Override
	public ArrayList<Object> getnotice(int teamseq) {
		return cdao.selectList("TeamBoard.notice", teamseq);
	}

	
	@Override
	public TeamNoticeDTO notice(int noticeId) {
		return (TeamNoticeDTO) cdao.selectOne("TeamBoard.notice1", noticeId);
	}

	@Override
	public void TeamNoticeEdit(TeamNoticeDTO dto) {
		cdao.update("TeamBoard.noticeEdit1", dto);
	}

	@Override
	public void TeamNoticeDel(int noticeId) {
		cdao.delete("TeamBoard.noticeDel", noticeId);
	}

	@Override
	public int teamgrade(int teamseq) {		
		return (int) cdao.selectOne("TeamBoard.getgrade", teamseq);
	}

	@Override
	public void AddTeamNotice(HashMap<String, Object> map) {
		cdao.insert("TeamBoard.AddTeamNotice", map);		
	}

	@Override
	public String getTeamBoardSortName(String TeamBoardSortSeq) {
		return (String) cdao.selectOne("TeamBoard.getTeamBoardSortName", TeamBoardSortSeq);
	}

	@Override
	public ArrayList<Object> searchNotice(HashMap<String, Object> map1) {
		if (map1.get("col").equals("all")) {
			return cdao.selectList("TeamBoard.searchlist11", map1);			
		}
		else if(map1.get("col").equals("content")){
			return cdao.selectList("TeamBoard.searchlist12", map1);
		}	
		else {
			return cdao.selectList("TeamBoard.searchlist13", map1);
		}
		
	}
	@Override
	public ArrayList<Object> pagingNotice(HashMap<String, Integer> map) {
		return cdao.selectList("TeamBoard.TeamNotice", map);
	}

	@Override
	public TeamNoticeDTO getnoticecontent(String noticeId) {
		return (TeamNoticeDTO) cdao.selectOne("TeamBoard.NoticeContent", noticeId);
	}

	@Override
	public String searchsortseq(int projectseq) {
		return (String) cdao.selectOne("TeamBoard.searchsortseq", projectseq);
	}

	@Override
	public String madesort(int projectseq) {
		cdao.insert("TeamBoard.madesort", projectseq);
		return (String) cdao.selectOne("TeamBoard.searchsortseq", projectseq);
	}

	@Override
	public void addread(String teamboardId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int read = (int) cdao.selectOne("TeamBoard.getread", teamboardId);
		int addread = read + 1;
		map.put("teamboardId", teamboardId);
		map.put("addread", addread);
		cdao.update("TeamBoard.addread", map);
	}

	@Override
	public String getprojectname(int projectseq) {
		return (String) cdao.selectOne("TeamBoard.projectname", projectseq);
	}
	
}
