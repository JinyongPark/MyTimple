package visang.timple.interfaces;

import java.util.HashMap;
import java.util.List;

import visang.timple.model.MemoListDTO;

public interface IMemoList {

	List<MemoListDTO> getMemoListPerOnePage(HashMap<String, String> map);

	HashMap<String, Integer> pageBar(String memberId);

}
