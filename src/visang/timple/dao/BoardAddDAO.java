package visang.timple.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IBoardAdd;
import visang.timple.model.BoardAddDTO;

@Service("boardaddDAO")
public class BoardAddDAO implements IBoardAdd {
	
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSessionTemplate(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(BoardAddDTO dto) {
		try {
			sqlSession.insert("boardadd.add", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public ArrayList<Object> name(String seq) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("boardadd.list", seq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
