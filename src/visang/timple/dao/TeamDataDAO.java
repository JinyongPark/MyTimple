package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ITeamData;
import visang.timple.model.TeamDataDTO;

@Service("TDService")
public class TeamDataDAO implements ITeamData{

	@Autowired
	private CommonDAO cdao;	
	
	@Override
	public ArrayList<Object> list(int projectseq) {
		return cdao.selectList("TeamData.list1", projectseq);
	}

	@Override
	public void addData(TeamDataDTO dto) {
		cdao.insert("TeamData.insert1", dto);		
	}

	@Override
	public void DataDel(String dataId) {
		cdao.delete("TeamData.delete1", dataId);
	}

	@Override
	public int getdataid(HashMap<String, Object> map) {
		return (int) cdao.selectOne("TeamData.select1", map);
	}

	@Override
	public void addfilelog(HashMap<String, Object> map) {
		cdao.insert("TeamData.insert2", map);
		
	}

	@Override
	public void addfilelog2(HashMap<String, Object> map) {
		cdao.insert("TeamData.insert3", map);	
	}

	@Override
	public void addfilefog3(HashMap<String, Object> map) {
		cdao.insert("TeamData.insert4", map);		
	}
	
}
