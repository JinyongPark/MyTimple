package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import visang.timple.interfaces.MemoDAO;
import visang.timple.model.MemoDTO;

@Service("MemoDAO")	
public class MemoDAOImpl implements MemoDAO {

	@Autowired
	private CommonDAO cdao;

	@Override
	public ArrayList<Object> rowlist(MemoDTO dto) {
		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
			list = (ArrayList<Object>)cdao.selectList("tel.memolist",dto);
		} catch (Exception e) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			System.out.println("로우넘 리스트" + e.toString());
		}
		return list;
	}

	@Override
	public MemoDTO getPage(MemoDTO dto) {
		MemoDTO pages = new MemoDTO();
		
		try {
			pages = (MemoDTO)cdao.selectOne("tel.memopage", dto);
		} catch (Exception e) {
			System.out.println("페이지 리스트" + e.toString());
		}
		
		return pages;
	}

	@Override
	public String namePwCheck(MemoDTO dto) {
		String namePwCheck = "";
		
		try {
			namePwCheck = (String) cdao.selectOne("tel.memoCheck", dto);
		} catch (Exception e) {
			System.out.println("체크 확인" + e.toString());
		}
		
		return namePwCheck;
	}

	@Override
	public String getTeamId(MemoDTO dto) {
		String teamid =  "";
		
		try {
			teamid = (String) cdao.selectOne("tel.getTeamid", dto);
		} catch (Exception e) {
			System.out.println("팀 아이디 구하기 :" + e.toString());
		}
				
		return teamid;
	}

	@Override
	public void memoWrite(MemoDTO dto) {
		
		try {
			cdao.insert("tel.memoWrite", dto);
		} catch (Exception e) {
			System.out.println("팀 메모 등록 :" + e.toString());
		}	
	}

	@Override
	public void memoFix(MemoDTO dto) {
		
		try {
			cdao.insert("tel.memoFix", dto);
		} catch (Exception e) {
			System.out.println("팀 메모 수정 :" + e.toString());
		}		
	}

	@Override
	public void memoDel(MemoDTO dto) {
		
		try {
			cdao.insert("tel.memoDel", dto);
		} catch (Exception e) {
			System.out.println("팀 메모 삭제 :" + e.toString());
		}		
	}

	@Override
	public int writeMemo(HashMap<String, Object> map) {
		try {
			cdao.insert("Memo.writeMemo", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int deleteMemo(String memoid) {
		try {
			cdao.delete("Memo.deleteMemo", memoid);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}	
}
