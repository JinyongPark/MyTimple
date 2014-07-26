package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IMemoList;
import visang.timple.model.MemoListDTO;

@Service("MemoListSV")
public class MemoListDAO implements IMemoList {

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession) {
		
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MemoListDTO> getMemoListPerOnePage(HashMap<String, String> map) {
		List<MemoListDTO> list = new ArrayList<MemoListDTO>();
		
		try {
			list = sqlSession.selectList("Memo.MemoList", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}

	@Override
	public HashMap<String, Integer> pageBar(String memberId) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		try {
			map = sqlSession.selectOne("Memo.memoPageBar", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return map;
	}
	
}
