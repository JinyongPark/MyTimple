package visang.timple.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.controller.IMyNoti;
import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;

@Service("MyNotiControllerSV")
public class MyNotiDAO implements IMyNoti {
	@Autowired
	SqlSession sqlSession;
	
	public void setSqlSessionTemplate(SqlSession sqlSession) {

		this.sqlSession = sqlSession;
	}
	
	public List<NotiListDTO> notiList(int memberId) {
		
		List<NotiListDTO> list = new ArrayList<NotiListDTO>();
		
		try {
			list = sqlSession.selectList("Notice.allNotiList", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<PaperListDTO> paperList(int memberId) {
		
		List<PaperListDTO> list = new ArrayList<PaperListDTO>();
		
		try {
			list = sqlSession.selectList("header.getPaperListAtNoti", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
}
