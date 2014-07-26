/**
 * 
 */
package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IPaperList;
import visang.timple.model.PaperListDTO;
import visang.timple.model.PaperListDTO2;

/**
 * @author YJH
 *
 */
@Service("PaperListSV")
public class PaperListDAO implements IPaperList {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSessionTemplate(SqlSession sqlSession) {

		this.sqlSession = sqlSession;
	}

	@Override
	public List<PaperListDTO> getPaperList(String memberId) {
		List<PaperListDTO> list = null;

		try {

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	@Override
	public List<PaperListDTO2> getPaperListPerOnePage(
			HashMap<String, String> map) {

		List<PaperListDTO2> list = new ArrayList<PaperListDTO2>();

		try {
			list = sqlSession.selectList("Paper.sendPaperList", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public HashMap<String, Integer> pageBar(String memberId) {
		HashMap<String, Integer> list = new HashMap<String, Integer>();

		try {
			list = sqlSession.selectOne("Paper.paperPageBar", memberId);
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	public int del(int paperId) {
		int ment = 0;
		try {
			ment = sqlSession.delete("Paper.Del", paperId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ment;
	}

	@Override
	public int deletePapers(String[] paperids) {

		int temp = 0;
		
		try {
			for (int i = 0; i < paperids.length; i++) {
				Object obj = sqlSession.selectOne("Paper.accept", Integer.parseInt(paperids[i]));
				if (temp != 0) {
					sqlSession.delete("Paper.Del1", Integer.parseInt(paperids[i]));
					sqlSession.delete("Paper.Del", Integer.parseInt(paperids[i]));
				} else if(obj == null){
					sqlSession.delete("Paper.Del", Integer.parseInt(paperids[i]));
				}
			}
			return 1;
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}
}