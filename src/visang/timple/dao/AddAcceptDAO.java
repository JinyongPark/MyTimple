/**
 * 
 */
package visang.timple.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IaddAccept;

/**
 * @author YJH
 *
 */
@Service("addAcceptDAO")
public class AddAcceptDAO implements IaddAccept {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSessionTemplate(SqlSession sqlSession) {

		this.sqlSession = sqlSession;
	}
	
	@Override
	public int addAccept(HashMap<String, Integer> map) {
		
		int result = 0;
		
		try {
			sqlSession.insert("project.acceptInvite", map);
			sqlSession.update("project.addAcceptUpdate", map);
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}
