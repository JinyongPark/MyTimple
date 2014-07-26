package visang.timple.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.ITeamAdd;
import visang.timple.model.TeamAddDTO;

@Service("teamaddDAO")
public class TeamAddDAO implements ITeamAdd{
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void add(TeamAddDTO tdto, String seq, String mseq) {
		try {
			tdto.setSeq(seq);
			tdto.setMemseq(mseq);
			
			sqlSession.insert("project.madd", tdto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	

}
