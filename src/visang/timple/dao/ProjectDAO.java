package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IProject;
import visang.timple.model.ProjectDTO;

@Service("projectDAO")
public class ProjectDAO implements IProject{
	
	//myBatis �묒뾽 媛앹껜�앹꽦
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	//�꾨줈�앺듃 �앹꽦�섍린
	@Override
	public void add(ProjectDTO dto) {
		try {
			//myBatis �묒뾽
			sqlSession.insert("project.add", dto);   
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	//理쒓렐 �앹꽦���꾨줈�앺듃 踰덊샇 媛�졇�ㅺ린(�꾨줈�앺듃 �앹꽦����옣 �깅줉 ���ъ슜)
	@Override
	public String seq() {
		String seq = null;
		try {
			seq = sqlSession.selectOne("project.seq");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return seq;
	}
	
	//�꾨줈�앺듃 ��씠��媛�졇�ㅺ린
	@Override
	public String title(String seq) {
		String title = null;
		try {
			title = sqlSession.selectOne("project.title", seq);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return title;
	}

	@Override
	public float percent(String seq) {
		float percent = 0;
		float total = 0;
		float comple = 0;
		
		try {
			total = sqlSession.selectOne("project.total", seq);
			comple = sqlSession.selectOne("project.comple", seq);					
			percent = (comple/total)*100;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return percent;
	}
	
	//�ㅻ뒛���쇱젙媛�졇�ㅺ린
	@Override
	public ArrayList<Object> list(HashMap<String, String> map) {
		ArrayList<Object> list = null;
		try {
			list = (ArrayList<Object>)sqlSession.selectList("project.calendar", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public float bpercent(HashMap<String,String>map2) {
		float percent = 0;
		float total = 0;
		float comple = 0;
		
		try {
			total = sqlSession.selectOne("project.bptotal", map2);
			comple = sqlSession.selectOne("project.bpcomple", map2);
			percent = (comple/total)*100;
	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return percent;
	}

	
}
