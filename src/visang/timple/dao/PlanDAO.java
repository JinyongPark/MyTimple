package visang.timple.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IBplan;
import visang.timple.model.PlanDTO;

@Service("planDAO")
public class PlanDAO implements IBplan{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	//Business Plan 추가하기
	@Override
	public void add(PlanDTO dto) {
		try {
			sqlSession.insert("business.add", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public ArrayList<Object> name(String seq) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("business.name", seq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	

}
