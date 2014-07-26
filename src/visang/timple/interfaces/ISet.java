package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

import visang.timple.model.OrderDTO;
import visang.timple.model.ThemeDTO;

public interface ISet {
		
	OrderDTO selectList(OrderDTO dto);
	
	ThemeDTO update(ThemeDTO dto);
	
	HashMap<String, Object> orderupdate(HashMap<String, Object> map);
	
	void BpUpdate(HashMap<String, Object> map);

	void business(String bpid);
	
	void teambp(String bpid);
	
	void Bpdelete(String bpid);

	ArrayList<Object> list(String seq);

	ArrayList<Object> Projectname(String seq);

	void proupdate(HashMap<String, Object> map);

	String Themelist(String seq);
	
	String SetList(HashMap<String, Object> map);

	String Grade(HashMap<String, Object> map);

	



	//void Bpselect(BpDTO dto);

	//void Bpselect(Integer pId);
	

}
