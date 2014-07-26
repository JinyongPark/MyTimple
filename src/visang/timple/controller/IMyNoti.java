package visang.timple.controller;

import java.util.List;

import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;

public interface IMyNoti {
	public List<NotiListDTO> notiList(int memberId);

	public List<PaperListDTO> paperList(int memberId);
}
