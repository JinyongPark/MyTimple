package visang.timple.interfaces;

import java.util.List;

import visang.timple.model.AllNotiListDTO;

public interface IAllNotiList {
	public List<AllNotiListDTO> getAllNotiList(int memberId);
}