package visang.timple.interfaces;

import java.util.ArrayList;

import visang.timple.model.PlanDTO;

public interface IBplan {

	void add(PlanDTO dto);

	ArrayList<Object> name(String seq);

}
