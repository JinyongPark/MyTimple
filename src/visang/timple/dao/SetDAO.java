package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ISet;
import visang.timple.model.BpDTO;
import visang.timple.model.OrderDTO;
import visang.timple.model.ThemeDTO;

@Service("SetDAO")
public class SetDAO implements ISet {

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public OrderDTO selectList(OrderDTO dto) {
		
		try {
			
			sqlSession.selectList("Setting.selectOrder", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	
	@Override
	public ThemeDTO update(ThemeDTO dto) {
			
		try {
			
		sqlSession.update("Setting.update", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString()); 
		}
		
		return dto;
	}
	
	@Override
	public HashMap<String, Object> orderupdate(HashMap<String, Object> map) {
		
		try {
			
			sqlSession.update("Setting.orderupdate", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return map;
	}
	
	@Override
	public ArrayList<Object> list(String seq) {
		
		ArrayList<Object> list = null;
		
		try {
			
			list = (ArrayList<Object>)sqlSession.selectList("Setting.bpselect", seq);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
		
	}
	
	@Override
	public void BpUpdate(HashMap<String, Object> map) {
		
		try {
			
			sqlSession.update("Setting.BpUpdate", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	@Override
	public void business(String bpid) {
		
		try {
			
			sqlSession.delete("Setting.business", bpid);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}
	
	@Override
	public void teambp(String bpid) {
		
		try {
			
			sqlSession.delete("Setting.teambp", bpid);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}
	
	@Override
	public void Bpdelete(String bpid) {
		
		try {
			
			sqlSession.delete("Setting.Bpdelete", bpid);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	@Override
	public ArrayList<Object> Projectname(String seq) {
ArrayList<Object> list = null;
		
		try {
			
			list = (ArrayList<Object>)sqlSession.selectList("Setting.proselect", seq);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	
	@Override
	public void proupdate(HashMap<String, Object> map) {
		
		try {
			
			sqlSession.update("Setting.proupdate", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public String Themelist(String seq) {
		
		String skin = "";
		
		try {
			
		skin = sqlSession.selectOne("Setting.selectTheme", seq);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return skin;
	}
	
	@Override
	public String Grade(HashMap<String, Object> map) {
		
		String grade = "";
		
		try {
			
			grade = sqlSession.selectOne("Setting.selectGrade", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return grade;
	}


	@Override
	public String SetList(HashMap<String, Object> sidename) {
		
		String name="";
		
		try {
			
			name = sqlSession.selectOne("Setting.setList", sidename);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return name;
	}


}




