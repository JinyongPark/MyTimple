package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.MemoDTO;

public interface MemoDAO {

	ArrayList<Object> rowlist(MemoDTO dto);

	MemoDTO getPage(MemoDTO dto);

	String namePwCheck(MemoDTO dto);

	String getTeamId(MemoDTO dto);

	void memoWrite(MemoDTO dto);

	void memoFix(MemoDTO dto);

	void memoDel(MemoDTO dto);

	int writeMemo(HashMap<String, Object> map);

	int deleteMemo(String memoid);

}
