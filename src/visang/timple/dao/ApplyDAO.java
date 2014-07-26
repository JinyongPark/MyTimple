package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IApply;

@Service("applyDAO")
public class ApplyDAO implements IApply{
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<Object> view(String seq) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("applymember.view", seq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public void add(HashMap<String, String> map) {
		try {
			sqlSession.insert("applymember.add", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public void addok(String acceptanceid) {
		try {
			sqlSession.update("applymember.addok", acceptanceid);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public void reject(String acceptanceid) {
		try {
			sqlSession.update("applymember.reject", acceptanceid);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public ArrayList<Object> result(HashMap<String,String>map) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("applymember.result", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public void invite(HashMap<String, String> map) {
		try {
			sqlSession.insert("applymember.invite", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public String seq() {
		String seq = null;
		try {
			seq = sqlSession.selectOne("applymember.seq");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return seq;
	}

	@Override
	public void accept(String pseq) {
		try {
			sqlSession.insert("applymember.accept", pseq);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
}
