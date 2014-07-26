package visang.timple.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IJob;

@Service("jobDAO")
public class JobDAO implements IJob{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	@Override
	public ArrayList<Object> one() {
		ArrayList<Object> one = null;
		
		try {
			one = (ArrayList<Object>)sqlSession.selectList("project.one");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return one;
	}

	@Override
	public ArrayList<Object> two(String oneSeq) {
		ArrayList<Object> two = null;
		
		try {
			two = (ArrayList<Object>)sqlSession.selectList("project.two", oneSeq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return two;
	}

}
