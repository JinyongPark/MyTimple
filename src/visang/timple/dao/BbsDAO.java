package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IBbs;
import visang.timple.interfaces.ICommon;
import visang.timple.model.BbsDTO;

@Service("BbsDaoImpl")
public class BbsDAO implements IBbs {
	
	@Autowired
	private ICommon cdao;
	
	// 게시판 리스트 출력	
	@Override
	public ArrayList<Object> list1() {
		ArrayList<Object> list1 = new ArrayList<Object>();
		list1 = cdao.selectList("Bbs.getList1");
		return list1;
	}
	
	@Override
	public ArrayList<Object> list2() {
		ArrayList<Object> list2 = new ArrayList<Object>();
		list2 = cdao.selectList("Bbs.getList2");
		return list2;
	}
	
	@Override
	public ArrayList<Object> list3() {
	
		ArrayList<Object> list3 = new ArrayList<Object>();
		list3 = cdao.selectList("Bbs.getList3");
		return list3;
	}

	// 페이징 - 리스트 목록 ( 로우넘 )
	public ArrayList<Object> list4(HashMap<String, Integer> map) {
		return cdao.selectList("Bbs.getList4", map);
	}
	
	// 페이징 - 페이지 번호
	public Object pList(int pageSize) {
		return cdao.selectOne("Bbs.pList", pageSize);
	}
	
	
	// 게시판 내용 출력
	public Object view(int boardId) {
		return cdao.selectOne("Bbs.getView", boardId);
	}

	// 게시판 댓글
	public ArrayList<Object> cList(int boardId) {
		return cdao.selectList("Bbs.cList", boardId);
	}
	
	// 게시판 글쓰기
	public Object write(HashMap<String, String> map) {
		return cdao.insert("Bbs.bInsert", map);
	}

	// 게시판 글삭제
	public void del(String boardId) {
		cdao.delete("Bbs.bDel", boardId);
	}
	
	// 글 삭제를 위한 참조 제거
	public void delRef(String boardId) {
		cdao.delete("Bbs.rDel", boardId);
	}
	
	// 게시판 글 추천
	public void recom(String boardId) {
		cdao.update("Bbs.bRecom", boardId);
	}

	// 댓글 삽입
 	public void comment(HashMap<String, String> map) {
 		cdao.insert("Bbs.cInsert", map);
 	}
	
	// 수정위해 글 내용 불러오기
	public Object bUpdateSel(HashMap<String, String> map) {
		return cdao.selectOne("Bbs.bUpdateSel", map);
	}

	public void bUpdate(HashMap<String, String> map) {
		cdao.update("Bbs.bUpdate", map);
 	}

	public ArrayList<Object> searchAll(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchAll", map2);
	}

	public ArrayList<Object> searchName(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchName", map2);
	}
	
	public ArrayList<Object> searchSubject(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchSubject", map2);
	}
	
	public ArrayList<Object> searchContent(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchContent", map2);
	}

	public ArrayList<Object> searchName2(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchName2", map2);
	}

	public ArrayList<Object> searchSubject2(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchSubject2", map2);
	}

	public ArrayList<Object> searchContent2(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchContent2", map2);
	}

	public ArrayList<Object> searchAll2(HashMap<String, String> map2) {
		return cdao.selectList("Bbs.searchAll2", map2);
	}

	public void bCountUp(int boardId) {
		cdao.update("Bbs.bCountUp", boardId);
	}

	public void bCommentDel(HashMap<String, String> map) {
		cdao.update("Bbs.bCommentDel", map);
	}

}













