package visang.timple.interfaces;

import java.util.ArrayList;

import visang.timple.model.BoardAddDTO;

public interface IBoardAdd {

	void add(BoardAddDTO dto);

	ArrayList<Object> name(String seq);

}
