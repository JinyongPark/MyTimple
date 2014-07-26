package visang.timple.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import visang.timple.interfaces.IHeader;
import visang.timple.model.FriendsListDTO;
import visang.timple.model.MemoDTO;
import visang.timple.model.NotiListDTO;
import visang.timple.model.PaperListDTO;
import visang.timple.model.ProjectMemberDTO;

@Service("HeaderDAOSV")
public class HeaderDAO implements IHeader {

	@Autowired
	private SqlSession sqlSession;

	public void setSqlSessionTemplate(SqlSession sqlSession) {

		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProjectMemberDTO> getMyProject(int memberId) {
		List<ProjectMemberDTO> list = new ArrayList<ProjectMemberDTO>();

		try {
			list = sqlSession.selectList("header.getMyProject", memberId);
		} catch (Exception e) {
			// System.out.println("getMyProject ERR : " + e);
		} finally {
			// sqlSession.close();
		}

		return list;
	}

	@Override
	public ArrayList<Object> getMember(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FriendsListDTO> getFriendsList(int memberId) {
		List<FriendsListDTO> list = new ArrayList<FriendsListDTO>();

		try {
			list = sqlSession.selectList("header.getFriendList", memberId);
		} catch (Exception e) {
			// System.out.println("getFriendList ERR : " + e);
		}

		return list;
	}

	@Override
	public List<PaperListDTO> getPaperList(int memberId) {
		List<PaperListDTO> list = new ArrayList<PaperListDTO>();

		try {
			list = sqlSession.selectList("header.getPaperList", memberId);
		} catch (Exception e) {
			// System.out.println("getPaperLisr ERR : " + e);
		}
		return list;
	}

	@Override
	public List<NotiListDTO> getNotiList(int memberId) {
		List<NotiListDTO> list = new ArrayList<NotiListDTO>();

		try {
			list = sqlSession.selectList("header.getNotiList", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	@Override
	public List<MemoDTO> getMemoList(int memberId) {
		List<MemoDTO> list = new ArrayList<MemoDTO>();

		try {
			list = sqlSession.selectList("header.getMemoList", memberId);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	@Override
	public void updateNoti(int id) {
		try {
			sqlSession.update("header.updateNoti", id);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public int insertPaper(String from, String to, String content) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("from", from);
		map.put("to", to);
		map.put("content", content);
		try {
			return sqlSession.insert("Paper.sendPaper", map);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int unfriend(HashMap<String, Integer> map) {

		try {
			sqlSession.delete("header.unfriend", map);

		} catch (Exception e) {

		}
		return 0;
	}

	@Override
	public List<PaperListDTO> getPaperListAtNoti(int memberId) {
		List<PaperListDTO> list = new ArrayList<PaperListDTO>();

		try {
			list = sqlSession.selectList("header.getPaperListAtNoti", memberId);
		} catch (Exception e) {
			// System.out.println("getPaperLisr ERR : " + e);
		}
		return list;
	}

	@Override
	public int addFriend(HashMap<String, Integer> map) {
		
		try {
			sqlSession.insert("header.addFriend1", map);
			sqlSession.insert("header.addFriend2", map);
			sqlSession.update("header.addFriendAcceptUpdate", map);
			return 1;
		} catch (Exception e) {
			return 0;
		}	
	}

	@Override
	public int addFriendReject(HashMap<String, Integer> map) {
		
		try {
			sqlSession.insert("header.addFriendReject", map);
			sqlSession.update("header.addFriendRejectUpdate", map);
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int addRejectOk(HashMap<String, Integer> map) {
		
		try {
			sqlSession.insert("project.addReject", map);
			sqlSession.update("project.addRejectUpdate", map);
			
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
}
