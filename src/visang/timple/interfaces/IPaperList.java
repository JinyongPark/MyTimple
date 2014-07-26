package visang.timple.interfaces;

import java.util.HashMap;
import java.util.List;

import visang.timple.model.PaperListDTO;
import visang.timple.model.PaperListDTO2;

public interface IPaperList {
	List<PaperListDTO> getPaperList(String memberId);
	HashMap<String, Integer> pageBar(String memberId);
	List<PaperListDTO2> getPaperListPerOnePage(HashMap<String, String> map);
	int deletePapers(String[] paperids);
}