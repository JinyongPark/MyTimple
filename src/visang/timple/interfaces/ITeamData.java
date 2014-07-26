package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.TeamDataDTO;

public interface ITeamData {

	ArrayList<Object> list(int projectseq);

	void addData(TeamDataDTO dto);

	void DataDel(String dataId);

	int getdataid(HashMap<String, Object> map);

	void addfilelog(HashMap<String, Object> map);

	void addfilelog2(HashMap<String, Object> map);

	void addfilefog3(HashMap<String, Object> map);

}
