/**
 * 
 */
package visang.timple.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IMyProject;
import visang.timple.model.MyProjectDTO;

/**
 * @author YJH
 *
 */
@Service("MyprojectDAO")
public class MyprojectDAO implements IMyProject {

	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession) {
		
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MyProjectDTO> myprojectList(int memberId) {
		
		List<MyProjectDTO> list = new ArrayList<MyProjectDTO>();
		
		try {
			list = sqlSession.selectList("myproject.myprojectlist", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
}
