package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ICommon;
import visang.timple.interfaces.INotice;
import visang.timple.model.NoticeDTO;

@Service("NoticeDaoImpl")
public class NoticeDAO implements INotice {
	
	@Autowired
	private ICommon cdao;
	
	// 게시판 리스트 불러오기
	public ArrayList<Object> list(HashMap<String, Integer> map) {
		return cdao.selectList("Notice.getList", map);
	}

	// 패이징 - 페이지 번호
	public Object pList(int pageSize) {
		return cdao.selectOne("Notice.pList", pageSize);
	}

	// 게시판 내용 출력
	public Object view(String noticeId) {
		return cdao.selectOne("Notice.getView", noticeId);
	}
	
	// 게시판 글쓰기
	public void write(HashMap<String, String> map) {
		cdao.insert("Notice.nInsert", map);
		
	}
	
	// 게시판 글 삭제
	public void del(String noticeId) {
		cdao.delete("Notice.nDel", noticeId);
	}

	// 게시판 글 불러오기
	public Object nUpdateSel(HashMap<String, String> map) {
		
		return cdao.selectOne("Notice.nUpdateSel", map);
	}

	public void nUpdate(HashMap<String, String> map) {
		cdao.update("Notice.nUpdate", map);
	}

	public ArrayList<Object> searchAll(HashMap<String, String> map) {
		return cdao.selectList("Notice.searchAll", map);
	}

	public ArrayList<Object> searchSubject(HashMap<String, String> map) {
		return cdao.selectList("Notice.searchSubject", map);
	}

	public ArrayList<Object> searchContent(HashMap<String, String> map) {
		return cdao.selectList("Notice.searchContent", map);
	}
	
	
}



















