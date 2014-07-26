package visang.timple.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IBp;


@Service("bpDAO")
public class BpDAO implements IBp{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ArrayList<Object> list(String seq) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("project.bp", seq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
