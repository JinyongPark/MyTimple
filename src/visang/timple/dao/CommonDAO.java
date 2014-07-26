package visang.timple.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import visang.timple.interfaces.ICommon;


@Repository("dao")
public class CommonDAO implements ICommon {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int insert(String id, Object value) {
		return sqlSession.insert(id, value);
	}

	@Override
	public int update(String id, Object value) {
		return sqlSession.update(id, value);
	}

	@Override
	public int update(String id, Map<String, Object> map) {
		return sqlSession.update(id, map);
	}

	@Override
	public int delete(String id, Object value) {
		return sqlSession.delete(id, value);
	}

	@Override
	public int delete(String id, Map<String, Object> map) {
		return sqlSession.delete(id, map);
	}

	@Override
	public int deleteAll(String id) {
		return sqlSession.delete(id);
	}

	@Override
	public int getIntValue(String id) {
		return ((Integer)sqlSession.selectOne(id)).intValue();
	}

	@Override
	public int getIntValue(String id, Object value) {
		return ((Integer)sqlSession.selectOne(id, value)).intValue();
	}

	@Override
	public int getIntValue(String id, Map<String, Object> map) {
		return ((Integer)sqlSession.selectOne(id, map)).intValue();
	}

	@Override
	public ArrayList<Object> selectList(String id) {
		return (ArrayList<Object>)sqlSession.selectList(id);
	}

	@Override
	public ArrayList<Object> selectList(String id, Object value) {
		return (ArrayList<Object>)sqlSession.selectList(id, value);
	}

	@Override
	public ArrayList<Object> selectList(String id, Map<String, Object> map) {
		return (ArrayList<Object>)sqlSession.selectList(id, map);
	}

	@Override
	public Object selectOne(String id) {
		return sqlSession.selectOne(id);
	}

	@Override
	public Object selectOne(String id, Object value) {
		return sqlSession.selectOne(id, value);
	}

	@Override
	public Object selectOne(String id, Map<String, Object> map) {
		return sqlSession.selectOne(id, map);
	}

}